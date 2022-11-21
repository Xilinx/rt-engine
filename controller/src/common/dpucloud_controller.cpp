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
#include <xrt.h>
#include <algorithm>
#include <chrono>
#include <regex>
#include <sstream>
#include <iomanip>
#include <math.h>
#include "engine.hpp"
#include "dpucloud_controller.hpp"
#include "xir/graph/graph.hpp"
#include "xir/graph/subgraph.hpp"
#include "json-c/json.h"

#include "dpu_runner.hpp"
#include "xir/tensor/tensor.hpp"
#include "vart/tensor_buffer.hpp"
#include "vitis/ai/env_config.hpp"
#include "vitis/ai/profiling.hpp"
#include "device_handle.hpp"
#ifndef _WIN32
#include "trace.hpp"
#endif
//#include "vart/trace/trace.hpp"

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
#define XDPU_SAVE_EARLY_DONE 0x14  /* write 1 to enable DPU start */
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
DEF_ENV_PARAM(XLNX_BUFFER_POOL, "0");
DEF_ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK, "1");
/*
 * a contiguous memory block is allocated for each requests' I/O
 * layout:
 *  0      : output
 *  3071   : input
 *  153599 : intermediate
 */
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

struct bo_share{
  int reg_id;
  std::vector<xclBufferHandle> bo_handles;
  int cnt;
};
struct bounding {
  size_t cu_id;
  size_t device_id;
  std::vector<string> md5value;

};
static std::mutex bo_mtx_;
//static std::vector<std::pair<bounding, bo_share>> xdpu_workspace_bo;
static std::vector<std::pair<bounding, bo_share>> xdpu_workspace_bo;

static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
  uint32_t val;
  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
  return val;
}
static bool check_exist(int regid, std::vector<int> regids) {
  bool rtn = false;
  for (unsigned i=0; i< regids.size(); i++) {
     if (regids[i] == regid)
       rtn = true;
  }
  return rtn;

}
static int check_io_split(std::vector<int> regids1, std::vector<int> regids2) {
  int rtn = 1;
  for (unsigned i=0; i< regids1.size(); i++) {
    for (unsigned j=0; j< regids2.size(); j++) {
      if (regids1[i] == regids2[j])
        rtn = 0;
    }
  }
  return rtn;

}

DpuCloudController::DpuCloudController(std::string meta, xir::Attrs* attrs) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(meta, attrs),dump_mode_(false),debug_mode_(false) {
  // assign many contexts -- one for each worker thread
  // threads cannot share contexts (or xclExecWait may miss the 'done' signal)
  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++) {
    contexts_.emplace_back(new XrtContext(*handle_));
  }

  model_ =std::make_shared<DpuXmodel>(meta);
  split_io = check_io_split(model_->get_input_regid(), model_->get_output_regid()); 
}

DpuCloudController::DpuCloudController(const xir::Subgraph *subgraph, xir::Attrs* attrs) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(subgraph, attrs),dump_mode_(false),debug_mode_(false) {
  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));
  model_ =std::make_shared<DpuXmodel>(subgraph);
  split_io = check_io_split(model_->get_input_regid(), model_->get_output_regid()); 
}

void DpuCloudController::init_profiler() {
  auto dev_info = handle_->get_device_info();
  size_t cu_device_id = dev_info.device_index;
  size_t cu_core_id = dev_info.cu_index;
  std::string cu_name = dev_info.full_name;
  std::replace(cu_name.begin(), cu_name.end(), ':', '_');
  auto cu_full_name = dev_info.full_name;
  uint64_t cu_fingerprint = dev_info.fingerprint;
  size_t cu_batch = batch_size_;
#ifndef _WIN32
  vitis::ai::trace::add_info("dpu-controller",
    TRACE_VAR(cu_device_id), TRACE_VAR(cu_core_id),
    TRACE_VAR(cu_batch), TRACE_VAR(cu_name),
    TRACE_VAR(cu_full_name),
    TRACE_VAR(cu_fingerprint));
#endif
}

DpuCloudController::~DpuCloudController() {
  /*auto iter = xdpu_workspace_dpu.begin();
  if (iter != xdpu_workspace_dpu.end()) {
   for (unsigned i=0;i<iter->second.size(); i++) {
     auto buf = (iter->second)[i];
     rte::aligned_ptr_deleter pDel;
     pDel(reinterpret_cast<void*>(buf->data().first));

     //free(reinterpret_cast<void*>(buf->data().first));
   }
  
  }*/
  std::unique_lock<std::mutex> lock(bo_mtx_);
  auto iter = xdpu_workspace_bo.begin();
  int flag = 0;
  while (iter !=  xdpu_workspace_bo.end()) {
    if ((model_->get_md5())[0] == iter->first.md5value[0]) {
      if ((cu_index_ == iter->first.cu_id)&& (device_index_ == iter->first.device_id)) {
        iter->second.cnt--;
        if (iter->second.cnt == 0) {
          for (unsigned int i=0;i<iter->second.bo_handles.size();i++) {
            auto handle = contexts_[0]->get_dev_handle();
            auto bo = xclImportBO(handle, iter->second.bo_handles[i],0);
            xclFreeBO(handle, bo);
          }
          LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
            << "free featuremap bo " << "cu_index: "<< iter->first.cu_id 
            << ", device_id: " << iter->first.device_id
            ;
          flag = 1;
        }
  
        break;
      }
    } 
    iter++; 
  }
  if (flag == 1) {
    xdpu_workspace_bo.erase(iter);
  }
}

std::vector<unsigned> DpuCloudController::get_hbmw() {
  vector<unsigned> hbm;
  hbm.emplace_back(handle_->get_device_info().ddr_bank);
  return hbm;
}
std::vector<unsigned> DpuCloudController::get_hbmc() {
  vector<unsigned> hbm;
  hbm.emplace_back(handle_->get_device_info().ddr_bank);
  return hbm;
}
std::vector<unsigned> DpuCloudController::get_hbmio() {
  vector<unsigned> hbm;
  hbm.emplace_back(handle_->get_device_info().ddr_bank);
  return hbm;
}

std::vector<vart::TensorBuffer*> DpuCloudController::init_tensor_buffer(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine) {
 std::vector<vart::TensorBuffer*>  tbufs;
 
 for (unsigned bs=0; bs < runEngine; bs++) {
    for (unsigned ti=0; ti < tensors.size(); ti++)
    {
      // allocate aligned host memory
      const size_t dataSize = 1;//vart::size_of(tensors[ti]->get_data_type());
      size_t size = tensors[ti]->get_element_num() * dataSize;
      void *data;
      if (rte::posix_memalign(&data, rte::getpagesize(), size))
        throw std::runtime_error("Error: not enough virtual addre on host");
//      auto dims = tensors[ti]->get_shape();
//      dims[0] = batchSupport;
//      xir::Tensor *tensor = xir::Tensor::create(tensors[ti]->get_name(), dims, tensors[ti]->get_data_type()).release();
      std::unique_ptr<vart::TensorBufferExtImpHost> tbuf(
        new vart::TensorBufferExtImpHost(data, tensors[ti]));
      tbufs.emplace_back(tbuf.get());
      {
        std::unique_lock<std::mutex> lock(hwbufio_mtx_);
        bufs_.emplace_back(std::move(tbuf));
      }
    }
  }
  return tbufs;

}

std::vector<const xir::Tensor*> DpuCloudController::init_tensor(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine) {
  std::vector<const xir::Tensor*>  ts;
 
  for (unsigned bs=0; bs < runEngine; bs++) {
    for (unsigned ti=0; ti < tensors.size(); ti++)
    {
      // allocate aligned host memory
      const size_t dataSize = 1;//vart::size_of(tensors[ti]->get_data_type());
      size_t size = tensors[ti]->get_element_num() * dataSize/batch_size_;
      void *data;
      if (rte::posix_memalign(&data, rte::getpagesize(), size*batchSupport))
        throw std::runtime_error("Error: not enough virtual addre on host");
      auto dims = tensors[ti]->get_shape();
      dims[0] = batchSupport;
      xir::Tensor *tensor = xir::Tensor::create(tensors[ti]->get_name(), dims, tensors[ti]->get_data_type()).release();

      ts.emplace_back(tensor);
    }
  }
  return ts;

}
xclBufferHandle  DpuCloudController::get_xrt_bo(void* data, int size, vector<unsigned> hbm) {
  auto handle = contexts_[0]->get_dev_handle();
  xclBufferHandle reg0Mem;
  if (hbm.size() == 0)
    throw std::runtime_error("Error: hbm not initialized");
  for (unsigned idx = 0; idx<hbm.size(); idx++) {
    reg0Mem 
      = xclAllocUserPtrBO(handle, data, size, hbm[idx]);
    if (reg0Mem == NULLBO) {
      if (idx == (hbm.size()-1)) {
        throw std::bad_alloc();
      }else {
        continue;
      }
    }
    break;
  }
  return reg0Mem;

}

xclBufferHandle  DpuCloudController::get_xrt_bo(void* data, int size, unsigned hbm) {
  auto handle = contexts_[0]->get_dev_handle();
  xclBufferHandle reg0Mem;
  reg0Mem = xclAllocUserPtrBO(handle, data, size, hbm);
  return reg0Mem;

}

void DpuCloudController::init_graph(vector<unsigned> hbmw, vector<unsigned> hbmc, xir::Attrs* attrs ) {

  auto handle = contexts_[0]->get_dev_handle();
  auto cu_base_addr = handle_->get_device_info().cu_base_addr;
  uint64_t fingerprint = model_->get_fingerprint();

  if(ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK)) {
      uint32_t low = read32_dpu_reg(handle,  cu_base_addr + VERSION_CODE_L);
      uint32_t high = read32_dpu_reg(handle,  cu_base_addr + VERSION_CODE_H);
      uint64_t version = high;
      version = (version << 32) + low;
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
        << "DPU fingerprint: "  //
        << version      //
        << " "       //
        << fingerprint      //
        ;
      if (version != fingerprint)
        throw std::runtime_error("Error: subgraph's version is mismatch with xclbin");

  }
  
  batch_size_ = read32_dpu_reg(handle,  cu_base_addr + DPUREG_ENGINE_NUM);
  if(attrs != nullptr) {
    if (!attrs->has_attr("__batch__")) {
      attrs->set_attr<size_t>("__batch__", batch_size_);
    }
  }

  init_profiler();

  xclBOProperties boProp;
  dump_mode_ = model_->get_dump_mode();
  debug_mode_ = model_->get_debug_mode();
  if(dump_mode_) {
    auto t = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now()); 
    std::stringstream ss;
    ss << "dump_" << std::put_time(std::localtime(&t), "%Y%m%d%H%M%S"); 
    dump_folder_ = ss.str();
    if(!fs::create_directory(dump_folder_.c_str()))
      throw std::runtime_error("Error: Create dump folder error");
    for(auto i = 0;i<batch_size_;i++) {
      std::string tmp = dump_folder_ + "/E" + std::to_string(i);
      if(!fs::create_directory(tmp.c_str()))
        throw std::runtime_error("Error: Create dump sub folder error"); 
    } 
  }
  for (unsigned regc=0; regc<model_->get_xdpu_total_reg_map().size(); regc++) {
    xdpu_total_reg_map.emplace((model_->get_xdpu_total_reg_map())[regc]);
  }

  //for (auto p : model_->get_parameter()) {
  auto weights = model_->get_parameter();
  auto segment = model_->get_xdpu_regid_to_hw_segment();
  for (unsigned param_idx=0; param_idx < weights.size(); param_idx++) {
    auto p = weights[param_idx];
    if (std::get<1>(p)) {
      xclBufferHandle reg0Mem  = NULLBO;
      if ((handle_->get_device_info().full_name).find("DPUCAHX8H") != std::string::npos) { //V3E
        if (segment.find(std::get<2>(p)) != segment.end()) {
          auto seg = segment.find(std::get<2>(p));
          auto seg_str = seg->second;
          int seg_id = seg_str[seg_str.length()-1]- '0';  //W0, W1
          reg0Mem = get_xrt_bo(get<0>(p), get<1>(p), hbmw[seg_id]);
        }
      }
      if (reg0Mem == NULLBO)
        reg0Mem = get_xrt_bo(get<0>(p), get<1>(p), hbmw);
      xclSyncBO(handle, reg0Mem, XCL_BO_SYNC_BO_TO_DEVICE, std::get<1>(p), 0);
      xclGetBOProperties(handle, reg0Mem, &boProp);
      reg0_addr_ = boProp.paddr;

    } else {
      reg0_addr_ = 0;
    }
    xdpu_total_dpureg_map.emplace(std::make_pair(std::get<2>(p),reg0_addr_));
    
  }
  code_addr_=0x0ul;
  preload_code_addr_=0x0ul;
  // Load mc_code
  if(!debug_mode_) { 
    for (auto c : model_->get_code()) {
      auto codeMem = get_xrt_bo(c.first, c.second.first, hbmc);
      xclSyncBO(handle, codeMem, XCL_BO_SYNC_BO_TO_DEVICE, c.second.first, 0);
      xclGetBOProperties(handle, codeMem, &boProp);
      if (c.second.second == 0) {
        code_addr_ = boProp.paddr;
      } else  if(c.second.second == 1) {
        preload_code_addr_ = boProp.paddr;
      }
    }
  } else {
    auto dbg_layers = model_->get_dbg_layers();
    for(auto iter = dbg_layers.begin() + 1;iter != dbg_layers.end();iter++) { 
      if (get<1>(iter->code_addr) > 0) {
        auto codeBO = get_xrt_bo(get<0>(iter->code_addr), get<1>(iter->code_addr), hbmc);
        xclSyncBO(handle, codeBO, XCL_BO_SYNC_BO_TO_DEVICE, get<1>(iter->code_addr), 0);
        layer_debug_mode.emplace(iter->name, std::make_pair( (uint64_t)xclGetDeviceAddr(handle, codeBO),get<1>(iter->code_addr)));

      }
      if (get<1>(iter->code_addr_preload) > 0) {
        auto codeBO = get_xrt_bo(get<0>(iter->code_addr_preload), get<1>(iter->code_addr_preload), hbmc);
        xclSyncBO(handle, codeBO, XCL_BO_SYNC_BO_TO_DEVICE, get<1>(iter->code_addr_preload), 0);
        layer_debug_mode_preload.emplace(iter->name, std::make_pair( (uint64_t)xclGetDeviceAddr(handle, codeBO),get<1>(iter->code_addr_preload)));
      }
    }
  }
  auto iter = xdpu_total_reg_map.begin();
  while(iter !=xdpu_total_reg_map.end()) {

    const std::vector<std::int32_t> dims = { 1,  iter->second};
    xir::Tensor *tensor = xir::Tensor::create("inout", dims, xir::DataType{xir::DataType::INT, 8}).release();
    tensors_map_.emplace(iter->first,tensor);
    tensors_.emplace_back(std::move(tensor));
    iter++;

  }
  if (model_->get_xdpu_workspace_reg_map().size()>0) {
    int share_check=1;
    for(auto workspace : model_->get_xdpu_workspace_reg_map()) {
      int flag = 0;
      vector<std::pair<bounding, bo_share>>::iterator iter;
      std::unique_lock<std::mutex> lock(bo_mtx_);
      iter = xdpu_workspace_bo.begin();
      if (share_check) {
        while ( iter !=  xdpu_workspace_bo.end()) {
          if ((model_->get_md5())[0] == iter->first.md5value[0]) {
            if ((handle_->get_device_info().cu_index == iter->first.cu_id) && 
                 (handle_->get_device_info().device_index== iter->first.device_id)) {
              vector<uint64_t> addrs;
              for (unsigned int i=0; i< iter->second.bo_handles.size(); i++) {
                auto handle = contexts_[0]->get_dev_handle();
                xclBOProperties p;
                auto bo = xclImportBO(handle,  iter->second.bo_handles[i], 0);
                xclGetBOProperties(handle, bo, &p);
                LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
                  <<"Engine : " << i<<  " workspace reg_id: " 
                  << iter->second.reg_id
                  << " phy_addr: "
                  << p.paddr;
                addrs.emplace_back(p.paddr);
              }
              workspace_addr.emplace_back(workspace.first, addrs);
              iter->second.cnt++;
              LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
                << "share featuremap bo " << "cu_index: "<< iter->first.cu_id 
                << ", device_id: " << iter->first.device_id
                ;
              flag++;
              break;
            }
          }
          iter++; 
        }
      } 
      if (flag==0) {
         share_check = 0;
         bounding bd;
         bd.md5value = model_->get_md5();
         bd.cu_id = handle_->get_device_info().cu_index;
         bd.device_id = handle_->get_device_info().device_index;
         std::vector<xclBufferHandle> handles;
         vector<uint64_t> addrs;
         LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
           << "generate new featuremap bo " << "cu_index: "<< bd.cu_id 
           << ", device_id: " << bd.device_id
           ;
         auto hbm = get_hbmio();
         for (int i=0;i<batch_size_;i++) {
           void *ioPtr = NULL;
           
           xclBOProperties p;
           if (posix_memalign(&ioPtr, getpagesize(),workspace.second ))
             throw std::bad_alloc();
           xclBufferHandle ioMem;
           if (hbm.size() >= (unsigned int)batch_size_) {
             ioMem = get_xrt_bo(ioPtr, workspace.second, hbm[i]);
           } else {
             ioMem = get_xrt_bo(ioPtr, workspace.second, hbm[0]);
           }
           if (ioMem == NULLBO) {
             if (hbm.size() >= (unsigned int)batch_size_) { 
       	       // V3E has multipe hbms for featuremap, if bouding alloc fail, we can try to use other hbm
               ioMem = get_xrt_bo(ioPtr, workspace.second, hbm);
               if (ioMem == NULLBO)
                 throw std::bad_alloc();
             } else {
               throw std::bad_alloc();
             
             }
           }
           xclGetBOProperties(handle, ioMem, &p);
           auto bo = xclExportBO(handle, ioMem);
           handles.emplace_back(bo);  
           addrs.emplace_back(p.paddr);
           LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
             <<"Engine : " << i<<  " workspace reg_id: " 
             << workspace.first
             << " phy_addr: "
             << p.paddr;
           free(ioPtr);
        }
        bo_share bo_s;
        bo_s.cnt = 1;
        bo_s.bo_handles = handles;
        bo_s.reg_id=workspace.first;
        workspace_addr.emplace_back(workspace.first, addrs);
        xdpu_workspace_bo.push_back(std::make_pair(bd, bo_s));
      }
    }
  }
  model_->init_vitis_tensors(batch_size_, handle_->get_device_info().device_index);
  cu_index_=handle_->get_device_info().cu_index;
  device_index_=handle_->get_device_info().device_index;

  program_once_complete = 0;
  //tensorbufferPool& pool = tensorbufferPool::Instance();
  if (ENV_PARAM(XLNX_BUFFER_POOL))  {
    pool.set_pool_size(ENV_PARAM(XLNX_BUFFER_POOL));
    pool.init_pool();
  }
  for (size_t b=0; b<pool.get_pool_size(); b++) {
    auto inputs = get_inputs();
    auto outputs = get_outputs();
    pool.extend(std::make_pair(inputs,outputs));
  }

}

vector<float> DpuCloudController::get_input_scale() {

  return model_->get_input_scales();
}

vector<float> DpuCloudController::get_output_scale() {
  return model_->get_output_scales();
}


std::vector<const xir::Tensor*> 
DpuCloudController::get_input_tensors() const {
  return model_->get_input_tensors();
}

std::vector<const xir::Tensor*> 
DpuCloudController::get_output_tensors() const {
  return model_->get_output_tensors();
}

std::vector<const xir::Tensor*> 
DpuCloudController::get_merged_io_tensors(int reg_id) const {
  auto it= tensors_map_.find(reg_id);
  xir::Tensor* tensor;
  if (it != tensors_map_.end()) {
    tensor = it->second;
  } else {
    throw std::runtime_error("Error: invilad reg index tensor");
  }
  return std::vector<const xir::Tensor*>(batch_size_, tensor);

}

std::vector<vart::TensorBuffer*> DpuCloudController::get_inputs(int batchsz) {
  // TODO if batchsz =! 8 or 1 , create_tensor_buffers for user-requested batchsz
  // E.g., batchsz=1 for MLperf Server Scenario
  if (!split_io) {
    int input_bz = (model_->get_input_tensors())[0]->get_shape()[0]/batch_size_;
    if (batchsz == -1) {
    // for default defination
      auto tensors = model_->get_input_tensors();
      return init_tensor_buffer(tensors, batch_size_*input_bz);
    } else if (batchsz == 1) {
    // for mlperf defination
      auto tensors = model_->get_graph_input_tensors();
      return init_tensor_buffer(tensors, batchsz*input_bz,batch_size_);
    } else {
    // for other user-requested batchsz
      auto tensors = model_->get_input_tensors();
      return init_tensor_buffer(tensors,batchsz*input_bz);
    }
  } else {
    auto hbmio = get_hbmio();
    return get_outputs_inner(hbmio, true, batchsz);
  }
}

std::vector<vart::TensorBuffer*>  DpuCloudController::create_tensor_buffers_hbm(
  const std::vector<const xir::Tensor*> &tensors, bool isInput, vector<unsigned> hbm, int batch_size) {
  std::vector<vart::TensorBuffer*> bufs;
  std::vector<const xir::Tensor*> ts;
  if (batch_size == 1) {  // tensor batch = 1 for make_inputs(1)
    for (unsigned t=0; t < tensors.size(); t++) {
      std::vector<vart::TensorBuffer*> buf;
      buf.clear();
      ts.emplace_back(tensors[t]);
      if (int(hbm.size()) >= batch_size_) {
        buf = create_tensor_buffers(ts,isInput,std::vector<int>(1,hbm[t]));
      } else { //for DPU that only one ddr bank
        buf = create_tensor_buffers(ts,isInput,std::vector<int>(1,hbm[0]));
      }
      if (!buf.empty()) { 
        ts.clear();
        bufs.emplace_back(buf[0]);
        continue;
      } else { // if error with bank bouding ddr_index, try other extra banks
        unsigned alloc_begin=0;
        if (int(hbm.size()) > batch_size_) {
          alloc_begin=batch_size_;
        }
        for (unsigned idx = alloc_begin; idx<hbm.size(); idx++){
          buf = create_tensor_buffers(ts,isInput,std::vector<int>(1,hbm[idx]));
          if (!buf.empty()) { 
            ts.clear();
            bufs.emplace_back(buf[0]);
            break;
          }
          if (idx == (hbm.size()-1)) { // if all bank fail, throw error
            throw std::bad_alloc();
          }
        }
      }
    }
  } else {  //TODO  this is not used now because we need to make sure vir/phy addr aligment
    throw std::runtime_error("Error: invilad tensor in batch");
  }
  if(bufs.empty())
    throw std::bad_alloc();
  return bufs;
  
}
std::vector<vart::TensorBuffer*> DpuCloudController::get_outputs(int batchsz) {
  auto hbmio = get_hbmio();
  return get_outputs_inner(hbmio, false, batchsz);
}
std::vector<vart::TensorBuffer*> DpuCloudController::create_tensorbuffer_for_batch(vector<unsigned> hbm, bool isInputs, std::vector<const xir::Tensor*> tensors, std::vector<int> tensor_offset, int output_bz, bool isTensorsBatch) {
  std::unordered_map<int,std::vector<vart::TensorBuffer*>>  hwbuf;
  std::vector<vart::TensorBuffer*>  tbufs;
  int tensor_batch = 1;
  if (isTensorsBatch)
    tensor_batch = batch_size_;
  auto iter = xdpu_total_reg_map.begin();
  while(iter !=xdpu_total_reg_map.end()) {
    int is_workspace=0;
    auto reg_workspace = workspace_addr.begin();
    while (reg_workspace != workspace_addr.end()) {
      if (reg_workspace->first == iter->first) {
        is_workspace=1;
        break;
      }
      reg_workspace++;
    }
    if (is_workspace) {
      iter++;
    } else {

    //}

    //auto reg_workspace = xdpu_workspace_dpu.find(iter->first);
    //if (reg_workspace != xdpu_workspace_dpu.end()) { //featuremap (io-split)
    //  if (!isInputs) {
    //    hwbuf.emplace(std::make_pair(iter->first,reg_workspace->second));
    //    iter++;
    //  } else {
    //    iter++;
    //  } 
    //} else {
      
      if ((!check_exist(iter->first, model_->get_input_regid()))&& (!check_exist(iter->first , model_->get_output_regid()))) { 
        //for xmodel 1.3 with io-split 
        //can be removed in the future
        auto buf = create_tensor_buffers_hbm(get_merged_io_tensors(iter->first),false, get_hbmio(),1);
        if (!buf.empty()) {
          hwbuf.emplace(std::make_pair(iter->first,buf));
          iter++;
        } 
      } else { // input/output
        if (split_io) {
          if (isInputs) {
            if (!check_exist(iter->first, model_->get_input_regid())) {
              iter++;
              continue;
            }
          } else {
            if (!check_exist( iter->first, model_->get_output_regid())) {
              iter++;
              continue;
            }
          }
          auto bufPhy = create_tensor_buffers_hbm(get_merged_io_tensors(iter->first),false, hbm,1);
          for (int i =0; i < tensor_batch; i++) { 
            for (unsigned int ts=0;ts< tensors.size(); ts++) {
              if(tensors[ts]->get_attr<int32_t>("reg_id") != (int32_t)iter->first) {
                continue;
              }
              //auto dims = tensors[ts]->get_shape();
              //dims[0] = dims[0]/tensor_batch;
              if (isTensorsBatch) { // if create tensorbuffers in batch, tensor->get_shape()[0] is 1
                xir::Tensor *tensor;//
	        if (isInputs){	
		  tensor = const_cast<xir::Tensor*>(model_->get_graph_input_tensors()[ts]);
                }
		else
		  tensor = const_cast<xir::Tensor*>(model_->get_graph_output_tensors()[ts]);
                
                std::vector<vart::TensorBuffer*> bufPhy_single;
                bufPhy_single.emplace_back(bufPhy[i]);
                //xir::Tensor *tensor = xir::Tensor::create(tensors[ts]->get_name(), dims, tensors[ts]->get_data_type()).release();
                std::unique_ptr<vart::TensorBufferExtImpView> buf(
                  new vart::TensorBufferExtImpView(tensor, tensor_offset[ts], bufPhy_single));
                tbufs.emplace_back(buf.get());
                {
                  std::unique_lock<std::mutex> lock(hwbufio_mtx_);
                  bufsView2Phy_.emplace(buf.get(), bufPhy[i]); 
                  bufsView_.push_back(std::move(buf));
                }
              } else {
                std::unique_ptr<vart::TensorBufferExtImpView> buf(
                  new vart::TensorBufferExtImpView(tensors[ts], tensor_offset[ts], bufPhy));
                tbufs.emplace_back(buf.get());
                {
                  std::unique_lock<std::mutex> lock(hwbufio_mtx_);
                  bufsView_.push_back(std::move(buf));
                }
              }
            }
          }
          hwbuf.emplace(std::make_pair(iter->first, bufPhy)); 
          iter++;
        } else {  // for condition that io-split disable 
          auto buf = create_tensor_buffers_hbm(get_merged_io_tensors(iter->first),false, hbm,1);
          if (!isTensorsBatch) {
            auto tensors_out = model_->get_output_tensors();
            tbufs = init_tensor_buffer(tensors_out,batch_size_*output_bz);
          } else {
            auto tensors_out = model_->get_graph_output_tensors();
            tbufs = init_tensor_buffer(tensors_out,(model_->get_output_tensors())[0]->get_shape()[0],batch_size_);
          }
          if (!buf.empty()) {
            hwbuf.emplace(std::make_pair(iter->first,buf));
            iter++;
          }
        }
      }
    }
  }
  //TODO if call make_inputs(1) we need to sort
  {
    std::unique_lock<std::mutex> lock(hwbufio_mtx_);
    if (!isTensorsBatch) {
      tbuf2hwbufsio_.emplace(tbufs[0],hwbuf);

    } else {
      for (int i=0;i<batch_size_;i++) {
        std::unordered_map<int,vector<vart::TensorBuffer*>>  hwbuf2;
        for (auto t:hwbuf) {
          hwbuf2.emplace(std::make_pair(t.first,vector<vart::TensorBuffer*>(1,(t.second)[i])));
        }
        tbuf2hwbufsio_.emplace(tbufs[i],hwbuf2);
      }
    }
  }
  return tbufs;
}
std::vector<vart::TensorBuffer*> DpuCloudController::get_outputs_inner(vector<unsigned> hbm, bool isInputs, int batchsz) {
  // TODO if batchsz != 8 or 1, create_tensor_buffers for user-requested batchsz
  // E.g., batchsz=1 for MLperf
  int output_bz = (model_->get_output_tensors())[0]->get_shape()[0]/batch_size_; // this value the from xir batchsize
  std::vector<const xir::Tensor*> tensors; 
  std::vector<int> tensor_offset;
  if (isInputs) {
    tensors = model_->get_input_tensors();
    tensor_offset = model_->get_input_offset(); 
  }
  else { 
    tensors = model_->get_output_tensors();
    tensor_offset = model_->get_output_offset(); 
  }
  bool isTensorsBatch = true;
  if ((batchsz == -1) || (batchsz>1)) { 
    isTensorsBatch = false;//fot vitis-api
  }
  auto tbufs = create_tensorbuffer_for_batch(hbm, isInputs, tensors, tensor_offset, output_bz,isTensorsBatch);
  return tbufs;
}

void DpuCloudController::data_fix2float(float* dataDst, int8_t* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (float)(dataSrc[i]*scale);
}

void DpuCloudController::data_float2fix(int8_t* dataDst, float* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++) {
    dataDst[i] = (int8_t)(dataSrc[i]*scale);
   }
}
void DpuCloudController::free_buffers(std::vector<vart::TensorBuffer*> &tbufs) {
  std::unique_lock<std::mutex> lock(hwbufio_mtx_);
  for (auto tb : tbufs) {
    // free buffer if io-split disable
    if (tb->get_location() == vart::TensorBuffer::location_t::HOST_VIRT) {

      for (auto it=bufs_.begin(); it != bufs_.end(); it++)
        if (it->get() == tb)
        {
	   rte::aligned_ptr_deleter pDel;
           pDel(reinterpret_cast<void*>(it->get()->data().first));

	   //free(reinterpret_cast<void*>(it->get()->data().first));
           bufs_.erase(it);
           break;
        }
    } else {
      auto buf = bufsView2Phy_.find(tb);
      if (buf != bufsView2Phy_.end()) {
        //auto tensor_sz = tbufs.size()/batch_size_;
        //if ((ti%tensor_sz)==(tensor_sz-1)) {  
        std::unique_lock<std::mutex> lock(tbuf_mtx_);
        auto it = tbufs2dbufs_.find(buf->second);
        if (it != tbufs2dbufs_.end()) {
          tbufs2dbufs_.erase(buf->second);
          for (auto it=tbufs_.begin(); it != tbufs_.end(); it++) {
            if (it->get() == buf->second)
            {
               rte::aligned_ptr_deleter pDel;  
               pDel(reinterpret_cast<void*>(it->get()->data().first));
	       //free(reinterpret_cast<void*>(it->get()->data().first));
               tbufs_.erase(it);
               break;
            }
          }
        }
        bufsView2Phy_.erase(buf);
      } 
      auto it = tbuf2hwbufsio_.find(tb);
      if (it != tbuf2hwbufsio_.end()) {
        auto hwbufs = it->second;
        hwbufs.clear();
        tbuf2hwbufsio_.erase(tb);
      }
 
      for (auto it=bufsView_.begin(); it != bufsView_.end(); it++) {
        if (it->get() == tb)
        {
           bufsView_.erase(it);
           break;
        }
      }
    }
  }

}

//size_t DpuCloudController::getInputBufferSize() {
//  return model_->get_total_insize();
//}
//
//size_t DpuCloudController::getOutputBufferSize() {
//  return model_->get_total_outsize();
//}

vector<int32_t> DpuCloudController::getInputOffsets() {
  return model_->get_input_offset();
}

vector<int32_t> DpuCloudController::getOutputOffsets() {
  return model_->get_output_offset();
}
bool DpuCloudController::check_tensorbuffer_outside(const std::vector<vart::TensorBuffer*> &outputs) {
  bool create_tb_outside=false;
  //if(!tensorbuffer_phy)
  {
  
    std::unique_lock<std::mutex> lock(hwbufio_mtx_);
    auto it = tbuf2hwbufsio_.find(outputs[0]);
    if (it == tbuf2hwbufsio_.end())
    {
      create_tb_outside=true;

    }
  }
  return create_tb_outside;
}
uint32_t DpuCloudController::tensorbuffer_trans(std::vector<vart::TensorBuffer*> &input_tensor_buffers, std::vector<vart::TensorBuffer*> &output_tensor_buffers, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, bool is_input, uint32_t buf_id) {
  int ibs = inputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_input_tensors()[0]->get_shape()[0];
  int obs = outputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_output_tensors()[0]->get_shape()[0];
  // check if tensorbuffer store batch inputs/outputs
  int inputBs = batch_size_;
  uint32_t id=0;
  if ((inputs.size()/model_->get_input_tensors().size())>1)
    inputBs = inputs.size()/model_->get_input_tensors().size();
  else
    inputBs = ibs;
  auto tensors = get_input_tensors();
  int tsize = ibs;
  std::vector<vart::TensorBuffer*> buffers_from, buffers_to, buffers;
  //tensorbufferPool& pool = tensorbufferPool::Instance();
  if (is_input) {
    if(pool.get_pool_size() > 0) {
      id = pool.get();
      auto bufs = pool.get_buffer(id);
      input_tensor_buffers = bufs.first;
      output_tensor_buffers = bufs.second;
    } else {
      input_tensor_buffers = get_inputs();
      output_tensor_buffers = get_outputs();
    }
    buffers = inputs;
  } else {
    tensors = get_output_tensors();
    buffers = outputs;
    tsize = obs;
  }
  bool tensor_find = false;
  for (unsigned i=0; i < tensors.size(); i++ ) {
    int tensor_size = tensors[i]->get_element_num()/batch_size_;
    unsigned tensor_idx=0;
    vector<int> shape;
    shape = tensors[i]->get_shape();
    auto dims = std::vector<int>(shape.size(),0);
    auto dims_idx = std::vector<int>(shape.size(),0);
    float scale = 0.0;
    if (!is_input)
      scale = pow(2,(-1)*tensors[i]->get_attr<std::int32_t>("fix_point"));
    else
      scale = pow(2,tensors[i]->get_attr<std::int32_t>("fix_point"));
    for (unsigned j=0; j < buffers.size(); j++) {
      if (tensors[i]->get_name() == buffers[j]->get_tensor()->get_name())  {//find correct tensorbuffer from outside
        if (ibs == inputBs) { //one tensrobuffer store batch
          for (int b=0; b < tsize; b++) {
            dims_idx[0] = b;
            for (unsigned c=0; c < tensors.size(); c++) {
              if (buffers[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT) { //find correct correct inner tensorbuffer
                if (is_input) {
                  if (input_tensor_buffers[c]->get_tensor()->get_name() == buffers[j]->get_tensor()->get_name())  {
                    data_float2fix((int8_t*)input_tensor_buffers[c]->data(dims_idx).first,(float*)inputs[j]->data(dims_idx).first,tensor_size, scale);
	            break;
                  }
	        } else {
                  if (output_tensor_buffers[c]->get_tensor()->get_name() == buffers[j]->get_tensor()->get_name())  {
                    data_fix2float((float*)outputs[j]->data(dims_idx).first, (int8_t*)output_tensor_buffers[c]->data(dims_idx).first,tensor_size,scale);
	            break;
                  }
	        }
              } else {
                if (is_input) {
                  if (input_tensor_buffers[c]->get_tensor()->get_name() == buffers[j]->get_tensor()->get_name())  {
                    memcpy((int8_t*)input_tensor_buffers[c]->data(dims_idx).first,(int8_t*)inputs[j]->data(dims_idx).first,tensor_size);
	            break;
                  }
	        } else {
                  if (output_tensor_buffers[c]->get_tensor()->get_name() == buffers[j]->get_tensor()->get_name())  {
                    memcpy((char*)outputs[j]->data(dims_idx).first, (void*)output_tensor_buffers[c]->data(dims_idx).first,tensor_size);
	            break;
                  }
	        }
              }
	    }
            tensor_idx++;
          }
        }
        else {//TODO
          throw std::runtime_error("Error: invilad tensorbuffer input or output");
	  //dims_idx[0] = tensor_idx;
          //if (buffers[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT) {    
          //  if (is_input)
    	  //    data_float2fix((int8_t*)input_tensor_buffers[i]->data(dims_idx).first,(float*)inputs[j]->data(dims).first,tensor_size, scale);
          //  else
          //    data_fix2float((float*)outputs[j]->data(dims).first,(int8_t*)output_tensor_buffers[i]->data(dims_idx).first,tensor_size, scale);
          //} else {
          //  if (is_input)
    	  //    memcpy((int8_t*)input_tensor_buffers[i]->data(dims_idx).first,(int8_t*)inputs[j]->data(dims).first,tensor_size);
          //  else
          //    memcpy((int8_t*)outputs[j]->data(dims).first,(int8_t*)output_tensor_buffers[i]->data(dims_idx).first,tensor_size);
          //}
          //tensor_idx++;
        }
      } 
    }
    if (tensor_idx > 0)
      tensor_find = true;
  }
  if (!tensor_find)
      throw std::runtime_error("Error: invilad tensorbuffer input");
  if (!is_input) {
    if(pool.get_pool_size() == 0) {
      free_buffers(input_tensor_buffers);
      free_buffers(output_tensor_buffers);
    } else {
      pool.free_id(buf_id);
    }
  }
  return id;

}
vector<std::tuple<int, int,uint64_t>>  DpuCloudController::get_dpu_reg_inside(bool create_tb_batch, std::vector<vart::TensorBuffer*> &output_tensor_buffers, std::vector<vart::TensorBuffer*> &input_tensor_buffers  ) {
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;
  std::vector<XrtDeviceBuffer*> io_bufs(batch_size_);
  int tensors_sz =batch_size_;  
  int tensor_inBatch=1;
  if (create_tb_batch) {
    tensor_inBatch= batch_size_;
    tensors_sz = 1;
  }
  for (int idx=0; idx<tensors_sz; idx++) {
    {
      std::unique_lock<std::mutex> lock(hwbufio_mtx_);
      auto it = tbuf2hwbufsio_.find(output_tensor_buffers[idx]);
      if ((it == tbuf2hwbufsio_.end()))
        throw std::runtime_error("out TensorBuffer not found");
      auto  hwbufs = it->second;
      auto iter = xdpu_total_reg_map.begin();
      while(iter != xdpu_total_reg_map.end()) {
        if ((!check_exist(iter->first ,model_->get_input_regid())) || (!split_io)) {
          auto reg_map = hwbufs.find(iter->first);
          if ((reg_map == hwbufs.end())) {
            if (check_exist(iter->first, model_->get_output_regid()))
              throw std::runtime_error("TensorBuffer not found");
            else {
              iter++;
              continue;
            }
          }
            //throw std::runtime_error("Output TensorBuffer not found");
          auto buf = reg_map->second;
          for (int i=0; i < tensor_inBatch; i++) {  // i or idx is 0
            xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first, idx+i, buf[i]->data_phy(std::vector<int>{0,0}).first));
            LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i<<  " workspace reg_id: " 
              << iter->first
              << " phy_addr: "
              <<std::hex
              << buf[i]->data_phy(std::vector<int>{0,0}).first;
          }
        } 
        iter++;
      }
    }
    if (split_io){
      std::unique_lock<std::mutex> lock(hwbufio_mtx_);
      auto it = tbuf2hwbufsio_.find(input_tensor_buffers[idx]);
      if ((it == tbuf2hwbufsio_.end()))
        throw std::runtime_error("TensorBuffer not found");
      auto  hwbufs = it->second;
      auto iter = xdpu_total_reg_map.begin();
      while(iter != xdpu_total_reg_map.end()) {
        if (check_exist(iter->first, model_->get_input_regid())) {
          auto reg_map = hwbufs.find(iter->first);
          if ((reg_map == hwbufs.end())) {
            //if ((iter->first == model_->get_input_regid())|| (iter->first == model_->get_output_regid()))
              throw std::runtime_error("input TensorBuffer not found");
            //else {
            //  iter++;
            //  continue;
            //}
          }
            //throw std::runtime_error("Input TensorBuffer not found");
          auto buf = reg_map->second;
          for (int i=0; i < tensor_inBatch; i++) { // i or idx is 0
            xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first, i+idx, buf[i]->data_phy(std::vector<int>{0,0}).first));
            LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i<<  " workspace reg_id: " 
              << iter->first
              << " phy_addr: " << std::hex
              << buf[i]->data_phy(std::vector<int>{0,0}).first;
          }
        } 
        iter++;
      }
    }
  }
  return xdpu_total_dpureg_map2;
}
uint64_t DpuCloudController::get_addr(int32_t regid, int idx,vector<std::tuple<int, int,uint64_t>>& xdpu_total_dpureg_map2) {
  uint64_t addr;

  for (auto iter2 : xdpu_total_dpureg_map2) {
    if (regid == std::get<0>(iter2))
    {
      if (idx == std::get<1>(iter2)) {
        addr =  std::get<2>(iter2);
        return addr;
      }

    }
  }
  throw std::runtime_error("need enable split-io");
  return addr;   

}
vector<std::tuple<int, int,uint64_t>>  DpuCloudController::get_dpu_reg_outside(bool create_tb_batch,  const std::vector<vart::TensorBuffer*> &outputs, const std::vector<vart::TensorBuffer*> &inputs) {
  return get_dpu_reg_outside_hbm(create_tb_batch, outputs, inputs);
}
vector<std::tuple<int, int,uint64_t>>  DpuCloudController::get_dpu_reg_outside_hbm(bool create_tb_batch, const std::vector<vart::TensorBuffer*> &outputs, const std::vector<vart::TensorBuffer*> &inputs) {
  // for the condition that alloc memory without API
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;
  if (split_io) {
    auto dims_size = (inputs[0]->get_tensor()->get_shape()).size();
    auto dims_out_size = (outputs[0]->get_tensor()->get_shape()).size();
    auto dims = std::vector<int32_t>(dims_size, 0);
    auto dims_out = std::vector<int32_t>(dims_out_size, 0);
    int tensor_batch = 1;
    if (!create_tb_batch) {
      tensor_batch = batch_size_;
    }
    std::unordered_map<int32_t,int> in_regs;
    std::unordered_map<int32_t,int> out_regs;
    auto input_reg = model_->get_input_regid();
    auto output_reg = model_->get_output_regid();
    for (unsigned r=0; r< input_reg.size(); r++) {
      in_regs.emplace(input_reg[r], 0);
    }
    for (unsigned r=0; r<output_reg.size(); r++) {
      out_regs.emplace(output_reg[r], 0);
    }

 
    for (auto iter : in_regs) {
      for (int ts=0; ts < tensor_batch; ts++) {
        for (int i=0; i < batch_size_/tensor_batch; i++) {
          dims[0] = i;
          auto intensors = model_->get_input_tensors();
          int input_idx = ts*intensors.size();
          auto tensor = inputs[input_idx]->get_tensor();
          for (unsigned t=0; t<intensors.size(); t++) {
            if (tensor->get_attr<int32_t>("reg_id") == iter.first) {
              uint64_t in_addr = inputs[input_idx+t]->data_phy(dims).first-model_->get_input_offset()[t];
              xdpu_total_dpureg_map2.push_back(std::make_tuple(iter.first,i+ts,in_addr));

              LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i+ts<<  " workspace reg_id: " 
              << iter.first
              << " phy_addr: " << std::hex
              << in_addr;
              break;
            }
          }
        }
      }
    }
    for (auto iter : out_regs) {
      for (int ts=0; ts < tensor_batch; ts++) {
        for (int i=0; i < batch_size_/tensor_batch; i++) {
          dims_out[0] = i;
          auto outtensors = model_->get_output_tensors();
          int output_idx = ts*outtensors.size();
          auto tensor = outputs[output_idx]->get_tensor();
          for (unsigned t=0; t<outtensors.size(); t++) {
            if (tensor->get_attr<int32_t>("reg_id") == iter.first) {
              uint64_t out_addr = outputs[output_idx+t]->data_phy(dims_out).first-model_->get_output_offset()[t];
              xdpu_total_dpureg_map2.push_back(std::make_tuple(iter.first,i+ts,out_addr));
              LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i+ts<<  " workspace reg_id: " 
              << iter.first
              << " phy_addr: " << std::hex
              << out_addr;
              break;
            }
          }
        }
      }
    }

   /* for (int i=0; i < batch_size_; i++) {
      auto iter = xdpu_total_reg_map.begin();
      while(iter !=xdpu_total_reg_map.end()) {
        auto reg_workspace = xdpu_workspace_dpu.find(iter->first);
        if (reg_workspace != xdpu_workspace_dpu.end()) {
          auto io_buf = reg_workspace->second[i];
          xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_buf->data_phy(std::vector<int>{0,0}).first));
              LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
              <<"Engine : " << i<<  " workspace reg_id: " 
              << iter->first
              << " phy_addr: " << std::hex
              << io_buf->data_phy(std::vector<int>{0,0}).first;
        }
        iter++;
      }
    }*/
  } else {
    throw std::runtime_error("need enable split-io");
  }
  return xdpu_total_dpureg_map2;
}

void DpuCloudController::dpu_trigger_run(ert_start_kernel_cmd* ecmd, xclDeviceHandle xcl_handle, xclBufferHandle bo_handle, vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map_io) {
  int p;
  int exec_buf_result;
  auto dev_info = handle_->get_device_info();
  auto cu_base_addr = dev_info.cu_base_addr;
  auto core_idx = dev_info.cu_index;

  std::vector<std::pair<int, int> > regVals;
  if (0 == program_once_complete) {

    // in debug mode, need to run preload instruction layer by layer
    if(!debug_mode_){
      program_once_complete = 1;
    }
    regVals.push_back({ XDPU_CONTROL_AP, XDPU_CONTROL_AP_START });
    regVals.push_back({ XDPU_CONTROL_GIE / 4, XDPU_GLOBAL_INT_ENABLE });
    regVals.push_back(  { XDPU_CONTROL_IER / 4, 1 });
    regVals.push_back(  { XDPU_CONTROL_START / 4, 0x0 });
    regVals.push_back(  { XDPU_CONTROL_RESET / 4, 0x1 });
    regVals.push_back(  { XDPU_CONTROL_HP / 4, 0x204040 });
    if (preload_code_addr_){
      // do preload
      regVals.push_back( { XDPU_CONTROL_INSTR_L / 4, preload_code_addr_ & 0xFFFFFFFF });
      regVals.push_back( { XDPU_CONTROL_INSTR_H / 4, (preload_code_addr_ >> 32) & 0xFFFFFFFF });
      auto iter = xdpu_total_dpureg_map.begin();
      while(iter !=xdpu_total_dpureg_map.end()) {
        regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
        regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
        iter++;
      }
      p = 6;
      for (unsigned i=0; i < regVals.size(); i++) {
        ecmd->data[p++] = (regVals[i].first) * 4;
        ecmd->data[p++] = (regVals[i].second);
      }
      ecmd->count = 1 + p;

      exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
      if (exec_buf_result)
        throw std::runtime_error("Error: xclExecBuf failed");

      // wait for kernel
      for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
              && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);

      if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
        std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_START) << std::endl;
        std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_END) << std::endl;
        std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_START) << std::endl;
        std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_END) << std::endl;
        std::cout << "CONV START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_START) << std::endl;
        std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_END) << std::endl;
        std::cout << "MISC START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_START) << std::endl;
        std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_END) << std::endl;
        std::cout << "Error: CU timeout when do preload " << std::endl;
        throw std::runtime_error("Error: CU timeout when do preload "
          + std::to_string(handle_->get_device_info().cu_index));
      }
      regVals.clear();
    }
  }
  regVals.push_back(  { XDPU_CONTROL_INSTR_L / 4, code_addr_ & 0xFFFFFFFF });
  regVals.push_back(  { XDPU_CONTROL_INSTR_H / 4, (code_addr_ >> 32) & 0xFFFFFFFF });
  auto iter = xdpu_total_dpureg_map.begin();
  while(iter !=xdpu_total_dpureg_map.end()) {
    regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
    regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
        << "parameter: "  //
        << iter->first << " : " << std::hex
        << iter->second      //
        ;
    iter++;
  }
  auto iter3 = workspace_addr.begin();
  while(iter3 != workspace_addr.end() ) {
    for (int bz=0;bz<batch_size_;bz++) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter3->first + bz*0x100) / 4, (iter3->second)[bz] & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter3->first + bz*0x100) / 4, (iter3->second[bz] >> 32) & 0xFFFFFFFF });
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
        << "featuremap addr : "   //
        << iter3->second[bz]      //
        ;
    }
    iter3++;
  }

  // program DPU input/output addrs
  for (auto iter2 : xdpu_total_dpureg_map_io) {
    regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, std::get<2>(iter2) & 0xFFFFFFFF });
    regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, (std::get<2>(iter2) >> 32) & 0xFFFFFFFF });
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
        << "io: " 
        <<std::get<1>(iter2) 
        << " regid: " << std::hex //
        << std::get<0>(iter2) << " "
        << std::get<2>(iter2)      //
        ;
  }

  p = 6;
  for (unsigned i=0; i < regVals.size(); i++) {
    ecmd->data[p++] = (regVals[i].first) * 4;
    ecmd->data[p++] = (regVals[i].second);
  }
  ecmd->count = 1 + p;

#ifndef _WIN32
  vitis::ai::trace::add_trace("dpu-controller", vitis::ai::trace::func_start, core_idx);
#endif
  // exec kernel
  exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
  if (exec_buf_result)
    throw std::runtime_error("Error: xclExecBuf failed");

  // wait for kernel
  for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
          && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);

#ifndef _WIN32
vitis::ai::trace::add_trace("dpu-controller", vitis::ai::trace::func_end, core_idx);
#endif
  if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
    std::cout << "Error: CU timeout " << std::endl;

    std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_START) << std::endl;
    std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_END) << std::endl;
    std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_START) << std::endl;
    std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_END) << std::endl;
    std::cout << "CONV START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_START) << std::endl;
    std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_END) << std::endl;
    std::cout << "MISC START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_START) << std::endl;
    std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_END) << std::endl;
    throw std::runtime_error("Error: CU timeout " + std::to_string(handle_->get_device_info().cu_index));
  }
  if(ENV_PARAM(XLNX_SHOW_DPU_COUNTER))
    std::cout << "IP COUNTER:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CYCLE_COUNTER) <<std::endl;


}

void DpuCloudController::run(const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) {
  std::vector<vart::TensorBuffer*> input_tensor_buffers;
  std::vector<vart::TensorBuffer*> output_tensor_buffers;
  int inputBs = batch_size_;
  auto input_tensors_size = model_->get_input_tensors().size();
  if(inputs.size()%input_tensors_size)
    throw std::runtime_error("Error: input tensorbuffers error");
  int ibs = inputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_input_tensors()[0]->get_shape()[0];
  //int obs = outputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_output_tensors()[0]->get_shape()[0];
  // check if tensorbuffer store batch inputs/outputs
  if ((inputs.size()/input_tensors_size)>1)
    inputBs = inputs.size()/input_tensors_size;
  else
    inputBs = ibs;
  if (inputBs > batch_size_) {
    throw std::runtime_error("Error: size of tensorbuffer not supported");
  }
  //}
  bool create_tb_outside=check_tensorbuffer_outside(outputs);
  bool create_tb_batch=false;
  bool tensorbuffer_phy=true;
  if (outputs[0]->get_location() == vart::TensorBuffer::location_t::HOST_VIRT) 
    tensorbuffer_phy=false;
  //if ((!create_tb_outside)||tensorbuffer_phy) {
    if (((ibs == inputBs)&&(ibs > 1) && (batch_size_ > 1)) || (batch_size_==1))
    {
      create_tb_batch = true;
    }
  //}
  uint32_t buf_id = 0;
  if(create_tb_outside) {
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "create tensorbuffer by user side";
    if (!tensorbuffer_phy) {
      buf_id = tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, true, 0);
      create_tb_batch = true; // we call get_inputs(), tensorbuffer.data in batch
    } else {
      input_tensor_buffers = inputs;
      output_tensor_buffers = outputs;

    } 
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
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map_io;

  //std::vector<uint64_t> in_addrs(batch_size_);
  //std::vector<uint64_t> out_addrs(batch_size_);
  if (create_tb_outside && tensorbuffer_phy) {
    xdpu_total_dpureg_map_io = get_dpu_reg_outside(create_tb_batch, output_tensor_buffers, input_tensor_buffers);
  } else {
    xdpu_total_dpureg_map_io = get_dpu_reg_inside(create_tb_batch, output_tensor_buffers, input_tensor_buffers);
  }
  if (!tensorbuffer_phy) {
  __TIC__(INPUT_H2D)
    for (unsigned i = 0; i < input_tensor_buffers.size(); i++) {
      input_tensor_buffers[i]->sync_for_write(0,input_tensor_buffers[i]->get_tensor()->get_element_num()/batch_size_);
    }
  __TOC__(INPUT_H2D)
  }
  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);
  ecmd->cu_mask =  handle_->get_device_info().cu_mask;
  ecmd->extra_cu_masks = 0;
  ecmd->stat_enabled = 1;
  ecmd->state = ERT_CMD_STATE_NEW;
  ecmd->opcode = ERT_EXEC_WRITE;
  ecmd->type = ERT_CTRL;

  // program DPU request
  //
  auto dbg_layers = model_->get_dbg_layers();
  if(!debug_mode_) { //=== run release instructions
    if(dump_mode_ ) { // dump input
      int tensor_idx = 0;
      for(auto& out: dbg_layers[0].inputs) {
        auto offset = std::get<0>(out);
        auto size = std::get<1>(out);
        auto data = std::make_unique<char[]>(size);
        auto reg_id = std::get<3>(out);
        for (int i=0; i < batch_size_; i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, get_addr(reg_id,i,xdpu_total_dpureg_map_io) + offset))
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

    auto info = model_->get_subgraph_info();
#ifndef _WIN32
    vitis::ai::trace::add_trace("dpu-runner", info.name, batch_size_, info.workload, info.depth);
#endif
    dpu_trigger_run(ecmd,xcl_handle, bo_handle, xdpu_total_dpureg_map_io);

    if(dump_mode_ ) {  // dump final output
      int tensor_idx = 0;
      for(auto& out: dbg_layers[0].outputs) {
        auto offset = std::get<0>(out);
        auto size = std::get<1>(out);
        auto data = std::make_unique<char[]>(size);
        auto reg_id = std::get<3>(out);
        for (int i=0; i < batch_size_; i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, get_addr(reg_id, i,xdpu_total_dpureg_map_io) + offset))
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
    if(dump_mode_ && (dbg_layers.size() > 0)) {
      auto& inputs = dbg_layers[0].inputs;
      int tensor_idx = 0;
      for(auto& input: inputs) {
        auto offset = std::get<0>(input);
        auto size = std::get<1>(input);
        auto data = std::make_unique<char[]>(size);
        auto reg_id = std::get<3>(input);
        for (int i=0; i < batch_size_; i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, get_addr(reg_id, i, xdpu_total_dpureg_map_io) + offset))
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
    for(auto iter = dbg_layers.begin() + 1;iter != dbg_layers.end();iter++) {
      auto layer = *iter;
      auto code_info = layer_debug_mode.find(layer.name);
      if (code_info != layer_debug_mode.end()) {
        if((code_info->second).second>0) {
          code_addr_ = (code_info->second).first;
          auto code_info_pre = layer_debug_mode_preload.find(layer.name);
          if (code_info_pre != layer_debug_mode_preload.end()) {
            if((code_info_pre->second).second>0) {
              preload_code_addr_ = (code_info_pre->second).first;
            }
          }
        }

#ifndef _WIN32
        vitis::ai::trace::add_trace("dpu-runner", layer.name, batch_size_, layer.workload, layer.depth);
#endif
        dpu_trigger_run(ecmd,xcl_handle, bo_handle, xdpu_total_dpureg_map_io);
      }

      // Save the outputs to file
      if(dump_mode_) {
        int tensor_idx = 0;
        for(auto& out: layer.outputs) {
          auto offset = std::get<0>(out);
          auto size = std::get<1>(out);
          auto reg_id = std::get<3>(out);
          auto data = std::make_unique<char[]>(size);
          if(check_exist(reg_id, model_->get_output_regid())) {
            for (auto it :  xdpu_total_dpureg_map_io ) {
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
          } else {
            auto iter3 = workspace_addr.begin();
            while(iter3 != workspace_addr.end() ) {
              if(iter3->first == reg_id) {
                for (int bz=0;bz<batch_size_;bz++) {
                  if (xclUnmgdPread(xcl_handle, 0, data.get(), size, iter3->second[bz] + offset))
                    throw std::runtime_error("Error: dump failed!");
                  std::stringstream ss;
                  ss << dump_folder_ << "/E" << bz << "/" << std::get<2>(out);
                  std::ofstream ofs(ss.str(), std::ofstream::binary);
                  ofs.write(data.get(), size);
                  ofs.close();

                } 
              }
              iter3++;
            }

          }
          tensor_idx++;
        }
      }
      layer_idx ++;
    }
  }

  if (!tensorbuffer_phy) {
  __TIC__(OUTPUT_D2H)
    for (unsigned i = 0; i < output_tensor_buffers.size(); i++) {
      output_tensor_buffers[i]->sync_for_read(0,output_tensor_buffers[i]->get_tensor()->get_element_num()/batch_size_);
    }
  __TOC__(OUTPUT_D2H)
  }
  if((!tensorbuffer_phy) &&create_tb_outside) {
    tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, false, buf_id);
  }

}

