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
#include "dpucloud_controller.hpp"
#include "xir/xir.h"
#include "xir/graph/graph.hpp"
#include "xir/graph/subgraph.hpp"
#include "json-c/json.h"

#include "dpu_runner.hpp"
#include "xir/tensor/tensor.hpp"
#include "vart/tensor_buffer.hpp"
//#include "common/graph.hpp"
//#include "tensor_buffer_imp_host.hpp"
//#include "tensor_buffer_imp_view.hpp"
//#include "tensor_buffer_imp_host_phy.hpp"

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

static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
  uint32_t val;
  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
  return val;
}

DpuCloudController::DpuCloudController(std::string meta) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(meta),dump_mode_(false),debug_mode_(false) {
  // assign many contexts -- one for each worker thread
  // threads cannot share contexts (or xclExecWait may miss the 'done' signal)
  Engine& engine = Engine::get_instance();
  for(unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));
  model_ =std::make_shared<DpuXmodel>(meta);
  //auto hbmw = get_hbmw();
  //auto hbmc = get_hbmc();
  //init_graph(hbmw, hbmc);
}

DpuCloudController::DpuCloudController(const xir::Subgraph *subgraph) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(subgraph),dump_mode_(false),debug_mode_(false) {
  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));
  //auto model =new  DpuXmodel(subgraph);
  model_ =std::make_shared<DpuXmodel>(subgraph);
  //auto hbmw = get_hbmw();
  //auto hbmc = get_hbmc();
  //init_graph(hbmw, hbmc);
  //init_graph();
}
DpuCloudController::~DpuCloudController() {
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
      size_t size = tensors[ti]->get_element_num() * dataSize/batch_size_;
      void *data;
      if (posix_memalign(&data, getpagesize(), size*batchSupport))
        throw std::bad_alloc();
      auto dims = tensors[ti]->get_shape();
      dims[0] = batchSupport;
      xir::Tensor *tensor = xir::Tensor::create(tensors[ti]->get_name(), dims, tensors[ti]->get_data_type()).release();

      // make TensorBuffer to hold host memory
      //std::unique_ptr<vart::CpuFlatTensorBuffer> tbuf(
      //  new vart::CpuFlatTensorBuffer(data, tensor));
      std::unique_ptr<vart::TensorBufferExtImpHost> tbuf(
        new vart::TensorBufferExtImpHost(data, tensor));
      tbufs.emplace_back(tbuf.get());
      {
        std::unique_lock<std::mutex> lock(hwbufio_mtx_);
        bufs_.emplace_back(std::move(tbuf));
      }
    }
  }
  return tbufs;

}

std::vector<vart::TensorBuffer*> DpuCloudController::init_tensor_buffer_with_addr(std::vector<uint64_t> data, std::vector<int> tensor_offset, std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine) {
 std::vector<vart::TensorBuffer*>  tbufs;
 for (unsigned bs=0; bs < runEngine; bs++) {
    for (unsigned ti=0; ti < tensors.size(); ti++)
    {
      auto dims = tensors[ti]->get_shape();
      dims[0] = batchSupport;
      xir::Tensor *tensor = xir::Tensor::create(tensors[ti]->get_name(), dims, tensors[ti]->get_data_type()).release();

      // make TensorBuffer to hold host memory
      std::unique_ptr<vart::CpuFlatTensorBuffer> tbuf(
        new vart::CpuFlatTensorBuffer((void*)(data[bs]+tensor_offset[ti]), tensor));
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
      if (posix_memalign(&data, getpagesize(), size*batchSupport))
        throw std::bad_alloc();
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
  //if (hbm.size() > 1) {
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
 // } else {
 //   reg0Mem
 //     = xclAllocUserPtrBO(handle, data, size, handle_->get_device_info().ddr_bank);
 // }
  return reg0Mem;

}
void DpuCloudController::init_graph(vector<unsigned> hbmw, vector<unsigned> hbmc ) {

  auto handle = contexts_[0]->get_dev_handle();
  auto cu_base_addr = handle_->get_device_info().cu_base_addr;
  if(ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK)) {
    //if (subgraph->has_attr("dpu_fingerprint")) {
      uint64_t fingerprint = model_->get_fingerprint();

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
  xclBOProperties boProp;
  dump_mode_ = model_->get_dump_mode();
  debug_mode_ = model_->get_debug_mode();
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
  //out_split=true; 
  //in_split=true; 
  for (unsigned regc=0; regc<model_->get_xdpu_total_reg_map().size(); regc++) {
    xdpu_total_reg_map.emplace((model_->get_xdpu_total_reg_map())[regc]);
  }

    for (auto p : model_->get_parameter()) {
      if (std::get<1>(p)) {
        auto reg0Mem = get_xrt_bo(get<0>(p), get<1>(p), hbmw);
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
  if (model_->get_xdpu_workspace_reg_map().size()>0) {
    for(auto workspace : model_->get_xdpu_workspace_reg_map()) {
       //auto wkBo = get_xrt_bo(workspace.second,)  
       auto buf = create_tensor_buffers_hbm(get_merged_io_tensors(workspace.second),false, get_hbmio());
       if (!buf.empty()) {
       //auto io_buf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf));
         xdpu_workspace_dpu.emplace(workspace.first,buf);
         //if(workspace.first == model_->get_input_regid())
         //  in_split=false;
         //if(workspace.first == model_->get_output_regid())
         //  out_split=false;
       }
    }
  }
  model_->init_vitis_tensors(batch_size_, handle_->get_device_info().device_index);
  program_once_complete = 0;
}

vector<float> DpuCloudController::get_input_scale() {

  return model_->get_input_scales();
  //auto iter = scales.begin();
  //while(iter != scales.end()) {
  //  if (iter->first == tensor->get_name())
  //    return iter->second;
  //  iter++;
  //}
}

vector<float> DpuCloudController::get_output_scale() {
  return model_->get_output_scales();
  //auto iter = scales.begin();
  //while(iter != scales.end()) {
  //  if (iter->first == tensor->get_name())
  //    return iter->second;
  //  iter++;
  //}
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
DpuCloudController::get_merged_io_tensors(int size) const {
  const std::vector<std::int32_t> dims = { 1,  size};
  xir::Tensor *tensor = xir::Tensor::create("inout", dims, xir::DataType{xir::DataType::INT, 8}).release();
  //static xir::Tensor tensor("inout", dims, xir::Tensor::DataType::INT8); 
  return std::vector<const xir::Tensor*>(batch_size_, tensor);
}
std::vector<const xir::Tensor*>
DpuCloudController::get_merged_io_tensors_batch(int size) const {
  const std::vector<std::int32_t> dims = { batch_size_,  size};
  xir::Tensor *tensor = xir::Tensor::create("inout", dims, xir::DataType{xir::DataType::INT, 8}).release();
  //static xir::Tensor tensor("inout", dims, xir::Tensor::DataType::INT8); 
  return std::vector<const xir::Tensor*>(1, tensor);
}

std::vector<vart::TensorBuffer*> DpuCloudController::get_inputs(int batchsz) {
  // TODO if batchsz =! 8 or 1 , create_tensor_buffers for user-requested batchsz
  // E.g., batchsz=1 for MLperf Server Scenario
  if (model_->get_input_regid() == model_->get_output_regid()) {
    int input_bz = (model_->get_input_tensors())[0]->get_shape()[0]/batch_size_;
    if ((batchsz == -1))
    // for default defination
      return init_tensor_buffer(model_->get_input_tensors(),batch_size_*input_bz);
    else if (batchsz == 1)
    // for mlperf defination
      return init_tensor_buffer(model_->get_input_tensors(),batchsz*input_bz,batch_size_);
    else
    // for other user-requested batchsz
      return init_tensor_buffer(model_->get_input_tensors(),batchsz*input_bz);
  } else {
    auto hbmio = get_hbmio();
    return get_outputs_inner(hbmio, true, batchsz);
  }
 
}
std::vector<vart::TensorBuffer*>  DpuCloudController::create_tensor_buffers_hbm(
    const std::vector<const xir::Tensor*> &tensors, bool isInput, vector<unsigned> hbm) {
  std::vector<vart::TensorBuffer*> ret;
  int bankidx=0;
  
  for (auto tensor : tensors) {
    std::vector<const xir::Tensor*> tensorIn;
    tensorIn.emplace_back(tensor);  
    for (unsigned idx = 0; idx<hbm.size(); idx++){
      //auto buf = create_tensor_buffers(tensorIn,isInput,(int)hbm[idx]);
       
      auto buf = create_tensor_buffers(tensorIn,isInput,(int)hbm[bankidx]);
      if (!buf.empty()) {
        if (hbm.size() > 1) {
          bankidx++;
          bankidx = bankidx % batch_size_;
        }
        ret.push_back(buf[0]);
        break;
      } else {
        auto buf = create_tensor_buffers(tensorIn,isInput,(int)hbm[idx]);
        if (!buf.empty()) {
          ret.push_back(buf[0]);
          break;
        }
      }
      if (idx == (hbm.size()-1)) {
        throw std::bad_alloc();
      }
    }
  }  
  return ret;
}
std::vector<vart::TensorBuffer*>  DpuCloudController::create_tensor_buffers_hbm(
  const std::vector<const xir::Tensor*> &tensors, bool isInput, vector<unsigned> hbm, int batch_size) {
  
  unsigned cnt=0;
  vector<unsigned> hbm_use;
  vector<unsigned> hbms;
  std::vector<vart::TensorBuffer*> buf; 
  if ((int)hbm.size() < batch_size) {
    throw std::bad_alloc();
  }
  for (unsigned idx = 0; idx<hbm.size(); idx++){
    //auto buf = create_tensor_buffers(tensorIn,isInput,(int)hbm[idx]);
    hbm_use.emplace_back(hbm[idx]);
    cnt++;
    if ((int)cnt != batch_size) {
      continue;
    }
    cnt = 0;

    buf = create_tensor_buffers(tensors,isInput,hbm_use);
    if (!buf.empty()) {
      break;
    } else {
      hbm_use.clear();
    }
    if (idx == (hbm.size()-1)) {
      throw std::bad_alloc();
    }
  }
  return buf;
  
}
std::vector<vart::TensorBuffer*> DpuCloudController::get_outputs(int batchsz) {
  auto hbmio = get_hbmio();
  //hbm.emplace_back(handle_->get_device_info().ddr_bank); 
  return get_outputs_inner(hbmio, false, batchsz);
}
//std::vector<vart::TensorBuffer*> DpuCloudController::create_tensor_buffer(void* data, std::vector<const xir::Tensor*> tensor) {
//        //std::shared_ptr<vart::rt_engine::TensorBuffer> tbuf = std::make_shared<vart::rt_engine::TensorBufferExtImpHostPhy>(data,tensor);
//  std::vector<vart::TensorBuffer*> rt;
//  std::unique_ptr<vart::rt_engine::TensorBufferExtImpHostPhy> tbuf(
//      new vart::rt_engine::TensorBufferExtImpHostPhy(data, tensor[0]));
//  rt.emplace_back(tbuf.get());
//        //auto tbuf = std::make_shared<vart::rt_engine::TensorBufferExtImpHostPhy>(data,tensor);
//        //rtbufs_.push_back(std::move(tbuf)); 
//
//return rt;
//
//}
std::vector<vart::TensorBuffer*> DpuCloudController::get_outputs_inner(vector<unsigned> hbm, bool isInputs, int batchsz) {
  // TODO if batchsz != 8 or 1, create_tensor_buffers for user-requested batchsz
  // E.g., batchsz=1 for MLperf
  int output_bz = (model_->get_output_tensors())[0]->get_shape()[0]/batch_size_;
  std::vector<const xir::Tensor*> tensors; 
  std::vector<int> tensor_offset;
  std::vector<uint64_t> data; 
  if (isInputs) {
    tensors = model_->get_input_tensors();
    tensor_offset = model_->get_input_offset(); 
  }
  else { 
    tensors = model_->get_output_tensors();
    tensor_offset = model_->get_output_offset(); 
  }
  if ((batchsz == -1) || (batchsz>1)) {
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "generate tensorbuffer.data in batch";
    std::vector<vart::TensorBuffer*>  tbufs;
    std::unordered_map<int,std::vector<vart::TensorBuffer*>>  hwbuf;
    auto iter = xdpu_total_reg_map.begin();
    while(iter !=xdpu_total_reg_map.end()) {
      auto reg_workspace = xdpu_workspace_dpu.find(iter->first);
      if (reg_workspace != xdpu_workspace_dpu.end()) {
        if (!isInputs) {
          hwbuf.emplace(std::make_pair(iter->first,reg_workspace->second));
          iter++;
        } else {
          iter++;
          //continue;
        } 
      } else {
        if (model_->get_input_regid() != model_->get_output_regid()) {
          if (isInputs) {
            if (model_->get_input_regid() != iter->first) {
              iter++;
              continue;
            }
          } else {
            if (model_->get_output_regid() != iter->first) {
              iter++;
              continue;
            }
          }
          auto bufPhy = create_tensor_buffers_hbm(get_merged_io_tensors_batch(iter->second),false, hbm,batch_size_);
          for (unsigned int ts=0;ts< tensors.size(); ts++) {
            std::unique_ptr<vart::TensorBufferExtImpView> buf(
              new vart::TensorBufferExtImpView(tensors[ts], tensor_offset[ts], bufPhy[0]));
            tbufs.emplace_back(buf.get());
            {
              std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
              rtbufs2_.push_back(std::move(buf)); 
            }
          }
          hwbuf.emplace(std::make_pair(iter->first, bufPhy));
          iter++;
          //continue;
        } else { 
          auto buf = create_tensor_buffers_hbm(get_merged_io_tensors(iter->second),false, hbm);
          tbufs = init_tensor_buffer(tensors,batch_size_*output_bz);
          //data.emplace_back(buf->data());
          if (!buf.empty()) {
            hwbuf.emplace(std::make_pair(iter->first,buf));
            iter++;
          }
        }
      }
    }
    {
      std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
      tbuf2hwbufsio2_.emplace(tbufs[0],hwbuf);
    }
    return tbufs;
  } else if (batchsz == 1){
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "generate tensorbuffers in batch";
    std::vector<vart::TensorBuffer*>  tbufs;
    std::vector<std::pair<int,vector<vart::TensorBuffer*>>>  hwbuf;
    auto iter = xdpu_total_reg_map.begin();
    while(iter != xdpu_total_reg_map.end()) {
      auto reg_workspace = xdpu_workspace_dpu.find(iter->first);
      if (reg_workspace != xdpu_workspace_dpu.end()) {
        if (!isInputs) {
          hwbuf.push_back(std::make_pair(iter->first,reg_workspace->second));
          iter++;
        } else {
          iter++;
          //continue;
        } 
      } else {
        if (model_->get_input_regid() != model_->get_output_regid()) {
          if (isInputs) {
            if (model_->get_input_regid() != iter->first) {
              iter++;
              continue;
            }
          } else {
            if (model_->get_output_regid() != iter->first) {
              iter++;
              continue;
            }
          }
          auto bufPhy = create_tensor_buffers_hbm(get_merged_io_tensors(iter->second),false, hbm,1);
          for (int db=0;db<batch_size_;db++) {

            for (unsigned int ts=0;ts< tensors.size(); ts++) {
              auto dims = tensors[ts]->get_shape();
              dims[0] = dims[0]/batch_size_;
              xir::Tensor *tensor = xir::Tensor::create(tensors[ts]->get_name(), dims, tensors[ts]->get_data_type()).release();
              std::unique_ptr<vart::TensorBufferExtImpView> buf(
                new vart::TensorBufferExtImpView(tensor, tensor_offset[ts], bufPhy[db]));
              tbufs.emplace_back(buf.get());
              {
                std::unique_lock<std::mutex> lock(hwbufio_mtx_);
                rtbufs_.emplace(buf.get(), bufPhy[db]);
                rtbufs2_.push_back(std::move(buf));
              }
            }
          }
          hwbuf.push_back(std::make_pair(iter->first, bufPhy));
          iter++;
        } else {
          tbufs = init_tensor_buffer(tensors,batchsz*output_bz,batch_size_);
          auto buf = create_tensor_buffers_hbm(get_merged_io_tensors(iter->second),false,hbm);
          if (!buf.empty()) {
            hwbuf.push_back(std::make_pair(iter->first, buf));
            iter++;
          }
        }
      }
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
    //}
  } else {
    throw std::runtime_error("Error: invilad batch format");
  }
}

void DpuCloudController::data_fix2float(float* dataDst, int8_t* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (float)(dataSrc[i]*scale);
}

void DpuCloudController::data_float2fix(int8_t* dataDst, float* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (int8_t)(dataSrc[i]*scale);
}
void DpuCloudController::free_buffers(std::vector<vart::TensorBuffer*> &tbufs, bool isInput) {
  if (model_->get_input_regid() != model_->get_output_regid()) {
    unsigned int cnt = 0;
    std::unique_lock<std::mutex> lock(hwbufio_mtx_);
    for (unsigned ti=0; ti < tbufs.size(); ti++)
    {
       for (auto it=rtbufs2_.begin(); it != rtbufs2_.end(); it++) {
         if (it->get() == tbufs[ti])
         {
            rtbufs2_.erase(it);
            break;
         }
       }
       cnt++;
       auto buf = rtbufs_.find(tbufs[ti]);
       if (buf != rtbufs_.end()) {
         std::unique_lock<std::mutex> lock(tbuf_mtx_);
         if (cnt==model_->get_output_offset().size()) {  
            tbufs2dbufs_.erase(buf->second);
            for (auto it=tbufs_.begin(); it != tbufs_.end(); it++) {
              if (it->get() == buf->second)
              {
                   tbufs_.erase(it);
                 break;
              }
          }
          cnt = 0;
          rtbufs_.erase(buf);
        }
      }
      tbuf2hwbufsio_.erase(tbufs[ti]);
    }

  } else {

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

      // here only free the buffer that called in run(), run only call get_inputs(1)/get_outputs(1)

    } else {
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
}

size_t DpuCloudController::getInputBufferSize() {
  return model_->get_total_insize();
}

size_t DpuCloudController::getOutputBufferSize() {
  return model_->get_total_outsize();
}

vector<int32_t> DpuCloudController::getInputOffsets() {
  return model_->get_input_offset();
}

vector<int32_t> DpuCloudController::getOutputOffsets() {
  return model_->get_output_offset();
}
bool DpuCloudController::check_tensorbuffer_outside(const std::vector<vart::TensorBuffer*> &outputs) {
  bool create_tb_outside=false;
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
  return create_tb_outside;
}
void DpuCloudController::tensorbuffer_trans(std::vector<vart::TensorBuffer*> &input_tensor_buffers, std::vector<vart::TensorBuffer*> &output_tensor_buffers, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, bool is_input) {
  int ibs = inputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_input_tensors()[0]->get_shape()[0];
  int obs = outputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_output_tensors()[0]->get_shape()[0];
  // check if tensorbuffer store batch inputs/outputs
  int inputBs = batch_size_;
  if ((inputs.size()/model_->get_input_tensors().size())>1)
    inputBs = inputs.size()/model_->get_input_tensors().size();
  else
    inputBs = ibs;
  if (is_input) {
    input_tensor_buffers = get_inputs(1);
    output_tensor_buffers = get_outputs(1);
    for (unsigned i=0; i < model_->get_input_tensors().size(); i++ ) {
      int tensor_size = get_input_tensors()[i]->get_element_num()/batch_size_;
      unsigned cnt=0;
      auto dims = input_tensor_buffers[i]->get_tensor()->get_shape();
      for (unsigned int ds=0;ds<dims.size();ds++)
        dims[ds]=0;
      for (unsigned j=0; j < inputs.size(); j++) {
        if (model_->get_input_tensors()[i]->get_name().find(inputs[j]->get_tensor()->get_name()) != std::string::npos) {
          if (ibs == inputBs) { //one tensrobuffer store batch
            for (int b=0; b < ibs; b++) {
              if (inputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
                data_float2fix((int8_t*)input_tensor_buffers[b*model_->get_input_tensors().size()+i]->data(dims).first,(float*)inputs[j]->data().first+b*tensor_size,tensor_size, model_->get_input_scales()[i]);
              else
                memcpy((int8_t*)input_tensor_buffers[b*model_->get_input_tensors().size()+i]->data(dims).first,(int8_t*)inputs[j]->data().first+b*tensor_size,tensor_size);
              cnt++;
            }
          }
          else {
            if (inputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
      	data_float2fix((int8_t*)input_tensor_buffers[cnt*model_->get_input_tensors().size()+i]->data(dims).first,(float*)inputs[j]->data().first,tensor_size, model_->get_input_scales()[i]);
            else
      	memcpy((int8_t*)input_tensor_buffers[cnt*model_->get_input_tensors().size()+i]->data(dims).first,(int8_t*)inputs[j]->data().first,tensor_size);
            cnt++;
          }

        }
  
      }
      if (cnt == 0)
        throw std::runtime_error("Error: invilad tensorbuffer input");
    }
  } else {

      for (unsigned i=0; i < model_->get_output_tensors().size(); i++  ) {
        auto tensor_size = model_->get_output_tensors()[i]->get_element_num()/batch_size_;
        unsigned cnt=0;
        auto dims = output_tensor_buffers[i]->get_tensor()->get_shape();
        for (unsigned int ds=0;ds<dims.size();ds++)
          dims[ds]=0;
        for (unsigned j=0; j < outputs.size(); j++) {
          if (model_->get_output_tensors()[i]->get_name().find(outputs[j]->get_tensor()->get_name()) != std::string::npos) {
            if (ibs == inputBs) {
              for (int b=0; b < obs; b++) {
                if (outputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
                  data_fix2float((float*)outputs[j]->data().first+b*tensor_size, (int8_t*)output_tensor_buffers[b*model_->get_output_tensors().size()+i]->data(dims).first,tensor_size,model_->get_output_scales()[i]);
                else {
                  memcpy((char*)outputs[j]->data().first+b*tensor_size, (void*)output_tensor_buffers[b*model_->get_output_tensors().size()+i]->data(dims).first,tensor_size);
                }
                cnt++;
              }
            }
            else {
              if (outputs[j]->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
                data_fix2float((float*)outputs[j]->data().first,(int8_t*)output_tensor_buffers[cnt*model_->get_output_tensors().size()+i]->data(dims).first,tensor_size,model_->get_output_scales()[i]);
              else
                memcpy((int8_t*)outputs[j]->data().first,(int8_t*)output_tensor_buffers[cnt*model_->get_output_tensors().size()+i]->data(dims).first,tensor_size);
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
vector<std::tuple<int, int,uint64_t>>  DpuCloudController::get_dpu_reg_inside(bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, std::vector<vart::TensorBuffer*> &output_tensor_buffers, std::vector<vart::TensorBuffer*> &input_tensor_buffers  ) {
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;
  std::vector<XrtDeviceBuffer*> io_bufs(batch_size_);
    
//  if (!tensorbuffer_phy) { 
    if (create_tb_batch) {
      {
        std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
        auto it = tbuf2hwbufsio2_.find(output_tensor_buffers[0]);
        if ((it == tbuf2hwbufsio2_.end()))
          throw std::runtime_error("TensorBuffer not found");
        auto  hwbufs = it->second;
        auto iter = xdpu_total_reg_map.begin();
        while(iter != xdpu_total_reg_map.end()) {
          if ((iter->first != model_->get_input_regid()) || (model_->get_input_regid() == model_->get_output_regid())) {
            auto reg_map = hwbufs.find(iter->first);
            if ((reg_map == hwbufs.end()))
              throw std::runtime_error("Output TensorBuffer not found");
            auto buf = reg_map->second;
            for (int i=0; i < batch_size_; i++) {
              if ((iter->first == model_->get_output_regid()) &&(model_->get_input_regid() != model_->get_output_regid())) {
                xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first, i, buf[0]->data_phy(std::vector<int>{i,0}).first));
              } else {
                io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf[i]));
                //reg_addrs[iter->first-1][i] = io_bufs[i]->get_phys_addr();
                xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_bufs[i]->get_phys_addr()));
                LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
                  <<"Engine : " << i<<  " workspace reg_id: " 
                  << iter->first
                  << " phy_addr: " << std::hex 
                  << io_bufs[i]->get_phys_addr();
              }
            }
          } 
          iter++;
        }
      }
      //TODO
      if (model_->get_input_regid() != model_->get_output_regid()){
        std::unique_lock<std::mutex> lock(hwbufio2_mtx_);
        auto it = tbuf2hwbufsio2_.find(input_tensor_buffers[0]);
        if ((it == tbuf2hwbufsio2_.end()))
          throw std::runtime_error("TensorBuffer not found");
        auto  hwbufs = it->second;
        auto iter = xdpu_total_reg_map.begin();
        while(iter != xdpu_total_reg_map.end()) {
          if (iter->first == model_->get_input_regid()) {
            auto reg_map = hwbufs.find(iter->first);
            if ((reg_map == hwbufs.end()))
              throw std::runtime_error("Input TensorBuffer not found");
            auto buf = reg_map->second;
            for (int i=0; i < batch_size_; i++) {
              xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first, i, buf[0]->data_phy(std::vector<int>{i,0}).first));
              //io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf[i]));
              ////reg_addrs[iter->first-1][i] = io_bufs[i]->get_phys_addr();
              //xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_bufs[i]->get_phys_addr()));
              LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
                <<"Engine : " << i<<  " workspace reg_id: " 
                << iter->first
                << " phy_addr: "
                << buf[0]->data_phy(std::vector<int>{i,0}).first;
            }
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
            throw std::runtime_error("output TensorBuffer not found");
          auto  hwbufs = it->second;
          auto iter = xdpu_total_reg_map.begin();
          while(iter != xdpu_total_reg_map.end()) {
            //if (iter->first != model_->get_input_regid()) {
            if ((iter->first != model_->get_input_regid()) || (model_->get_input_regid() == model_->get_output_regid())) {
              auto reg_map = hwbufs.find(iter->first);
              if ((reg_map == hwbufs.end()))
                throw std::runtime_error("output TensorBuffer not found");
              auto buf = reg_map->second;
              if ((iter->first == model_->get_output_regid()) &&(model_->get_input_regid() != model_->get_output_regid())) {
                xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first, i, buf->data_phy({0,0}).first));
              } else {
                io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf));
              //reg_addrs[iter->first-1][i] = io_bufs[i]->get_phys_addr();
                xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_bufs[i]->get_phys_addr()));
                LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
                  <<"Engine : " << i<<  " workspace reg_id: " 
                  << iter->first
                  << " phy_addr: " << std::hex
                  << io_bufs[i]->get_phys_addr();
              }
            }
            iter++;
          }
        }

        if (model_->get_input_regid() != model_->get_output_regid()){
          std::unique_lock<std::mutex> lock(hwbufio_mtx_);
          auto it = tbuf2hwbufsio_.find(input_tensor_buffers[i]);
          if ((it == tbuf2hwbufsio_.end()))
            throw std::runtime_error("TensorBuffer not found");
          auto  hwbufs = it->second;
          auto iter = xdpu_total_reg_map.begin();
          while(iter != xdpu_total_reg_map.end()) {
            if (iter->first == model_->get_input_regid()) {
              auto reg_map = hwbufs.find(iter->first);
              if ((reg_map == hwbufs.end()))
                throw std::runtime_error("TensorBuffer not found");
              auto buf = reg_map->second;
              io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(buf));
              //reg_addrs[iter->first-1][i] = io_bufs[i]->get_phys_addr();
              //xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_bufs[i]->get_phys_addr()));
              xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first, i, buf->data_phy({0,0}).first));
              LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
                <<"Engine : " << i<<  " workspace reg_id: " 
                << iter->first << std::hex
                << " phy_addr: "
                << buf->data_phy({0,0}).first;
            }
            iter++;
          }
        }
      }
    }
    for (auto iter2 : xdpu_total_dpureg_map2) {
      if (std::get<0>(iter2) == model_->get_input_regid())
        in_addrs[std::get<1>(iter2)] = std::get<2>(iter2);
      if (std::get<0>(iter2) == model_->get_output_regid())
        out_addrs[std::get<1>(iter2)] = std::get<2>(iter2); 
    }   
  return xdpu_total_dpureg_map2;
}

vector<std::tuple<int, int,uint64_t>>  DpuCloudController::get_dpu_reg_outside(xclDeviceHandle xcl_handle,  bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs) {
  auto hbm = get_hbmio();
  //hbm.emplace_back(handle_->get_device_info().ddr_bank);
  return get_dpu_reg_outside_hbm(xcl_handle, create_tb_batch, in_addrs, out_addrs, inputs, outputs, hbm);
}
vector<std::tuple<int, int,uint64_t>>  DpuCloudController::get_dpu_reg_outside_hbm(xclDeviceHandle xcl_handle,  bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, vector<unsigned> hbm ) {
  // for the condition that alloc memory without API
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;
  if (model_->is_splitio()) {
  //if((model_->get_xdpu_total_reg_map()).find(1) && (model_->get_xdpu_total_reg_map()).find(2)) {
    for (int i=0; i < batch_size_; i++) {
          auto dims = inputs[0]->get_tensor()->get_shape();
          dims[0] = i;
          for (unsigned int ds=1;ds<dims.size();ds++)
            dims[ds]=0;
          auto dims_out = outputs[0]->get_tensor()->get_shape();
          dims_out[0] = i;
          for (unsigned int ds=1;ds<dims_out.size();ds++)
            dims_out[ds]=0;
      if (create_tb_batch) { 
        //for (unsigned t=0; t < inputs.size(); t++ ) {
          if (model_->get_input_tensors()[0]->get_name().find(inputs[0]->get_tensor()->get_name()) != std::string::npos) {
            in_addrs[i] = inputs[0]->data_phy(dims).first-model_->get_input_offset()[0]+i*model_->get_input_tensors()[0]->get_element_num()/batch_size_;
            //reg_addrs[model_->get_input_regid()-1][i] = in_addrs[i];
            xdpu_total_dpureg_map2.push_back(std::make_tuple(model_->get_input_regid(),i,in_addrs[i]));
            break;
          }
        //}
        //for (unsigned t=0; t < outputs.size(); t++ ) {
          if (model_->get_output_tensors()[0]->get_name().find(outputs[0]->get_tensor()->get_name()) != std::string::npos) {
            out_addrs[i] = outputs[0]->data_phy(dims_out).first-model_->get_output_offset()[0]+i*model_->get_output_tensors()[0]->get_element_num()/batch_size_;
            //reg_addrs[model_->get_output_regid()-1][i] = out_addrs[i];
            xdpu_total_dpureg_map2.push_back(std::make_tuple(model_->get_output_regid(),i,out_addrs[i]));
            break;
          }
        //}
      } else {
        //for (unsigned t=cnt; t < inputs.size(); t++ ) {
          if (model_->get_input_tensors()[0]->get_name().find(inputs[0]->get_tensor()->get_name()) != std::string::npos) {
            in_addrs[i] = inputs[0]->data_phy(dims).first-model_->get_input_offset()[0];
            //reg_addrs[model_->get_input_regid()-1][i] = in_addrs[i];
            xdpu_total_dpureg_map2.push_back(std::make_tuple(model_->get_input_regid(),i,in_addrs[i]));
            break;
          }
        //}
        //for (unsigned t=cnt_out; t < outputs.size(); t++ ) {
          if (model_->get_output_tensors()[0]->get_name().find(outputs[0]->get_tensor()->get_name()) != std::string::npos) {
            out_addrs[i] = outputs[0]->data_phy(dims_out).first-model_->get_output_offset()[0];
            //reg_addrs[model_->get_output_regid()-1][i] = out_addrs[i];
            xdpu_total_dpureg_map2.push_back(std::make_tuple(model_->get_output_regid(),i,out_addrs[i]));
            break;
          }
        //}

      }
      //}
      auto iter = xdpu_total_reg_map.begin();
      while(iter !=xdpu_total_reg_map.end()) {
        auto reg_workspace = xdpu_workspace_dpu.find(iter->first);
        if (reg_workspace != xdpu_workspace_dpu.end()) {
          auto io_buf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(reg_workspace->second[i]));
          xdpu_total_dpureg_map2.push_back(std::make_tuple(iter->first,i,io_buf->get_phys_addr()));
        }
        iter++;
      }
    }
  } else {

    throw std::runtime_error("need enable split-io");
  }
  return xdpu_total_dpureg_map2;
}
void DpuCloudController::run(const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) {
  std::vector<vart::TensorBuffer*> input_tensor_buffers;
  std::vector<vart::TensorBuffer*> output_tensor_buffers;
  int inputBs = batch_size_;
  if(inputs.size()%model_->get_input_tensors().size())
    throw std::runtime_error("Error: input tensorbuffers error");
  int ibs = inputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_input_tensors()[0]->get_shape()[0];
  int obs = outputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_output_tensors()[0]->get_shape()[0];
  // check if tensorbuffer store batch inputs/outputs
  if ((inputs.size()/model_->get_input_tensors().size())>1)
    inputBs = inputs.size()/model_->get_input_tensors().size();
  else
    inputBs = ibs;
  if ((ibs < obs) || (inputBs > batch_size_) )
    throw std::runtime_error("Error: size of tensorbuffer not supported");
  //}
  bool create_tb_outside=check_tensorbuffer_outside(outputs);
  bool create_tb_batch=false;
  bool tensorbuffer_phy=true;
  //if (!model_->is_splitio())
  if (!create_tb_outside) {

    if (((ibs == inputBs)&&(ibs > 1) && (batch_size_ > 1)) || (batch_size_==1))
    {
      create_tb_batch = true;
    }

  }
  if (outputs[0]->get_location() == vart::TensorBuffer::location_t::HOST_VIRT)
    tensorbuffer_phy=false;
  if(create_tb_outside) {
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "create tensorbuffer by user side";
    if (!tensorbuffer_phy) {
      tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, true);
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
  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;

  std::vector<uint64_t> in_addrs(batch_size_);
  std::vector<uint64_t> out_addrs(batch_size_);
  //if (!tensorbuffer_phy) {
    xdpu_total_dpureg_map2 = get_dpu_reg_inside(create_tb_batch, in_addrs, out_addrs, output_tensor_buffers, input_tensor_buffers);
  //} else {
  //  xdpu_total_dpureg_map2 = get_dpu_reg_outside(xcl_handle, create_tb_batch, in_addrs, out_addrs, inputs, outputs);
  //}
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
      for (unsigned j=0; j < model_->get_input_offset().size(); j++) {
        uint8_t* dataPtr;
        const auto inSize = get_input_tensors()[j]->get_element_num()/batch_size_;
        if (create_tb_batch) {
          auto dims = input_tensor_buffers[j]->get_tensor()->get_shape();
          dims[0] = i;
          for (unsigned int ds=1;ds<dims.size();ds++)
            dims[ds]=0;
          //dataPtr = ((uint8_t*)input_tensor_buffers[j]->data({i,0}).first)+inSize*i;
          dataPtr = ((uint8_t*)input_tensor_buffers[j]->data(dims).first);
        } else {
          auto dims = input_tensor_buffers[i*model_->get_input_offset().size()+j]->get_tensor()->get_shape();
          for (unsigned int ds=0;ds<dims.size(); ds++)
            dims[ds] =0;
          dataPtr =(uint8_t*)input_tensor_buffers[i*model_->get_input_offset().size()+j]->data(dims).first;
        }
        if (xclUnmgdPwrite(xcl_handle, 0, (void *)dataPtr, inSize,
          in_addrs[i] + model_->get_input_offset()[j]))
          throw std::runtime_error("Error: upload failed");
      }

    }
  }
  __TOC__(INPUT_H2D)
  int p;
  int exec_buf_result;
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
          // _show_regs(xcl_handle, handle_->get_device_info().cu_base_addr);
          std::cout << "Error: CU timeout when do preload " << std::endl;
          throw std::runtime_error("Error: CU timeout when do preload "
            + std::to_string(handle_->get_device_info().cu_index));
        }
        regVals.clear();
      }
    }
    regVals.push_back(  { XDPU_CONTROL_INSTR_L / 4, code_addr_ & 0xFFFFFFFF });
    regVals.push_back(  { XDPU_CONTROL_INSTR_H / 4, (code_addr_ >> 32) & 0xFFFFFFFF });
    //regVals.push_back(  { XDPU_CONTROL_ADDR_0_L / 4, reg0_addr_ & 0xFFFFFFFF });
    //regVals.push_back(  { XDPU_CONTROL_ADDR_0_H / 4, (reg0_addr_ >> 32) & 0xFFFFFFFF });
    auto iter = xdpu_total_dpureg_map.begin();
    while(iter !=xdpu_total_dpureg_map.end()) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "parameter: "  //
          << std::hex
          << iter->second      //
          ;
      iter++;
    }
    // program DPU input/output addrs
    for (auto iter2 : xdpu_total_dpureg_map2) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, std::get<2>(iter2) & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, (std::get<2>(iter2) >> 32) & 0xFFFFFFFF });
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "io: " 
          << std::hex //
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

    // exec kernel
    exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
    if (exec_buf_result)
      throw std::runtime_error("Error: xclExecBuf failed");

    // wait for kernel
    for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
            && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);

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
  // download results into output TensorBuffers
  };

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
        for (unsigned i=0; i < in_addrs.size(); i++) {
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
      for(auto& out: dbg_layers[0].outputs) {
        auto offset = std::get<0>(out);
        auto size = std::get<1>(out);
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < out_addrs.size(); i++) {
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
    if(dump_mode_ && (dbg_layers.size() > 0)) {
      auto& inputs = dbg_layers[0].inputs;
      int tensor_idx = 0;
      for(auto& input: inputs) {
        auto offset = std::get<0>(input);
        auto size = std::get<1>(input);
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < in_addrs.size(); i++) {
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
      //if(std::get<1>(layer.code_addr) > 0) {
      //  code_addr_ = std::get<0>(layer.code_addr);
       }
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
      for (unsigned j=0; j< model_->get_output_offset().size(); j++) {
        const auto outSize = get_output_tensors()[j]->get_element_num()/batch_size_;
        int8_t* dataPtr;
        if (create_tb_batch) {
          auto dims = output_tensor_buffers[j]->get_tensor()->get_shape();
          dims[0] = i;
          for (unsigned int ds=1;ds<dims.size();ds++)
            dims[ds]=0;
          //dataPtr = ((uint8_t *)output_tensor_buffers[j]->data({i,0}).first)+outSize*i;
          dataPtr = ((int8_t *)output_tensor_buffers[j]->data(dims).first);
        } else {
          auto dims = output_tensor_buffers[i*model_->get_output_offset().size()+j]->get_tensor()->get_shape();
          for (unsigned int ds=0;ds<dims.size();ds++)
            dims[ds]=0;
          dataPtr = (int8_t *)output_tensor_buffers[i*model_->get_output_offset().size()+j]->data(dims).first;
        }
        //__TIC_PROFILING__(OUTPUT)
        if (xclUnmgdPread(xcl_handle, 0, (void*)dataPtr,
          outSize,
          out_addrs[i] + model_->get_output_offset()[j]))
          throw std::runtime_error("Error: download failed");
        //__TOC_PROFILING__(OUTPUT)
      }
    }
  }
  __TOC__(OUTPUT_D2H)
  if((!tensorbuffer_phy) &&create_tb_outside) {
    tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, false);
  }


}

