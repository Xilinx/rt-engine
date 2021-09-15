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
#include "dpuv3me_controller.hpp"
#include "xir/graph/graph.hpp"
#include "xir/graph/subgraph.hpp"
#include "json-c/json.h"

#include "dpu_runner.hpp"
#include "xir/tensor/tensor.hpp"
#include "vart/tensor_buffer.hpp"
#include "trace.hpp"
//#include "vart/trace/trace.hpp"


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

#define BATCHSIZE 1


DEF_ENV_PARAM(DPU_HBM_START, "0");
DEF_ENV_PARAM(DPU_OUTPUT_ADDR, "0");
DEF_ENV_PARAM(DPU_HW_POST, "0");

DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0");
DEF_ENV_PARAM(XLNX_ENABLE_DUMP, "0");
DEF_ENV_PARAM(XLNX_ENABLE_DEBUG_MODE, "0");
DEF_ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK, "0");
DEF_ENV_PARAM(ENABLE_TB_CREATE, "0");

DEF_ENV_PARAM(CTRLER_RUN, "0");
DEF_ENV_PARAM(XCLEXECBUF, "0");
DEF_ENV_PARAM(DPU_IP_COUNTER, "0");
DEF_ENV_PARAM(DPU_DUMP_REG, "0");
DEF_ENV_PARAM(XRT_STAT, "0");

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



/*
 * latency checking under XRT API.
*/
#include <getopt.h>
#include <iostream>
#include <stdexcept>
#include <string>
#include <cstring>
#include <vector>
#include <algorithm>
#include <time.h>

#include "xrt.h"
#include "ert.h"

#define	SAMPLES 10

/* Full cycle of a CU cmd:
 * App -> driver -> CU -> driver -> App
 */
struct timestamps {
    uint64_t total;
    uint64_t to_driver;
    uint64_t to_cu;
    uint64_t cu_complete;
    uint64_t done;
};

static inline uint64_t
tp2ns(struct timespec *tp)
{
    return (uint64_t)tp->tv_sec * 1000000000UL + tp->tv_nsec;
}

static void
print_one_timestamp(timestamps& ts)
{
    std::cout << "Total: " << ts.total / 1000 << "us\t"
              << "ToDriver: " << ts.to_driver / 1000 << "us\t"
              << "ToCU: " << ts.to_cu / 1000 << "us\t"
              << "Complete: " << ts.cu_complete / 1000 << "us\t"
              << "Done: " << ts.done / 1000 << "us"
              << std::endl;
}

static bool
timestamp_comp(const timestamps& ts1, const timestamps& ts2)
{
    return ts1.total < ts2.total;
}

static void
print_timestamps(std::vector<timestamps>& tslist)
{
    std::sort(tslist.begin(), tslist.end(), timestamp_comp);
    int step = tslist.size() / SAMPLES;
    if (step == 0)
        step = 1;
    for (unsigned int i = 0; i < tslist.size(); i += step)
        print_one_timestamp(tslist[i]);
}



static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
  uint32_t val;
  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
  return val;
}

DpuV3meController::DpuV3meController(std::string meta, xir::Attrs* attrs)
  : DpuCloudController(meta, attrs) {

  dpu_hbm_start = ENV_PARAM(DPU_HBM_START)? ENV_PARAM(DPU_HBM_START) : 16;
  for (int i=dpu_hbm_start; i<32;i++)
    hbm.emplace_back(i);
  init_graph(hbm,hbm,attrs);
}

DpuV3meController::DpuV3meController(const xir::Subgraph *subgraph, xir::Attrs* attrs) 
  : DpuCloudController(subgraph, attrs) {

  dpu_hbm_start = ENV_PARAM(DPU_HBM_START)? ENV_PARAM(DPU_HBM_START) : 16;
  for (int i=dpu_hbm_start; i<32;i++)
    hbm.emplace_back(i);
  init_graph(hbm,hbm,attrs);
}
DpuV3meController::~DpuV3meController() {
}
std::tuple<uint64_t,int32_t,std::string> DpuV3meController::alloc_and_fill_device_memory(xclDeviceHandle handle, std::vector<char> code) {
  xclBOProperties boProp;
  void *codePtr = NULL;
  std::tuple<uint64_t,int32_t,std::string> data;
  unsigned size = code.size();
  if (posix_memalign(&codePtr, getpagesize(), size)) throw std::bad_alloc();

  for (unsigned i=0; i < size; i++){
    ((char*)codePtr)[i] = code[i];
  }
  for (int idx=dpu_hbm_start; idx<32; idx++) {
    auto codeMem = xclAllocUserPtrBO(handle, codePtr, size, idx);
    if (codeMem == NULLBO) {
      if (idx == 31) {
        throw std::bad_alloc();
      }else {
        continue;
      }
    }
    xclSyncBO(handle, codeMem, XCL_BO_SYNC_BO_TO_DEVICE, size, 0);
    xclGetBOProperties(handle, codeMem, &boProp);
    std::get<0>(data) = boProp.paddr;
    std::get<1>(data) = size;
    break;
  }
  //free(codePtr);
  return data;
}

//std::vector<vart::TensorBuffer*> DpuV3meController::get_outputs(int batchsz) {
//    return get_outputs_inner(hbm, batchsz);
//}
std::vector<unsigned> DpuV3meController::get_hbmw() {
  return hbm;
}
std::vector<unsigned> DpuV3meController::get_hbmc() {
  return hbm;
}
std::vector<unsigned> DpuV3meController::get_hbmio() {
  return hbm;
}
static void _show_regs(xclDeviceHandle xcl_handle, uint64_t cuba){
  for(unsigned long offset : {cuba}){
    std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_LOAD_START) << std::endl;
    std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_LOAD_END) << std::endl;
    std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_SAVE_START) << std::endl;
    std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_SAVE_END) << std::endl;
    std::cout << "CONV START:" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_CONV_START) << std::endl;
    std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_CONV_END) << std::endl;
    std::cout << "MISC START:" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_MISC_START) << std::endl;
    std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle,  offset+ DPUREG_MISC_END) << std::endl;

    std::cout << "IP COUNTER: "<< read32_dpu_reg(xcl_handle,  offset+DPUREG_CYCLE_COUNTER) <<std::endl;

    std::cout << "0x80:" << read32_dpu_reg(xcl_handle,  offset+ 0x80) << std::endl;
    std::cout << "0x84:" << read32_dpu_reg(xcl_handle,  offset+ 0x84) << std::endl;
    std::cout << "0x88:" << read32_dpu_reg(xcl_handle,  offset+ 0x88) << std::endl;
    std::cout << "0x8c:" << read32_dpu_reg(xcl_handle,  offset+ 0x8c) << std::endl;

    std::cout << "0x90:" << read32_dpu_reg(xcl_handle,  offset+ 0x90) << std::endl;
    std::cout << "0x94:" << read32_dpu_reg(xcl_handle,  offset+ 0x94) << std::endl;
    std::cout << "0x98:" << read32_dpu_reg(xcl_handle,  offset+ 0x98) << std::endl;
    std::cout << "0x9c:" << read32_dpu_reg(xcl_handle,  offset+ 0x9c) << std::endl;

    std::cout << "0xa0:" << read32_dpu_reg(xcl_handle,  offset+ 0xa0) << std::endl;
    std::cout << "0xa8:" << read32_dpu_reg(xcl_handle,  offset+ 0xa8) << std::endl;
    std::cout << std::endl;
    std::cout << std::endl;

    std::cout << "0x100:" << read32_dpu_reg(xcl_handle,  offset+ 0x100) << std::endl;
    std::cout << "0x104:" << read32_dpu_reg(xcl_handle,  offset+ 0x104) << std::endl;
    std::cout << "0x108:" << read32_dpu_reg(xcl_handle,  offset+ 0x108) << std::endl;
    std::cout << "0x10c:" << read32_dpu_reg(xcl_handle,  offset+ 0x10c) << std::endl;

    std::cout << "0x110:" << read32_dpu_reg(xcl_handle,  offset+ 0x110) << std::endl;
    std::cout << "0x114:" << read32_dpu_reg(xcl_handle,  offset+ 0x114) << std::endl;
    std::cout << "0x118:" << read32_dpu_reg(xcl_handle,  offset+ 0x118) << std::endl;
    std::cout << "0x11c:" << read32_dpu_reg(xcl_handle,  offset+ 0x11c) << std::endl;

    std::cout << "0x120:" << read32_dpu_reg(xcl_handle,  offset+ 0x120) << std::endl;
    std::cout << "0x124:" << read32_dpu_reg(xcl_handle,  offset+ 0x124) << std::endl;
    std::cout << "0x128:" << read32_dpu_reg(xcl_handle,  offset+ 0x128) << std::endl;
    std::cout << "0x12c:" << read32_dpu_reg(xcl_handle,  offset+ 0x12c) << std::endl;

    std::cout << "0x130:" << read32_dpu_reg(xcl_handle,  offset+ 0x130) << std::endl;
    std::cout << "0x134:" << read32_dpu_reg(xcl_handle,  offset+ 0x134) << std::endl;
    std::cout << "0x138:" << read32_dpu_reg(xcl_handle,  offset+ 0x138) << std::endl;
    std::cout << "0x13c:" << read32_dpu_reg(xcl_handle,  offset+ 0x13c) << std::endl;

    std::cout << "0x140:" << read32_dpu_reg(xcl_handle,  offset+ 0x140) << std::endl;
    std::cout << "0x144:" << read32_dpu_reg(xcl_handle,  offset+ 0x144) << std::endl;
    std::cout << std::endl;
    std::cout << std::endl;

    std::cout << "0x1ec:" << read32_dpu_reg(xcl_handle,  offset+ 0x1ec) << std::endl;
    std::cout << std::endl;
    std::cout << std::endl;
    std::cout << std::endl;

    std::cout << "0x1f0:" << read32_dpu_reg(xcl_handle,  offset+ 0x1f0) << std::endl;
    std::cout << "0x1f4:" << read32_dpu_reg(xcl_handle,  offset+ 0x1f4) << std::endl;
    std::cout << "0x1f8:" << read32_dpu_reg(xcl_handle,  offset+ 0x1f8) << std::endl;
    std::cout << "0x1fc:" << read32_dpu_reg(xcl_handle,  offset+ 0x1fc) << std::endl;
    std::cout << "###############################"<<std::endl;
  }
}

void DpuV3meController::run(const std::vector<vart::TensorBuffer*> &inputs,
    const std::vector<vart::TensorBuffer*> &outputs) {
  std::vector<vart::TensorBuffer*> input_tensor_buffers;
  std::vector<vart::TensorBuffer*> output_tensor_buffers;
  if(inputs.size()%model_->get_input_tensors().size())
    throw std::runtime_error("Error: input tensorbuffers error");
  unsigned ibs = inputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_input_tensors()[0]->get_shape()[0];
  unsigned obs = outputs[0]->get_tensor()->get_shape()[0]*batch_size_/model_->get_output_tensors()[0]->get_shape()[0];

  unsigned inputBs;
  if ((inputs.size()/model_->get_input_tensors().size())>1)
    inputBs = inputs.size()/model_->get_input_tensors().size();
  else
    inputBs = ibs;
  if ((ibs < obs) || (inputBs > BATCHSIZE) )
    throw std::runtime_error("Error: size of tensorbuffer not supported");
  bool create_tb_outside=check_tensorbuffer_outside(outputs);
  bool create_tb_batch=false;
  bool tensorbuffer_phy=true;
  if (outputs[0]->get_location() == vart::TensorBuffer::location_t::HOST_VIRT)
    tensorbuffer_phy=false;
  //if ((!create_tb_outside) || tensorbuffer_phy) {

    if (((ibs == inputBs)&&(ibs > 1) && (batch_size_ > 1)) || (batch_size_==1))
    {
      create_tb_batch = true;
    }

  //}
  if(create_tb_outside) {
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "create tensorbuffer by user side";
    if (!tensorbuffer_phy) {
      tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, true);
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
  //auto xcl_handle_tmp = handle_->get_context().get_dev_handle();
  auto bo_handle = context.get_bo_handle();
  auto bo_addr = context.get_bo_addr();

  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;

  std::vector<uint64_t> in_addrs(batch_size_);
  std::vector<uint64_t> out_addrs(batch_size_);
  if (create_tb_outside && tensorbuffer_phy) {
    xdpu_total_dpureg_map2 = get_dpu_reg_outside(create_tb_batch, in_addrs, out_addrs, input_tensor_buffers, output_tensor_buffers);
  } else {
    xdpu_total_dpureg_map2 = get_dpu_reg_inside(create_tb_batch, in_addrs, out_addrs, output_tensor_buffers, input_tensor_buffers);
  }

  // upload batch of inputs
  //const auto inSize = get_input_tensors()[0]->get_element_num();
  __TIC__(INPUT_H2D)
  if (!tensorbuffer_phy) {
    for (unsigned i=0; i < inputBs; i++)
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
          auto idx = input_tensor_buffers[j]->get_tensor()->get_shape();
          auto dims = vector<int>(idx.size(),0);
          dims[0] = i;
          dataPtr = ((uint8_t*)input_tensor_buffers[j]->data(dims).first)+inSize*i;
        }
        else {
          auto idx = input_tensor_buffers[i*model_->get_input_offset().size()+j]->get_tensor()->get_shape();
          auto dims = vector<int>(idx.size(),0);
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
  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);
  ecmd->cu_mask = handle_->get_device_info().cu_mask;
  ecmd->extra_cu_masks = 0;
  ecmd->stat_enabled = 1;
  ecmd->state = ERT_CMD_STATE_NEW;
  ecmd->opcode = ERT_EXEC_WRITE;
  ecmd->type = ERT_CTRL;

  auto core_idx = handle_->get_device_info().cu_index;
auto trigger_dpu_func = [&](){
  __TIC__(DPU_TRIGGER)

  //auto t1 = std::chrono::high_resolution_clock::now();

  std::vector<std::pair<int, int> > regVals;
  if (0 == program_once_complete) {

    // in debug mode, need to run preload instruction layer by layer
    if(!debug_mode_){
      program_once_complete = 1;
    }

    regVals.push_back( { XDPU_CONTROL_AP, XDPU_CONTROL_AP_START });
    regVals.push_back( { XDPU_CONTROL_GIE / 4, XDPU_GLOBAL_INT_ENABLE });
    regVals.push_back( { XDPU_CONTROL_START / 4, 0x0 });
    regVals.push_back( { 0x18 / 4, 0x0 });
    regVals.push_back( { XDPU_CONTROL_HP / 4, 0x2020 });

    if (preload_code_addr_){
      // do preload
      regVals.push_back( { XDPU_CONTROL_INSTR_L / 4, preload_code_addr_ & 0xFFFFFFFF });
      regVals.push_back( { XDPU_CONTROL_INSTR_H / 4, (preload_code_addr_ >> 32) & 0xFFFFFFFF });
//      regVals.push_back( { XDPU_CONTROL_ADDR_0_L / 4, reg0_addr_ & 0xFFFFFFFF });
//      regVals.push_back( { XDPU_CONTROL_ADDR_0_H / 4, (reg0_addr_ >> 32) & 0xFFFFFFFF });
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

      //vitis::ai::trace::add_trace("dpu-controller", vitis::ai::trace::func_start, core_idx);
      // exec kernel
      exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
      if (exec_buf_result)
        throw std::runtime_error("Error: xclExecBuf failed");

      // wait for kernel
      for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
              && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);
      //vitis::ai::trace::add_trace("dpu-controller", vitis::ai::trace::func_start, core_idx);

      if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
        _show_regs(xcl_handle, handle_->get_device_info().cu_base_addr);
        std::cout << "Error: CU timeout when do preload " << std::endl;
        throw std::runtime_error("Error: CU timeout when do preload "
          + std::to_string(handle_->get_device_info().cu_index));
      }
      regVals.clear();
    }

    //configure real code and parameter
    regVals.push_back( { XDPU_CONTROL_INSTR_L / 4, code_addr_ & 0xFFFFFFFF });
    regVals.push_back( { XDPU_CONTROL_INSTR_H / 4, (code_addr_ >> 32) & 0xFFFFFFFF });
    auto iter = xdpu_total_dpureg_map.begin();
    while(iter !=xdpu_total_dpureg_map.end()) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "parameter: "  //
          << iter->second      //
          ;
      iter++;
    }

//    regVals.push_back( { XDPU_CONTROL_ADDR_0_L / 4, reg0_addr_ & 0xFFFFFFFF });
//    regVals.push_back( { XDPU_CONTROL_ADDR_0_H / 4, (reg0_addr_ >> 32) & 0xFFFFFFFF });
  }
    for (auto iter2 : xdpu_total_dpureg_map2) {
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, std::get<2>(iter2) & 0xFFFFFFFF });
      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, (std::get<2>(iter2) >> 32) & 0xFFFFFFFF });
   LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
          << "io: "  //
          << std::get<0>(iter2)
          << std::hex << " "
          << std::get<2>(iter2)      //
          ;
    }

  p = 6;
  for (unsigned i=0; i < regVals.size(); i++)
  {
    ecmd->data[p++] = (regVals[i].first) * 4;
    ecmd->data[p++] = (regVals[i].second);
  }
  ecmd->count = 1 + p;

  auto t11 = std::chrono::high_resolution_clock::now();

  std::vector<timestamps> ts_list;
  struct timespec tp;
  struct timestamps ts;

  clock_gettime(CLOCK_MONOTONIC, &tp);
  uint64_t start = tp2ns(&tp);

  // exec kernel
  vitis::ai::trace::add_trace("dpu-controller", vitis::ai::trace::func_start, core_idx);
  exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
  if (exec_buf_result)
    throw std::runtime_error("Error: xclExecBuf failed");

  // wait for kernel
  for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
            && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);
  vitis::ai::trace::add_trace("dpu-controller", vitis::ai::trace::func_end, core_idx);
  if(ENV_PARAM(XRT_STAT)){
    clock_gettime(CLOCK_MONOTONIC, &tp);
    uint64_t end = tp2ns(&tp);

    auto c = ert_start_kernel_timestamps(ecmd);
    ts.total = end - start;
    ts.to_driver = c->skc_timestamps[ERT_CMD_STATE_NEW] - start;
    ts.to_cu = c->skc_timestamps[ERT_CMD_STATE_RUNNING] -
        c->skc_timestamps[ERT_CMD_STATE_NEW];
    ts.cu_complete = c->skc_timestamps[ERT_CMD_STATE_COMPLETED] -
        c->skc_timestamps[ERT_CMD_STATE_RUNNING];
    ts.done = end - c->skc_timestamps[ERT_CMD_STATE_COMPLETED];
    ts_list.push_back(ts);

    print_timestamps(ts_list);
  }

  if(ENV_PARAM(XCLEXECBUF)){
    auto t22 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> fp_us = t22 - t11;
    std::cout << "xclExecBuf: us " << fp_us.count() << std::endl;
  }

  if (ecmd->state != ERT_CMD_STATE_COMPLETED)
  {
    _show_regs(xcl_handle, handle_->get_device_info().cu_base_addr);
    std::cout << "Error: CU timeout " << std::endl;
    throw std::runtime_error("Error: CU timeout " + std::to_string(handle_->get_device_info().cu_index));
  }
  if(ENV_PARAM(DPU_IP_COUNTER)){
    _show_regs(xcl_handle, handle_->get_device_info().cu_base_addr);
  }

  __TOC__(DPU_TRIGGER)

  //auto t2 = std::chrono::high_resolution_clock::now();
  //std::chrono::duration<double, std::micro> fp_us = t2 - t1;
  //std::cout << "dpu trigger: us " << fp_us.count() << std::endl;

};

 auto t1 = std::chrono::high_resolution_clock::now();
  auto dbg_layers = model_->get_dbg_layers();
  // program DPU request
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
    auto info = model_->get_subgraph_info();
    vitis::ai::trace::add_trace("dpu-runner", info.name, batch_size_, info.workload, info.depth);
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
      }
    }

    int layer_idx = 1;
    for(auto iter = dbg_layers.begin() + 1;iter !=dbg_layers.end();iter++) {
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
        vitis::ai::trace::add_trace("dpu-runner", layer.name, batch_size_, layer.workload, layer.depth);
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
  if((!tensorbuffer_phy)&& (!ENV_PARAM(DPU_HW_POST))) for (unsigned i=0; i < inputBs; i++)
  {
    // instead of downloading all {output, input, intermediate},
    // just download output region
    // io_bufs[i]->download();
      for (unsigned j=0; j< model_->get_output_offset().size(); j++) {
        const auto outSize = get_output_tensors()[j]->get_element_num();
        uint8_t* dataPtr;
        if (create_tb_batch) {
          auto idx = output_tensor_buffers[j]->get_tensor()->get_shape();
          auto dims = vector<int>(idx.size(),0);
          dims[0] = i;
          dataPtr = ((uint8_t *)output_tensor_buffers[j]->data(dims).first)+outSize*i;
        }
        else {
          auto idx = output_tensor_buffers[i*model_->get_output_offset().size()+j]->get_tensor()->get_shape();
          auto dims = vector<int>(idx.size(),0);
          dataPtr = (uint8_t *)output_tensor_buffers[i*model_->get_output_offset().size()+j]->data(dims).first;
        }
        //__TIC_PROFILING__(OUTPUT)
        if (xclUnmgdPread(xcl_handle, 0, (void*)dataPtr,
          outSize,
          out_addrs[i] + model_->get_output_offset()[j]))
          throw std::runtime_error("Error: download failed");
        //__TOC_PROFILING__(OUTPUT)
      }

  }
  __TOC__(OUTPUT_D2H)
  if((!tensorbuffer_phy) &&create_tb_outside) {
    tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, false);
  }

if(ENV_PARAM(CTRLER_RUN)){
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double, std::micro> fp_us = t2 - t1;
  std::cout << "CTRLER_RUN: us " << fp_us.count() << std::endl;
}

}

