#include <cstring>
#include <iostream>
#include <fstream>
#include <iterator>
#include <sys/stat.h>
#include <sys/types.h>
#include <assert.h>
#include <ert.h>
#include <unistd.h>
#include <xrt.h>
#include <algorithm>
#include <chrono>
#include <regex>
#include <sstream>
#include <sys/stat.h>
#include <sys/types.h>
#include <iomanip>
#include <math.h>
#include "engine.hpp"
#include "dpuv3e_controller.hpp"
#include "xir/xir.h"
#include "xir/graph/graph.hpp"
#include "xir/graph/subgraph.hpp"
#include "json-c/json.h"

#include "dpu_runner.hpp"
#include "xir/tensor/tensor.hpp"
#include "vart/tensor_buffer.hpp"


#include "vitis/ai/env_config.hpp"
#include "vitis/ai/profiling.hpp"
#include "device_handle.hpp"
using namespace std;
using namespace chrono;
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#define BIT(nr) (1 << (nr))

#define XDPU_GLOBAL_INT_ENABLE BIT(0)
#define XDPU_CONTROL_AP 0x00
#define XDPU_CONTROL_AP_START 0x00
#define XDPU_CONTROL_GIE 0x04
#define XDPU_CONTROL_IER 0x08
#define XDPU_CONTROL_ISR 0x0C
#define BASE_ADDR 0x00000 // NOTE: USE ONLY FOR BEFORE 2020.1
#define XDPU_CONTROL_START 0x10  /* write 1 to enable DPU start */
#define XDPU_CONTROL_RESET 0x1C  /* reset DPU active low */
#define XDPU_CONTROL_HP 0x20
#define XDPU_CONTROL_INSTR_L 0x140
#define XDPU_CONTROL_INSTR_H 0x144
#define XDPU_CONTROL_ADDR_0_L 0x100 // weights / reg0
#define XDPU_CONTROL_ADDR_0_H 0x104
#define XDPU_CONTROL_ADDR_1_L 0x108 // input1
#define XDPU_CONTROL_ADDR_1_H 0x10C
#define XDPU_CONTROL_ADDR_2_L 0x110 
#define XDPU_CONTROL_ADDR_2_H 0x114
#define XDPU_CONTROL_ADDR_3_L 0x118
#define XDPU_CONTROL_ADDR_3_H 0x11C
#define DPUREG_ENGINE_NUM 0x1ec
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

static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
  uint32_t val;
  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
  return val;
}

DpuV3eController::DpuV3eController(std::string meta) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(meta),dump_mode_(false),debug_mode_(false) {
  // assign many contexts -- one for each worker thread
  // threads cannot share contexts (or xclExecWait may miss the 'done' signal)
  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));

  init(meta);
}

DpuV3eController::DpuV3eController(const xir::Subgraph *subgraph) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(subgraph),dump_mode_(false),debug_mode_(false) {
  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));

  init(subgraph);
}
DpuV3eController::~DpuV3eController() {
}
std::vector<vart::TensorBuffer*> DpuV3eController::init_tensor_buffer(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine) {
 std::vector<vart::TensorBuffer*>  tbufs;
 //in mlperf, need to create tensorbuffers for all engines, and batchSupport=1, need to loop all hw engine.
 // batchSupport=1 for mlperf runEngine=8;
 // batchSupport=8 for contiguous tensorbuffer->data()
 for (unsigned bs=0; bs < runEngine; bs++) {
    for (unsigned ti=0; ti < tensors.size(); ti++)
    {
      // allocate aligned host memory
      const size_t dataSize = 1;//vart::size_of(tensors[ti]->get_data_type());
      size_t size = tensors[ti]->get_element_num() * dataSize;
      void *data;
      if (posix_memalign(&data, getpagesize(), size*batchSupport))
        throw std::bad_alloc();
      auto dims = tensors[ti]->get_shape();
      dims[0] = batchSupport;
      xir::Tensor *tensor = xir::Tensor::create(tensors[ti]->get_name(), dims, tensors[ti]->get_data_type()).release();


      // make TensorBuffer to hold host memory
      std::unique_ptr<vart::CpuFlatTensorBuffer> tbuf(
        new vart::CpuFlatTensorBuffer(data, tensor));
      tbufs.emplace_back(tbuf.get());
      {
        std::unique_lock<std::mutex> lock(hwbufio_mtx_);
        bufs_.emplace_back(std::move(tbuf));
      }
    }
  }
  return tbufs;

}

void DpuV3eController::init(const xir::Subgraph *subgraph) {
  if (subgraph->has_attr("device")&&(subgraph->get_attr<std::string>("device")=="DPU")) {
    init_graph(subgraph);
  }
  else
    throw std::runtime_error("Error: subgraph is not supported in DPURunner");

}
void DpuV3eController::init(const std::string &meta) {

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
      auto ops = std::vector<const xir::Op*>();
      std::set_intersection(fanout_ops.begin(), fanout_ops.end(),
                            subgraph_ops.begin(), subgraph_ops.end(),
                            std::back_inserter(ops));
      auto upload_op = ops.front();
      out = upload_op->get_output_tensor();

  }
  return out;

}

void DpuV3eController::init_graph(const xir::Subgraph* subgraph) {
  auto handle = contexts_[0]->get_dev_handle();
  auto cu_base_addr = handle_->get_device_info().cu_base_addr;
  auto cu_index = handle_->get_device_info().cu_index;
  //auto full_name = handle_->get_device_info().full_name;
  //auto kernel_name = full_name.substr(0, full_name.find("_"));
  //std::cout << "kernel_name " << kernel_name << ", cu_index " << cu_index << std::endl;
#if 0
  if(cu_index == 0) {
    axi_argv.push_back(0);
    axi_argv.push_back(19);
    axi_argv.push_back(20);
    axi_argv.push_back(1);
    axi_i = 16;
    axi_w.push_back(10);
    axi_w.push_back(11);
  }
  else if(cu_index == 1) {
    axi_argv.push_back(2);
    axi_argv.push_back(3);
    axi_argv.push_back(21);
    axi_argv.push_back(22);
    axi_argv.push_back(4);
    axi_i = 17;
    axi_w.push_back(12);
    axi_w.push_back(13);
  }
  else {
    axi_argv.push_back(5);
    axi_argv.push_back(6);
    axi_argv.push_back(23);
    axi_argv.push_back(24);
    axi_argv.push_back(7);
    axi_i = 18;
    axi_w.push_back(14);
    axi_w.push_back(15);
  }
#endif
  if(cu_index == 0) {
    axi_argv.push_back(0);
    axi_argv.push_back(1);
    axi_argv.push_back(16);
    axi_argv.push_back(17);
    axi_argv.push_back(2);
    axi_i = 6;
    axi_w.push_back(20);
    axi_w.push_back(21);
  }
  else {
    axi_argv.push_back(3);
    axi_argv.push_back(4);
    axi_argv.push_back(18);
    axi_argv.push_back(19);
    axi_argv.push_back(5);
    axi_i = 7;
    axi_w.push_back(22);
    axi_w.push_back(23);
  }
  
  if(ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK)) {
    if (subgraph->has_attr("dpu_fingerprint")) {
      const uint64_t fingerprint = subgraph->get_attr<std::uint64_t>("dpu_fingerprint");
      uint32_t low = read32_dpu_reg(handle,  cu_base_addr + VERSION_CODE_L);
      uint32_t high = read32_dpu_reg(handle,  cu_base_addr + VERSION_CODE_H);
      uint64_t version = high;
      version = (version << 32) + low;
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
        << "DPU fingerprint: "  //
        << version      //
        ;
      if (version != fingerprint)
        throw std::runtime_error("Error: subgraph's version is mismatch with xclbin");
    } else {

      throw std::runtime_error("Error: no hardware info in subgraph");

    }
  }
  batch_size_ = read32_dpu_reg(handle,  cu_base_addr + DPUREG_ENGINE_NUM);
  xclBOProperties boProp;
  dump_mode_ = dump_mode_|| ENV_PARAM(XLNX_ENABLE_DUMP);
  debug_mode_ = debug_mode_|| ENV_PARAM(XLNX_ENABLE_DEBUG_MODE);
  if(dump_mode_) {
    auto t = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now()); 
    std::stringstream ss;
    ss << "dump_" << std::put_time(std::localtime(&t), "%Y%m%d%H%M%S"); 
    dump_folder_ = ss.str();
    if(mkdir(dump_folder_.c_str(),S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO))
      throw std::runtime_error("Error: Create dump folder error");
    for(auto i = 0;i<batch_size_;i++) {
      std::string tmp = dump_folder_ + "/E" + std::to_string(i);
      if(mkdir(tmp.c_str(),S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO))
        throw std::runtime_error("Error: Create dump sub folder error"); 
    } 
  }


  //auto graph = subgraph->get_graph();
  // Get one subgraph
  const xir::Subgraph* subgraph_ = subgraph; // check subgraph_->get_name()

  // Get Reg ID size
  size_t total_io_size = 0;
  split_io = 0;
  for(int i=0;i < 3; i++) xdpu_total_reg_size[i] = 0;
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
          << "io reg_id: "  //
          << reg_id 
          << "  size: " 
          <<reg_id_to_size.at(r.first)      //
          ;
        
        count++;
      }
    }
    if (count > 1) split_io=1;
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
        // reg0
        if (parameter_size) {
          void *reg0Ptr = NULL; 
          if (posix_memalign(&reg0Ptr, getpagesize(), parameter_size))
            throw std::bad_alloc();
          for (unsigned i=0; i < parameter_size; i++) ((char*)reg0Ptr)[i] = parameter_value[i];
          for (unsigned int idx=0; idx<axi_w.size(); idx++) {
            auto reg0Mem 
              = xclAllocUserPtrBO(handle, reg0Ptr, parameter_size, axi_w[idx]);
            if (reg0Mem == NULLBO) {
              if (idx == axi_w.size()-1) {
                throw std::bad_alloc();
              } else {
                continue;
              }
            }
            xclSyncBO(handle, reg0Mem, XCL_BO_SYNC_BO_TO_DEVICE, parameter_size, 0);
            xclGetBOProperties(handle, reg0Mem, &boProp);
            reg0_addr_ = boProp.paddr;
            free(reg0Ptr);
            break;
	  }
        } else {
          reg0_addr_ = 0;
        }
        LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "parameter reg_id: "  //
          << reg_id 
          << "  size: " 
          << parameter_size      //
          ;
        xdpu_total_dpureg_map.emplace(std::make_pair(reg_id ,reg0_addr_));
        //break;
      }
    }
  }
  //xdpu_io_total_size = total_io_size;

  layer_info layer(subgraph_->get_name()); 
  // Get input offset
  auto input_tensors = subgraph_->get_input_tensors();
  auto output_tensors = subgraph_->get_output_tensors();
  for (auto &in_tensor : input_tensors) {
    auto out = find_tensor(in_tensor,subgraph_,true);
    auto ddr_addr = out->get_attr<std::int32_t>("ddr_addr");
    xdpu_io_input_offset.emplace_back(ddr_addr);
    input_scales_.push_back(pow(2,in_tensor->get_attr<std::int32_t>("fix_point")));
    input_dims.emplace_back(in_tensor->get_shape());
    layer.inputs.emplace_back(address_info(ddr_addr, 
      in_tensor->get_data_size(), layer_info::name_map(out->get_name()),out->get_attr<std::int32_t>("reg_id"))); 
    auto attrs = out->get_attrs(); 
    xir::Tensor *tensor = xir::Tensor::create(in_tensor->get_name(), in_tensor->get_shape(), in_tensor->get_data_type()).release();
    tensor->set_attrs(std::move(attrs));
    input_regid = out->get_attr<std::int32_t>("reg_id");
    input_tensors_.emplace_back(tensor);

  }
  xdpu_total_in_size = xdpu_total_reg_map.find(int(input_regid))->second; 

  // Get output offset
  for(auto &out_tensor : output_tensors) {
    auto out = find_tensor(out_tensor,subgraph_,false);
    auto ddr_addr = out->get_attr<std::int32_t>("ddr_addr");
    xdpu_io_output_offset.emplace_back(ddr_addr);
    output_scales_.push_back(pow(2,(-1)*out_tensor->get_attr<std::int32_t>("fix_point")));
    output_dims.emplace_back(out->get_shape()); 
    layer.outputs.emplace_back(std::make_tuple(ddr_addr, 
        out_tensor->get_data_size(), layer_info::name_map(out->get_name()),out->get_attr<std::int32_t>("reg_id")));
    auto attrs = out->get_attrs();
    xir::Tensor *tensor = xir::Tensor::create(out_tensor->get_name(), out_tensor->get_shape(), out_tensor->get_data_type()).release();
    tensor->set_attrs(std::move(attrs));
    //auto tensor = out;
    output_regid = out->get_attr<std::int32_t>("reg_id");
    output_tensors_.emplace_back(tensor);

  }
  xdpu_total_out_size = xdpu_total_reg_map.find(output_regid)->second; 
  //in release mode: using dbg_layers_ to store first inputs and final outputs information  
  dbg_layers_.clear();
  dbg_layers_.emplace_back(std::move(layer));

  // Load mc_code
  if(!debug_mode_) { 
    auto& mc_code = subgraph_->get_attr<std::vector<char>>("mc_code");
    void *codePtr = NULL;
    unsigned size = mc_code.size();
    if (posix_memalign(&codePtr, getpagesize(), size))
      throw std::bad_alloc();
    for (unsigned i=0; i < size; i++) ((char*)codePtr)[i] = mc_code[i];
    auto codeMem 
      = xclAllocUserPtrBO(handle, codePtr, size, axi_i);
    if (codeMem == NULLBO) {
      throw std::bad_alloc();
    }
    xclSyncBO(handle, codeMem, XCL_BO_SYNC_BO_TO_DEVICE, size, 0);
    xclGetBOProperties(handle, codeMem, &boProp);
    code_addr_ = boProp.paddr;
    free(codePtr);
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "code size: "  //
      << size
      ;
  } else {
    auto children = subgraph_->get_children(); 
    auto child_order = subgraph_->get_attr<std::vector<std::string>>("children_topological_sort");
    for (const auto& child_name : child_order) { 
      auto child = std::find_if(children.begin(), children.end(),
          [&child_name](auto g) { return g->get_name() == child_name; });

      layer_info layer(child_name); 
      if ((*child)->has_attr("mc_code")) {
        auto& mc_code = (*child)->get_attr<std::vector<char> >("mc_code"); 

        void *codePtr = NULL;
        auto codeSize = mc_code.size(); 
        if (posix_memalign(&codePtr, getpagesize(), codeSize))
          throw std::bad_alloc(); 
        std::copy(mc_code.begin(), mc_code.end(),  (char*)codePtr);
        auto codeBO = xclAllocUserPtrBO(handle, codePtr, codeSize, axi_i); 
        if (codeBO == NULLBO) {
	  throw std::bad_alloc();
	}
        xclSyncBO(handle, codeBO, XCL_BO_SYNC_BO_TO_DEVICE, codeSize, 0);
        
        std::get<0>(layer.code_addr) = (uint64_t)xclGetDeviceAddr(handle, codeBO);
        std::get<1>(layer.code_addr) = codeSize;
        
        free(codePtr);
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

  program_once_complete = 0;
}

std::vector<float> DpuV3eController::get_input_scale() {
  return input_scales_;
}

std::vector<float> DpuV3eController::get_output_scale() {
  return output_scales_;
}


std::vector<const xir::Tensor*> 
DpuV3eController::get_input_tensors() const {
  return input_tensors_;
}

std::vector<const xir::Tensor*> 
DpuV3eController::get_output_tensors() const {
  return output_tensors_;
}

std::vector<const xir::Tensor*> 
DpuV3eController::get_merged_io_tensors(int size) const {
  const std::vector<std::int32_t> dims = { 1, 1, 1, size};
  xir::Tensor *tensor = xir::Tensor::create("inout", dims, xir::DataType{xir::DataType::INT, 8}).release();
  //static xir::Tensor tensor("inout", dims, xir::Tensor::DataType::INT8); 
  return std::vector<const xir::Tensor*>(batch_size_, tensor);
}
/*
std::vector<vart::TensorBuffer*> get_tensor_buffer_pointer(
    std::vector<std::unique_ptr<vart::TensorBuffer>>& tensor_buffers) {
  auto ret = std::vector<vart::TensorBuffer*>();
  ret.reserve(tensor_buffers.size());
  std::transform(tensor_buffers.begin(), tensor_buffers.end(),
                 std::back_inserter(ret),
                 [](auto& tensor_buffer) { return tensor_buffer.get(); });
  return ret;
}
*/
std::vector<vart::TensorBuffer*> DpuV3eController::get_inputs(int batchsz) {
  // TODO if batchsz =! 8 or 1 , create_tensor_buffers for user-requested batchsz
  // E.g., batchsz=1 for MLperf Server Scenario
  int input_bz = input_tensors_[0]->get_shape()[0];
  if ((batchsz == -1))
  // for default defination
    return init_tensor_buffer(input_tensors_,batch_size_*input_bz);
  else if (batchsz == 1)
  // for mlperf defination
    return init_tensor_buffer(input_tensors_,batchsz*input_bz,batch_size_);
  else
  // for other user-requested batchsz
    return init_tensor_buffer(input_tensors_,batchsz*input_bz);
 
}

std::vector<vart::TensorBuffer*> DpuV3eController::get_outputs(int batchsz) {
  // TODO if batchsz != 8 or 1, create_tensor_buffers for user-requested batchsz
  // E.g., batchsz=1 for MLperf
  int output_bz = output_tensors_[0]->get_shape()[0];
  if ((batchsz == -1)) {
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "generate tensorbuffer.data in batch";
    auto tbufs = init_tensor_buffer(output_tensors_,batch_size_*output_bz);
    std::unordered_map<int,std::vector<vart::TensorBuffer*>>  hwbuf;
    auto iter = xdpu_total_reg_map.begin();
    while(iter !=xdpu_total_reg_map.end()) {
      auto buf = create_tensor_buffers(get_merged_io_tensors(iter->second),false);
      if (buf.empty()) {
        throw std::runtime_error("Error: memory buffer allocate fail");
      }
      hwbuf.emplace(std::make_pair(iter->first,buf));
      iter++;
    }
    {
      std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
      tbuf2hwbufsio2_.emplace(tbufs[0],hwbuf);
    }
    return tbufs;

  } else if (batchsz == 1){
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "generate tensorbuffers in batch";
    auto tbufs = init_tensor_buffer(output_tensors_,batchsz*output_bz,batch_size_);
    std::vector<std::pair<int,vector<vart::TensorBuffer*>>>  hwbuf;
    auto iter = xdpu_total_reg_map.begin();
    while(iter !=xdpu_total_reg_map.end()) {
      auto buf = create_tensor_buffers(get_merged_io_tensors(iter->second),false);
      if (buf.empty()) {
        throw std::runtime_error("Error: memory buffer allocate fail");
      }
      hwbuf.push_back(std::make_pair(iter->first, buf));
      iter++;
    }
    for (int i=0;i<batch_size_; i++) 
    {
      std::unordered_map<int,vart::TensorBuffer*>  hwbuf2;
      for (auto t:hwbuf) {
        hwbuf2.emplace(std::make_pair(t.first,(t.second)[i]));
      }
      std::unique_lock<std::mutex> lock(hwbufio_mtx_);
      tbuf2hwbufsio_.emplace(tbufs[i],hwbuf2);
    }
    return tbufs;
  } else {
    auto tbufs = init_tensor_buffer(output_tensors_,batchsz*output_bz);
    //std::vector<std::vector<vart::TensorBuffer*>>  hwbuf;
    std::unordered_map<int,std::vector<vart::TensorBuffer*>>  hwbuf;
    auto iter = xdpu_total_reg_map.begin();
    while(iter !=xdpu_total_reg_map.end()) {
      auto buf = create_tensor_buffers(get_merged_io_tensors(iter->second),false);
      if (buf.empty()) {
        throw std::runtime_error("Error: memory buffer allocate fail");
      }
      hwbuf.emplace(std::make_pair(iter->first,buf));
      iter++;
    }
    {
      std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
      tbuf2hwbufsio2_.emplace(tbufs[0],hwbuf);
    }
    return tbufs;

  }
}

void DpuV3eController::data_fix2float(float* dataDst, int8_t* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (float)(dataSrc[i]*scale);
}

void DpuV3eController::data_float2fix(int8_t* dataDst, float* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (int8_t)(dataSrc[i]*scale);
}
void DpuV3eController::free_buffers(std::vector<vart::TensorBuffer*> &tbufs, bool isInput) {
  if (isInput) {
    std::unique_lock<std::mutex> lock(hwbufio_mtx_);
    for (unsigned ti=0; ti < tbufs.size(); ti++)
    {
      for (auto it=bufs_.begin(); it != bufs_.end(); it++)
        if (it->get() == tbufs[ti])
        {
          bufs_.erase(it);
          break;
        }
    }

  } else {
    // here only free the buffer that called in run(), run only call get_inputs(1)/get_outputs(1)
    std::unique_lock<std::mutex> lock(hwbufio_mtx_);
    for (unsigned ti=0; ti < tbufs.size(); ti++)
    {
        {
          std::unique_lock<std::mutex> lock(tbuf_mtx_);
          
          auto bufs = tbuf2hwbufsio_[tbufs[ti]];
          for (auto buf=bufs.begin(); buf != bufs.end(); buf++)  {
            tbuf2dbuf_.erase(buf->second);
            for (auto it=tbufs_.begin(); it != tbufs_.end(); it++) {
              if (it->get() == buf->second)
              {
                   tbufs_.erase(it);
                 break;
              }
            }
          }
        }
        tbuf2hwbufsio_.erase(tbufs[ti]);
      for (auto it=bufs_.begin(); it != bufs_.end(); it++)
        if (it->get() == tbufs[ti])
        {
           bufs_.erase(it);
           break;
        }
    }
  }
}

size_t DpuV3eController::getInputBufferSize() {
  return xdpu_total_in_size;
}

size_t DpuV3eController::getOutputBufferSize() {
  return xdpu_total_out_size;
}

vector<int32_t> DpuV3eController::getInputOffsets() {
  return xdpu_io_input_offset;
}

vector<int32_t> DpuV3eController::getOutputOffsets() {
  return xdpu_io_output_offset;
}
void DpuV3eController::run(const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) {
  std::vector<vart::TensorBuffer*> input_tensor_buffers;
  std::vector<vart::TensorBuffer*> output_tensor_buffers;
  int inputBs = batch_size_;
  if(inputs.size()%input_tensors_.size())
    throw std::runtime_error("Error: input tensorbuffers error");
  int ibs = inputs[0]->get_tensor()->get_shape()[0]/input_tensors_[0]->get_shape()[0];
  int obs = outputs[0]->get_tensor()->get_shape()[0]/output_tensors_[0]->get_shape()[0];
  // check if tensorbuffer store batch inputs/outputs
  if ((inputs.size()/input_tensors_.size())>1)
    inputBs = inputs.size()/input_tensors_.size();
  else
    inputBs = ibs;
  if ((ibs < obs) || (inputBs > batch_size_) )
    throw std::runtime_error("Error: size of tensorbuffer not supported");
  //}
  bool create_tb_outside=false;
  bool create_tb_batch=false;
  bool tensorbuffer_phy=false;
  //if (!split_io) 
  {
  
    std::unique_lock<std::mutex> lock(hwbufio_mtx_);
    auto it = tbuf2hwbufsio_.find(outputs[0]);
    if (it == tbuf2hwbufsio_.end())
    {
      std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
      auto it = tbuf2hwbufsio2_.find(outputs[0]);
      if ((it == tbuf2hwbufsio2_.end()))
      {
        create_tb_outside=true;

      }
    }
  }
  if (!create_tb_outside) {

    if ((ibs == inputBs)&&(ibs > 1))
    {
      create_tb_batch = true;
    }

  }
  //if (create_tb_outside&&split_io)
  //    tensorbuffer_phy = true;
//  if (!split_io) {
  if(create_tb_outside) {
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "create tensorbuffer by user side";
    if (!tensorbuffer_phy) {
      input_tensor_buffers = get_inputs(1);
      output_tensor_buffers = get_outputs(1);
      for (unsigned i=0; i < input_tensors_.size(); i++ ) {
        unsigned cnt=0;
        for (unsigned j=0; j < inputs.size(); j++) {
          if (input_tensors_[i]->get_name().find(inputs[j]->get_tensor()->get_name()) != std::string::npos) {
            if (ibs == inputBs) { //one tensrobuffer store batch
              for (int b=0; b < ibs; b++) {
                if (inputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
                  data_float2fix((int8_t*)input_tensor_buffers[b*input_tensors_.size()+i]->data().first,(float*)inputs[j]->data().first+b*input_tensors_[i]->get_element_num(),input_tensors_[i]->get_element_num(), input_scales_[i]);
                else
                  memcpy((int8_t*)input_tensor_buffers[b*input_tensors_.size()+i]->data().first,(int8_t*)inputs[j]->data().first+b*input_tensors_[i]->get_element_num(),input_tensors_[i]->get_element_num());
                cnt++;
              }
            }
            else {
              if (inputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
        	data_float2fix((int8_t*)input_tensor_buffers[cnt*input_tensors_.size()+i]->data().first,(float*)inputs[j]->data().first,input_tensors_[i]->get_element_num(), input_scales_[i]);
              else
        	memcpy((int8_t*)input_tensor_buffers[cnt*input_tensors_.size()+i]->data().first,(int8_t*)inputs[j]->data().first,input_tensors_[i]->get_element_num());
              cnt++;
            }

          }
  
        }
        if (cnt == 0)
          throw std::runtime_error("Error: invilad tensorbuffer input");
      }
    } 
    //else {
      //TODO
      // for the condition that alloc addr outside API
  
     //}
  }
  else {
    input_tensor_buffers = inputs;
    output_tensor_buffers = outputs;
  }
  Engine& engine = Engine::get_instance();
  const unsigned worker_id = engine.get_my_worker_id();
  if (worker_id >= contexts_.size())
  throw std::runtime_error("Error: worker_id too large; update controller code");
  
  auto &context = *(contexts_[worker_id]);
  auto xcl_handle = context.get_dev_handle();
  auto bo_handle = context.get_bo_handle();
  auto bo_addr = context.get_bo_addr();
  
  // get device buffers for input TensorBuffers
  std::vector<XrtDeviceBuffer*> io_bufs(batch_size_);
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;

  std::vector<uint64_t> in_addrs(batch_size_);
  std::vector<uint64_t> out_addrs(batch_size_);
  if (!tensorbuffer_phy) { 
    if (create_tb_batch) {
      {
        std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
        auto it = tbuf2hwbufsio2_.find(output_tensor_buffers[0]);
        if ((it == tbuf2hwbufsio2_.end()))
          throw std::runtime_error("TensorBuffer not found");
        auto  hwbufs = it->second;
        auto iter = xdpu_total_reg_map.begin();
        while(iter !=xdpu_total_reg_map.end()) {
          
          auto reg_map = hwbufs.find(iter->first);
          if ((reg_map == hwbufs.end()))
            throw std::runtime_error("TensorBuffer not found");
          auto buf = reg_map->second;
          for (int i=0; i < batch_size_; i++) {
            io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf[i]));
            //reg_addrs[iter->first-1][i] = io_bufs[i]->get_phys_addr();
            xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_bufs[i]->get_phys_addr()));
            LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i<<  " workspace reg_id: " 
              << iter->first
              << " phy_addr: "
              << io_bufs[i]->get_phys_addr();
          }
          iter++;
        }

      }

    } else {
      for (unsigned i=0; i < io_bufs.size(); i++)
      {
        {
          std::unique_lock<std::mutex> lock(hwbufio_mtx_);
          auto it = tbuf2hwbufsio_.find(output_tensor_buffers[i]);
          if ((it == tbuf2hwbufsio_.end()))
            throw std::runtime_error("TensorBuffer not found");
          auto  hwbufs = it->second;
          auto iter = xdpu_total_reg_map.begin();
          while(iter !=xdpu_total_reg_map.end()) {
            auto reg_map = hwbufs.find(iter->first);
            if ((reg_map == hwbufs.end()))
              throw std::runtime_error("TensorBuffer not found");
            auto buf = reg_map->second;
            io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf));
            //reg_addrs[iter->first-1][i] = io_bufs[i]->get_phys_addr();
            xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_bufs[i]->get_phys_addr()));
            LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i<<  " workspace reg_id: " 
              << iter->first
              << " phy_addr: "
              << io_bufs[i]->get_phys_addr();
            iter++;
          }

        }
      }
    }
     
    for (auto iter2 : xdpu_total_dpureg_map2) {
      if (std::get<0>(iter2) == input_regid)
        in_addrs[std::get<1>(iter2)] = std::get<2>(iter2);
      if (std::get<0>(iter2) == output_regid)
        out_addrs[std::get<1>(iter2)] = std::get<2>(iter2);
        
      }
   
    
  } 
  else {
//TODO
  // for the condition that alloc memory without API
    if (split_io) {
    //if(xdpu_total_reg_map.find(1) && xdpu_total_reg_map.find(2)) {
      for (unsigned i=0; i < io_bufs.size(); i++) {
        if (create_tb_batch) { 
          for (unsigned t=0; t < inputs.size(); t++ ) {
            if (input_tensors_[0]->get_name().find(inputs[t]->get_tensor()->get_name()) != std::string::npos) {
              in_addrs[i] = inputs[t]->data().first-xdpu_io_input_offset[0]+i*input_tensors_[0]->get_element_num();
              //reg_addrs[input_regid-1][i] = in_addrs[i];
              xdpu_total_dpureg_map2.push_back(std::make_tuple(input_regid,i,in_addrs[i]));
              break;
            }
          }
          for (unsigned t=0; t < outputs.size(); t++ ) {
            if (output_tensors_[0]->get_name().find(outputs[t]->get_tensor()->get_name()) != std::string::npos) {
              out_addrs[i] = outputs[t]->data().first-xdpu_io_output_offset[0]+i*output_tensors_[0]->get_element_num();
              //reg_addrs[output_regid-1][i] = out_addrs[i];
              xdpu_total_dpureg_map2.push_back(std::make_tuple(output_regid,i,out_addrs[i]));
              break;
            }
          }
        } else {
          int cnt = 0;
          for (unsigned t=cnt; t < inputs.size(); t++ ) {
            if (input_tensors_[0]->get_name().find(inputs[t]->get_tensor()->get_name()) != std::string::npos) {
              in_addrs[i] = inputs[t]->data().first-xdpu_io_input_offset[0];
              //reg_addrs[input_regid-1][i] = in_addrs[i];
              xdpu_total_dpureg_map2.push_back(std::make_tuple(input_regid,i,in_addrs[i]));
              cnt = t;
              break;
            }
          }
          int cnt_out = 0;
          for (unsigned t=cnt_out; t < outputs.size(); t++ ) {
            if (output_tensors_[0]->get_name().find(outputs[t]->get_tensor()->get_name()) != std::string::npos) {
              out_addrs[i] = outputs[t]->data().first-xdpu_io_output_offset[0];
              //reg_addrs[output_regid-1][i] = out_addrs[i];
              xdpu_total_dpureg_map2.push_back(std::make_tuple(output_regid,i,out_addrs[i]));
              cnt_out = t;
              break;
            }
          }

        }
        for (auto it = xdpu_total_reg_map.begin();it != xdpu_total_reg_map.end(); it++) {
          if((it->first != input_regid) && (it->first != output_regid) ) {
            void *ioPtr = NULL;
            xclBOProperties p;
            if (posix_memalign(&ioPtr, getpagesize(), xdpu_total_reg_map.find(it->first)->second))
              throw std::bad_alloc();
            for (unsigned int idx=0; idx<axi_argv.size(); idx++){ 
              auto ioMem 
                = xclAllocUserPtrBO(xcl_handle, ioPtr, xdpu_total_reg_map.find(it->first)->second, axi_argv[idx]);
              if (ioMem == NULLBO) {
	        if (idx == axi_argv.size()-1) {
		  throw std::bad_alloc();
		} else {
		  continue;
		}
	      }
              xclGetBOProperties(xcl_handle, ioMem, &p);
              xdpu_total_dpureg_map2.push_back(std::make_tuple(it->first,i,p.paddr));
              //reg_addrs[0][i] = p.paddr;
              free(ioPtr);
	      break;
	    }
          }
        }
      }
   } else {

     throw std::runtime_error("need enable split-io");
   }

  }
  //const auto inSize = get_input_tensors()[0]->get_element_num();
  __TIC__(INPUT_H2D)
  if (!tensorbuffer_phy) { 
    for (int i=0; i < inputBs; i++)
    {
      // instead of uploading all {output, input, intermediate}, 
      // just upload input region
      // io_bufs[i]->upload();
     //const auto mode = std::ios_base::out | std::ios_base::binary | std::ios_base::trunc;
     //  auto input_file = "./input"+ to_string(i)+".bin";
     //  std::ofstream(input_file, mode).write((char*)inputs[i]->data().first,inSize);
      for (unsigned j=0; j < xdpu_io_input_offset.size(); j++) {
        uint8_t* dataPtr;
        const auto inSize = get_input_tensors()[j]->get_element_num();
        if (create_tb_batch)
          dataPtr = ((uint8_t*)input_tensor_buffers[j]->data().first)+inSize*i;
        else
          dataPtr =(uint8_t*)input_tensor_buffers[i*xdpu_io_input_offset.size()+j]->data().first;
        if (xclUnmgdPwrite(xcl_handle, 0, (void *)dataPtr, inSize,
          in_addrs[i] + xdpu_io_input_offset[j]))
          throw std::runtime_error("Error: upload failed");
      }

    }
  }
  __TOC__(INPUT_H2D)
  auto cu_base_addr = handle_->get_device_info().cu_base_addr;
  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);
  ecmd->cu_mask = handle_->get_device_info().cu_mask;
  ecmd->extra_cu_masks = 0;
  ecmd->stat_enabled = 1;
  ecmd->state = ERT_CMD_STATE_NEW;
  ecmd->opcode = ERT_EXEC_WRITE;
  ecmd->type = ERT_CTRL;

  //LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
  //   <<"Engine : " << i<<  " workspace reg_id: " 

  auto trigger_dpu_func = [&](){ 

    std::vector<std::pair<int, int> > regVals;
    regVals.push_back({ XDPU_CONTROL_AP, XDPU_CONTROL_AP_START });
    regVals.push_back({ XDPU_CONTROL_GIE / 4, XDPU_GLOBAL_INT_ENABLE });
    regVals.push_back(  { XDPU_CONTROL_IER / 4, 1 });
    regVals.push_back(  { XDPU_CONTROL_START / 4, 0x0 });
    regVals.push_back(  { XDPU_CONTROL_RESET / 4, 0x1 });
    regVals.push_back(  { XDPU_CONTROL_HP / 4, 0x204040 });
    regVals.push_back(  { XDPU_CONTROL_INSTR_L / 4, code_addr_ & 0xFFFFFFFF });
    regVals.push_back(  { XDPU_CONTROL_INSTR_H / 4, (code_addr_ >> 32) & 0xFFFFFFFF });
    //regVals.push_back(  { XDPU_CONTROL_ADDR_0_L / 4, reg0_addr_ & 0xFFFFFFFF });
    //regVals.push_back(  { XDPU_CONTROL_ADDR_0_H / 4, (reg0_addr_ >> 32) & 0xFFFFFFFF });
    auto iter = xdpu_total_dpureg_map.begin();
    while(iter !=xdpu_total_dpureg_map.end()) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
      iter++;
    }

    // program DPU input/output addrs
    for (auto iter2 : xdpu_total_dpureg_map2) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, std::get<2>(iter2) & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, (std::get<2>(iter2) >> 32) & 0xFFFFFFFF });
    } 
 
    int p = 6;
    for (unsigned i=0; i < regVals.size(); i++) {
      ecmd->data[p++] = (regVals[i].first) * 4;
      ecmd->data[p++] = (regVals[i].second);
    }
    ecmd->count = 1 + p; 

    // exec kernel
    auto exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
    if (exec_buf_result)
      throw std::runtime_error("Error: xclExecBuf failed");

    // wait for kernel
    for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0 
            && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);
            
    if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
      std::cout << "Error: CU timeout " << std::endl;

      std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_LOAD_START) << std::endl;
      std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_LOAD_END) << std::endl;
      std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_SAVE_START) << std::endl;
      std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_SAVE_END) << std::endl;
      std::cout << "CONV START:" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_CONV_START) << std::endl;
      std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_CONV_END) << std::endl;
      std::cout << "MISC START:" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_MISC_START) << std::endl;
      std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle,  cu_base_addr + DPUREG_MISC_END) << std::endl;
      throw std::runtime_error("Error: CU timeout " + std::to_string(handle_->get_device_info().cu_index));
    }
    if(ENV_PARAM(XLNX_SHOW_DPU_COUNTER))
      std::cout << "IP COUNTER:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CYCLE_COUNTER) <<std::endl;
  // download results into output TensorBuffers
  };

  // program DPU request
  //
  if(!debug_mode_) { //=== run release instructions 
    if(dump_mode_ ) { // dump input    
      int tensor_idx = 0;
      for(auto& out: dbg_layers_[0].inputs) {
        auto offset = std::get<0>(out);
        auto size = std::get<1>(out);
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < io_bufs.size(); i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, in_addrs[i] + offset))
            throw std::runtime_error("Error: dump failed!");
          std::stringstream ss;  
          ss << dump_folder_ << "/E" << i << "/" << std::get<2>(out); 
          std::ofstream ofs(ss.str(), std::ofstream::binary);
          ofs.write(data.get(), size);
          ofs.close(); 
        }
        tensor_idx++;
      } 
    }

    trigger_dpu_func(); 

    if(dump_mode_ ) {  // dump final output   
      int tensor_idx = 0;
      for(auto& out: dbg_layers_[0].outputs) {
        auto offset = std::get<0>(out);
        auto size = std::get<1>(out);
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < io_bufs.size(); i++) { 
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, out_addrs[i] + offset))
            throw std::runtime_error("Error: dump failed!");
          std::stringstream ss;  
          ss << dump_folder_ << "/E" << i << "/" << std::get<2>(out); 
          std::ofstream ofs(ss.str(), std::ofstream::binary);
          ofs.write(data.get(), size);
          ofs.close(); 
        }
        tensor_idx++;
      } 
    }
  } else {//=== run debug instructions
    // dump first layer's inputs
    if(dump_mode_ && (dbg_layers_.size() > 0)) {   
      auto& inputs = dbg_layers_[0].inputs;
      int tensor_idx = 0;
      for(auto& input: inputs) {
        auto offset = std::get<0>(input);
        auto size = std::get<1>(input);
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < io_bufs.size(); i++) { 
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, in_addrs[i] + offset))
            throw std::runtime_error("Error: dump failed!");
          std::stringstream ss;
          ss << dump_folder_ << "/E" << i << "/" << std::get<2>(input); 
          std::ofstream ofs(ss.str(), std::ofstream::binary);
          ofs.write(data.get(), size);
          ofs.close(); 
        }
        tensor_idx++;
      } 
    }

    int layer_idx = 0; 
    for(auto iter = dbg_layers_.begin() + 1;iter !=dbg_layers_.end();iter++) {
      auto layer = *iter;
      if(std::get<1>(layer.code_addr) > 0) {
        code_addr_ = std::get<0>(layer.code_addr); 
        trigger_dpu_func();  
      }
      // Save the outputs to file  
      if(dump_mode_) { 
        int tensor_idx = 0;
        for(auto& out: layer.outputs) {
          auto offset = std::get<0>(out);
          auto size = std::get<1>(out);
          auto reg_id = std::get<3>(out);
          auto data = std::make_unique<char[]>(size);
          //for (unsigned i=0; i < io_bufs.size(); i++) {
          for (auto it :  xdpu_total_dpureg_map2 ) {
            auto regid = std::get<0>(it); 
            if (regid == reg_id) {
              if (xclUnmgdPread(xcl_handle, 0, data.get(), size, std::get<2>(it) + offset))
                throw std::runtime_error("Error: dump failed!");
              std::stringstream ss;  
              ss << dump_folder_ << "/E" << std::get<1>(it) << "/" << std::get<2>(out); 
              std::ofstream ofs(ss.str(), std::ofstream::binary);
              ofs.write(data.get(), size);
              ofs.close(); 
            }
          }
          tensor_idx++;
        }
      }
      layer_idx ++;
    } 
  }
 
  __TIC__(OUTPUT_D2H)
  if (!tensorbuffer_phy) { 
    for (int i=0; i < inputBs; i++)
    {
      // instead of downloading all {output, input, intermediate},
      // just download output region
      // io_bufs[i]->download();
      for (unsigned j=0; j< xdpu_io_output_offset.size(); j++) {
        const auto outSize = get_output_tensors()[j]->get_element_num();
        uint8_t* dataPtr;
        if (create_tb_batch)
          dataPtr = ((uint8_t *)output_tensor_buffers[j]->data().first)+outSize*i;
        else
          dataPtr = (uint8_t *)output_tensor_buffers[i*xdpu_io_output_offset.size()+j]->data().first;
        //__TIC_PROFILING__(OUTPUT)
        if (xclUnmgdPread(xcl_handle, 0, (void*)dataPtr,
          outSize,
          out_addrs[i] + xdpu_io_output_offset[j]))
          throw std::runtime_error("Error: download failed");
        //__TOC_PROFILING__(OUTPUT)
      }
    }
  }
  __TOC__(OUTPUT_D2H)
  if((!tensorbuffer_phy) &&create_tb_outside) {
    for (unsigned i=0; i < output_tensors_.size(); i++  ) {
      unsigned cnt=0;
      for (unsigned j=0; j < outputs.size(); j++) {
        if (output_tensors_[i]->get_name().find(outputs[j]->get_tensor()->get_name()) != std::string::npos) {
          if (ibs == inputBs) {
            for (int b=0; b < obs; b++) {
              if (outputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
                data_fix2float((float*)outputs[j]->data().first+b*output_tensors_[i]->get_element_num(), (int8_t*)output_tensor_buffers[b*output_tensors_.size()+i]->data().first,output_tensors_[i]->get_element_num(),output_scales_[i]);
              else
                memcpy((char*)outputs[j]->data().first+b*output_tensors_[i]->get_element_num(), (void*)output_tensor_buffers[b*output_tensors_.size()+i]->data().first,output_tensors_[i]->get_element_num());
              cnt++;
            }
          }
          else {
            if (outputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
              data_fix2float((float*)outputs[j]->data().first,(int8_t*)output_tensor_buffers[cnt*output_tensors_.size()+i]->data().first,output_tensors_[i]->get_element_num(),output_scales_[i]);
            else
              memcpy((int8_t*)outputs[j]->data().first,(int8_t*)output_tensor_buffers[cnt*output_tensors_.size()+i]->data().first,output_tensors_[i]->get_element_num());
            cnt++;

          }

        }
      }
      if (cnt == 0)
        throw std::runtime_error("Error: invilad tensorbuffer output");
    }
    free_buffers(input_tensor_buffers,true);
    free_buffers(output_tensor_buffers,false);
  }
}

