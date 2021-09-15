// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <cstring>
#include <iostream>
#include <fstream>
#include <iterator>
#include <assert.h>
#include <ert.h>
//#include <xrt.h>
#include <algorithm>
#include <chrono>
#include <regex>
#include <sstream>
#include <iomanip>
#include <math.h>
#include "xir/graph/graph.hpp"
#include "xir/graph/subgraph.hpp"
#include "json-c/json.h"

#include "dpu_runner.hpp"
#include "xir/tensor/tensor.hpp"
#include "vart/tensor_buffer.hpp"
#include "common/graph.hpp"

#include "vitis/ai/env_config.hpp"
#include "vitis/ai/profiling.hpp"
#include "device_handle.hpp"
#include "trace.hpp"
//#include "vart/trace/trace.hpp"
using namespace std;
using namespace chrono;
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#define BIT(nr) (1 << (nr))

//#define batch_size_ 8
DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")
DEF_ENV_PARAM(XLNX_SHOW_DPU_COUNTER, "0");
DEF_ENV_PARAM(XLNX_ENABLE_DUMP, "0");
DEF_ENV_PARAM(XLNX_ENABLE_DEBUG_MODE, "0");
DEF_ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK, "1");
/*
 * a contiguous memory block is allocated for each requests' I/O
 * layout:
 *  0      : output
 *  3071   : input
 *  153599 : intermediate
 */
//#define XDPU_IO_INPUT_OFFSET      3071
//#define XDPU_IO_OUTPUT_OFFSET        0
//#define XDPU_IO_TOTAL_SIZE    11018751
//static size_t XDPU_IO_INPUT_OFFSET;
//static size_t XDPU_IO_OUTPUT_OFFSET;
//static size_t XDPU_IO_TOTAL_SIZE;
#define DPUREG_MISC_END 0x84
#define DPUREG_CONV_END 0x88
#define DPUREG_SAVE_END 0x8c
#define DPUREG_LOAD_END 0x90
#define DPUREG_MISC_START 0x94
#define DPUREG_CONV_START 0x98
#define DPUREG_SAVE_START 0x9c
#define DPUREG_LOAD_START 0xa0
#define DPUREG_CYCLE_COUNTER 0xa8
#define VERSION_CODE_L 0x1f0
#define VERSION_CODE_H 0x1f4


DpuXmodel::DpuXmodel(const xir::Subgraph *subgraph) : dump_mode_(false),debug_mode_(false) {
  init(subgraph);
}

DpuXmodel::DpuXmodel(const std::string meta): dump_mode_(false),debug_mode_(false) {
  init(meta);
}

DpuXmodel::~DpuXmodel() {
}
void DpuXmodel::init(const xir::Subgraph *subgraph)  {
  if (subgraph->has_attr("device")&&(subgraph->get_attr<std::string>("device")=="DPU")) {
    init_graph(subgraph);
  }
  else
    throw std::runtime_error("Error: subgraph is not supported in DPURunner");

}
void DpuXmodel::init(const std::string &meta) {

  // get directory of meta.json
  size_t slash = meta.find_last_of("/");
  auto dirpath = meta.substr(0, slash);
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     

  // get xmode name
  json_object *modelObj = NULL;
  if (!json_object_object_get_ex(jobj, "filename", &modelObj))
    throw std::runtime_error("Error: missing 'filename' field in meta.json");

  std::string modelName = json_object_get_string(modelObj);
  const string xmodel = dirpath + "/" +modelName;
 
  if (json_object_object_get_ex(jobj, "dump_mode", &modelObj)) {
    dump_mode_ = json_object_get_boolean(modelObj);
  }  
  if (json_object_object_get_ex(jobj, "debug_mode", &modelObj)) {
    debug_mode_ = json_object_get_boolean(modelObj);
  }  

  // Get all subgraphs
  auto graph = xir::Graph::deserialize(xmodel);
  auto root = graph->get_root_subgraph();
  auto children = root->children_topological_sort();
  std::vector<xir::Subgraph*> subgraph;
  for (auto c : children) {
    auto device = c->get_attr<std::string>("device");
    if (device == "DPU") {
      subgraph.emplace_back(c);
    }
  }
  init_graph(subgraph[0]);
}
static const xir::Tensor* find_tensor(const xir::Tensor* in_tensor, const xir::Subgraph* subgraph,bool isInput) {
    auto op_tmp = in_tensor->get_producer();
    auto out = op_tmp->get_output_tensor();
    if ((!isInput)&&(op_tmp->get_type() == "download")) {
      auto input_ops = op_tmp->get_input_ops("input");
      out = input_ops[0]->get_output_tensor();
    } else if (!out->has_attr("reg_id")) {
      auto fanout_ops = op_tmp->get_fanout_ops();
      auto subgraph_ops = subgraph->get_ops();
      auto subgraph_ops1 = std::vector<const xir::Op*>(subgraph_ops.begin(), subgraph_ops.end());
      std::sort(fanout_ops.begin(), fanout_ops.end());
      std::sort(subgraph_ops1.begin(), subgraph_ops1.end());
      auto ops = std::vector<const xir::Op*>();
      std::set_intersection(fanout_ops.begin(), fanout_ops.end(),
                            subgraph_ops1.begin(), subgraph_ops1.end(),
                            std::back_inserter(ops));
      auto upload_op = ops.front();
      out = upload_op->get_output_tensor();

  }
  return out;

}
void DpuXmodel::init_vitis_tensors(int batch_size, size_t device_index) {
  vitis_input_tensors_.clear();
  vitis_output_tensors_.clear();
  for (auto tensor : input_tensors_) {
      auto dims = tensor->get_shape();
      dims[0] = batch_size*dims[0];
      auto vitis_tensor = xir::Tensor::create(tensor->get_name(), dims,
                                                  tensor->get_data_type()).release();
      auto attrs = tensor->get_attrs();
       if (!attrs->has_attr("__device_id__")) {
          attrs->set_attr<size_t>("__device_id__", device_index);
        }

      vitis_tensor->set_attrs(std::move(attrs));
      vitis_input_tensors_.emplace_back(vitis_tensor);
  }
  for (auto tensor : output_tensors_) {
      auto dims = tensor->get_shape();
      dims[0] = batch_size*dims[0];
      auto vitis_tensor = xir::Tensor::create(tensor->get_name(), dims,
                                                  tensor->get_data_type()).release();
      auto attrs = tensor->get_attrs();
      //auto attrs = tensor->get_attrs();
       if (!attrs->has_attr("__device_id__")) {
          attrs->set_attr<size_t>("__device_id__", device_index);
        }
      vitis_tensor->set_attrs(std::move(attrs));
      vitis_output_tensors_.emplace_back(vitis_tensor);
  }
}
void DpuXmodel::init_graph(const xir::Subgraph* subgraph) {
  //auto handle = contexts_[0]->get_dev_handle();
  if(ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK)) {
    if (subgraph->has_attr("dpu_fingerprint")) {
      fingerprint = subgraph->get_attr<std::uint64_t>("dpu_fingerprint");
    } else {
      throw std::runtime_error("Error: no hardware info in subgraph");
    }
  }
  dump_mode_ = dump_mode_|| ENV_PARAM(XLNX_ENABLE_DUMP);
  debug_mode_ = debug_mode_|| ENV_PARAM(XLNX_ENABLE_DEBUG_MODE);
  // Get one subgraph
  subgraph_ = subgraph; // check subgraph_->get_name()
  vitis::ai::trace::add_subgraph(subgraph_);

  // Get Reg ID size
  size_t total_io_size = 0;
  split_io = 0;
  if (subgraph_->has_attr("reg_id_to_hw_segment")) {
    auto reg_id_to_hw_segment =
      subgraph_->template get_attr<std::map<std::string, std::string>>(
          "reg_id_to_hw_segment");
    for(auto &r : reg_id_to_hw_segment) {
      auto reg_id_str = r.first;
      int reg_id = reg_id_str[reg_id_str.length()-1]- '0';
      xdpu_regid_to_hw_segment.emplace(std::make_pair(reg_id,r.second));
    }
  }
  if (subgraph_->has_attr("reg_id_to_context_type_v2")) {

    auto reg_id_to_context_type_v2 =
      subgraph_->get_attr<std::map<std::string, std::string>>("reg_id_to_context_type_v2");
    auto reg_id_to_size =
      subgraph_->get_attr<std::map<std::string, int32_t>>("reg_id_to_size");
    int io_cnt = 0;
    for(auto &r : reg_id_to_context_type_v2) {
      if ((r.second == "INTERFACE") || (r.second == "WORKSPACE")) {
          total_io_size += reg_id_to_size.at(r.first);
      }
      if ((r.second != "CONST")) {
        auto reg_id_str = r.first;
        int reg_id = reg_id_str[reg_id_str.length()-1]- '0';
        xdpu_total_reg_map.emplace(std::make_pair(reg_id,  reg_id_to_size.at(r.first)));
        if (r.second == "WORKSPACE") {
          xdpu_workspace_reg_map.emplace_back(std::make_pair(reg_id,  reg_id_to_size.at(r.first)));
        }
        io_cnt ++;
        LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "io reg_id: "  //
          << reg_id 
          << "  size: " 
          << reg_id_to_size.at(r.first)      //
          ;
      }
    }
    if (io_cnt > 1) split_io =1;
  } 
  else { //for vai1.3 xmodel
    auto reg_id_to_context_type =
      subgraph_->get_attr<std::map<std::string, std::string>>("reg_id_to_context_type");
    auto reg_id_to_size =
      subgraph_->get_attr<std::map<std::string, int32_t>>("reg_id_to_size");
    int count = 0;
    for(auto &r : reg_id_to_context_type) {
      if (r.second == "DATA") {
          total_io_size += reg_id_to_size.at(r.first);
        
        auto reg_id_str = r.first;
        int reg_id = reg_id_str[reg_id_str.length()-1]- '0';
        xdpu_total_reg_map.emplace(std::make_pair(reg_id,  reg_id_to_size.at(r.first)));
        LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "version <=1.3 io reg_id: "  //
          << reg_id 
          << "  size: " 
          <<reg_id_to_size.at(r.first)      //
          ;
        
        count++;
      }
    }
    if (count > 1) split_io=1;
  }
  auto iter = xdpu_total_reg_map.begin();
  while(iter !=xdpu_total_reg_map.end()) {

    xdpu_total_reg_map_out.emplace_back(std::make_pair(iter->first, iter->second));
    iter++;
  } 
  // Load parameter
  size_t parameter_size = 0;
  const char * parameter_value = NULL;
  std::map<std::string, std::vector<char>> reg_id_to_parameter_value;
  if (subgraph_->has_attr("reg_id_to_parameter_value")) {
    reg_id_to_parameter_value =
      subgraph_->get_attr<std::map<std::string, std::vector<char>>>("reg_id_to_parameter_value");
    for (const auto& c : reg_id_to_parameter_value) {
      if (!c.second.empty()) {
        parameter_size = c.second.size();
        auto reg_id_str = c.first;
        int reg_id = reg_id_str[reg_id_str.length()-1]-'0';
        parameter_value = (const char *)&c.second[0];
        //// reg0
        if (parameter_size) {
          void *reg0Ptr = NULL; 
          if (posix_memalign(&reg0Ptr, getpagesize(), parameter_size))
            throw std::bad_alloc();
          for (unsigned i=0; i < parameter_size; i++) ((char*)reg0Ptr)[i] = parameter_value[i];
          xdpu_parameter_map.emplace_back(std::make_tuple((char*)reg0Ptr, parameter_size,reg_id));
        }
      }
    }
  }
  
  layer_info layer(subgraph_->get_name());
  subgraph_info.workload = subgraph_->get_attr<uint64_t>("workload");
  subgraph_info.depth = subgraph_->get_depth();
  subgraph_info.name = subgraph_->get_name();
  // Get input offset
  auto input_tensors = subgraph_->get_input_tensors();
  auto output_tensors = subgraph_->get_output_tensors();
  xdpu_total_in_size=0;
  xdpu_total_out_size=0;
  for (auto &in_tensor : input_tensors) {
    auto out = find_tensor(in_tensor,subgraph_,true);
    auto ddr_addr = out->get_attr<std::int32_t>("ddr_addr");
    xdpu_io_input_offset.emplace_back(ddr_addr);
    //input_scales_.emplace(in_tensor->get_name(),pow(2,in_tensor->get_attr<std::int32_t>("fix_point")));
    input_scales_.emplace_back(pow(2,in_tensor->get_attr<std::int32_t>("fix_point")));
    auto dims = in_tensor->get_shape();
    //dims[0] =4;
    input_dims.emplace_back(in_tensor->get_shape());
    layer.inputs.emplace_back(address_info(ddr_addr, 
      in_tensor->get_data_size(), layer_info::name_map(out->get_name()),out->get_attr<std::int32_t>("reg_id"))); 
    auto attrs = out->get_attrs(); 
    xir::Tensor *tensor = xir::Tensor::create(in_tensor->get_name(), dims, in_tensor->get_data_type()).release();
    tensor->set_attrs(std::move(attrs));
    input_regid = out->get_attr<std::int32_t>("reg_id");
    input_tensors_.emplace_back(tensor);
    //xdpu_total_in_size += tensor->get_element_num(); 

  }
  xdpu_total_in_size = xdpu_total_reg_map.find(input_regid)->second; 

  // Get output offset
  for(auto &out_tensor : output_tensors) {
    auto out = find_tensor(out_tensor,subgraph_,false);
    auto ddr_addr = out->get_attr<std::int32_t>("ddr_addr");
    xdpu_io_output_offset.emplace_back(ddr_addr);
    //output_scales_.emplace(out_tensor->get_name(),pow(2,(-1)*out_tensor->get_attr<std::int32_t>("fix_point")));
    output_scales_.emplace_back(pow(2,(-1)*out_tensor->get_attr<std::int32_t>("fix_point")));
    output_dims.emplace_back(out->get_shape());
    auto dims = out_tensor->get_shape();
    //dims[0] =4;
    layer.outputs.emplace_back(std::make_tuple(ddr_addr, 
        out_tensor->get_data_size(), layer_info::name_map(out->get_name()),out->get_attr<std::int32_t>("reg_id")));
    auto attrs = out->get_attrs();
    xir::Tensor *tensor = xir::Tensor::create(out_tensor->get_name(), dims, out_tensor->get_data_type()).release();
    tensor->set_attrs(std::move(attrs));
    //auto tensor = out;
    output_regid = out->get_attr<std::int32_t>("reg_id");
    output_tensors_.emplace_back(tensor);
    //xdpu_total_out_size += tensor->get_element_num(); 

  }
  xdpu_total_out_size = xdpu_total_reg_map.find(output_regid)->second; 
  //in release mode: using dbg_layers_ to store first inputs and final outputs information  
  dbg_layers_.clear();
  dbg_layers_.emplace_back(std::move(layer));
  // Load mc_code
  if(!debug_mode_) { 
    auto& mc_code = subgraph_->get_attr<std::vector<char>>("mc_code");
    unsigned size = mc_code.size();
    void *codePtr = NULL;
    if (posix_memalign(&codePtr, getpagesize(), size))
      throw std::bad_alloc();
    for (unsigned i=0; i < size; i++) ((char*)codePtr)[i] = mc_code[i];
    xdpu_code_map.emplace(std::make_pair((char*)codePtr, std::make_pair(size,0)));
    if (subgraph_->has_attr("mc_code_preload")) {
      auto& mc_code_preload = subgraph_->get_attr<std::vector<char>>("mc_code_preload");
      if (mc_code_preload.size() > 0) {
        unsigned size_pre = mc_code_preload.size();
        void *codePtr_pre = NULL;
        if (posix_memalign(&codePtr_pre, getpagesize(), size_pre))
          throw std::bad_alloc();
        for (unsigned i=0; i < size_pre; i++) ((char*)codePtr_pre)[i] = mc_code_preload[i];
        xdpu_code_map.emplace(std::make_pair((char*)codePtr_pre, std::make_pair(size_pre,1)));
      }
    }
  } else {
    auto children = subgraph_->get_children(); 
    auto child_order = subgraph_->get_attr<std::vector<std::string>>("children_topological_sort");

    for (const auto& child_name : child_order) { 
      auto child = std::find_if(children.begin(), children.end(),
          [&child_name](auto g) { return g->get_name() == child_name; });
      layer_info layer(child_name); 
      layer.workload = subgraph_->get_attr<uint64_t>("workload");
      layer.depth = subgraph_->get_depth();
      if ((*child)->has_attr("mc_code")) {
        auto& mc_code = (*child)->get_attr<std::vector<char> >("mc_code"); 

        void *codePtr = NULL;
        auto codeSize = mc_code.size(); 
        if (posix_memalign(&codePtr, getpagesize(), codeSize))
          throw std::bad_alloc(); 
        std::copy(mc_code.begin(), mc_code.end(),  (char*)codePtr); 
        xdpu_code_map.emplace(std::make_pair((char*)codePtr, std::make_pair(codeSize,0)));
        if ((*child)->has_attr("mc_code_preload")) {
          auto& mc_code_preload = subgraph_->get_attr<std::vector<char>>("mc_code_preload");
          if (mc_code_preload.size() > 0) {
            unsigned size_pre = mc_code.size();
            void *codePtr_pre = NULL;
            //unsigned size = mc_code.size();
            if (posix_memalign(&codePtr_pre, getpagesize(), size_pre))
              throw std::bad_alloc();
            for (unsigned i=0; i < size_pre; i++) ((char*)codePtr_pre)[i] = mc_code_preload[i];
            //xdpu_code_map.emplace(std::make_pair((char*)codePtr_pre, std::make_pair(size_pre,1)));
            std::get<0>(layer.code_addr_preload) = (int8_t*)codePtr_pre;
            std::get<1>(layer.code_addr_preload) = size_pre;
            //ayer.preload_code_addr = alloc_and_fill_device_memory(handle, mc_code_preload);
          }
        }

        //auto codeBO = xclAllocUserPtrBO(handle, codePtr, codeSize, handle_->get_device_info().ddr_bank); 
        //xclSyncBO(handle, codeBO, XCL_BO_SYNC_BO_TO_DEVICE, codeSize, 0);
        std::get<0>(layer.code_addr) = (int8_t*)codePtr;
        std::get<1>(layer.code_addr) = codeSize;
        //free(codePtr); 
      }    
 
      auto in_tensors = (*child)->get_input_tensors() ;
      for(auto t: in_tensors) {
        layer.inputs.emplace_back(address_info{t->get_attr<int32_t>("ddr_addr"), 
            t->get_data_size(), layer_info::name_map(t->get_name()),t->get_attr<int32_t>("reg_id")});
      }
      auto out_tensors = (*child)->get_output_tensors() ;
      for(auto t: out_tensors) {
        layer.outputs.emplace_back(address_info{t->get_attr<int32_t>("ddr_addr"), 
            t->get_data_size(), layer_info::name_map(t->get_name()),t->get_attr<int32_t>("reg_id")});
      } 
      dbg_layers_.emplace_back(std::move(layer));
    }

  }

  //program_once_complete = 0;
}

