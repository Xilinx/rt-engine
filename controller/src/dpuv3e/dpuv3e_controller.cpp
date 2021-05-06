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
//#include "common/graph.hpp"

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
//DEF_ENV_PARAM(XLNX_ENABLE_DUMP, "0");
//DEF_ENV_PARAM(XLNX_ENABLE_DEBUG_MODE, "0");
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

//static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
//  uint32_t val;
//  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
//  return val;
//}

DpuV3eController::DpuV3eController(std::string meta) 
  : DpuCloudController(meta) {
 auto cu_index = handle_->get_device_info().cu_index;
// if(cu_index == 0) {
//    hbmio.push_back(0);
//    hbmio.push_back(1);
//    hbmio.push_back(16);
//    hbmio.push_back(17);
//    hbmio.push_back(2);
//    hbmc.push_back(6);
//    hbmw.push_back(20);
//    hbmw.push_back(21);
//  }
//  else {
//    hbmio.push_back(3);
//    hbmio.push_back(4);
//    hbmio.push_back(18);
//    hbmio.push_back(19);
//    hbmio.push_back(5);
//    hbmc.push_back(7);
//    hbmw.push_back(22);
//    hbmw.push_back(23);
//  }
    hbmio.clear();
    hbmw.clear();
    hbmc.clear();
  if(cu_index == 0) {
    hbmio.push_back(0);
    hbmio.push_back(19);
    hbmio.push_back(20);
    hbmio.push_back(1);
    hbmc.push_back(16);
    hbmw.push_back(10);
    hbmw.push_back(11);
  }
  else if(cu_index == 1) {
    hbmio.push_back(2);
    hbmio.push_back(3);
    hbmio.push_back(21);
    hbmio.push_back(22);
    hbmio.push_back(4);
    hbmc.push_back(17);
    hbmw.push_back(12);
    hbmw.push_back(13);
  }
  else {
    hbmio.push_back(5);
    hbmio.push_back(6);
    hbmio.push_back(23);
    hbmio.push_back(24);
    hbmio.push_back(7);
    hbmc.push_back(18);
    hbmw.push_back(14);
    hbmw.push_back(15);
  }
	  
	  
  //hbm.emplace_back(handle_->get_device_info().ddr_bank);
  init_graph(hbmw,hbmc);
}

DpuV3eController::DpuV3eController(const xir::Subgraph *subgraph) 
  : DpuCloudController(subgraph) {

 auto cu_index = handle_->get_device_info().cu_index;
    hbmio.clear();
    hbmw.clear();
    hbmc.clear();
  if(cu_index == 0) {
//for (int i=0; i< 24; i++)
//    hbmio.push_back(i);
    hbmio.push_back(0);
    hbmio.push_back(19);
    hbmio.push_back(20);
    hbmio.push_back(1);
    hbmio.push_back(2);
    hbmio.push_back(3);
    hbmio.push_back(21);
    hbmio.push_back(22);
    hbmio.push_back(4);
    hbmio.push_back(5);
    hbmio.push_back(6);
    hbmio.push_back(23);
    hbmio.push_back(24);
    hbmio.push_back(7);
    hbmc.push_back(16);
    hbmw.push_back(10);
    hbmw.push_back(11);
  }
  else if(cu_index == 1) {
//for (int i=0; i< 24; i++)
//    hbmio.push_back(i);
    hbmio.push_back(0);
    hbmio.push_back(19);
    hbmio.push_back(20);
    hbmio.push_back(1);
    hbmio.push_back(2);
    hbmio.push_back(3);
    hbmio.push_back(21);
    hbmio.push_back(22);
    hbmio.push_back(4);
    hbmio.push_back(5);
    hbmio.push_back(6);
    hbmio.push_back(23);
    hbmio.push_back(24);
    hbmio.push_back(7);
    hbmc.push_back(17);
    hbmw.push_back(12);
    hbmw.push_back(13);
  }
  else {
//for (int i=0; i< 24; i++)
//    hbmio.push_back(i);
    hbmio.push_back(0);
    hbmio.push_back(19);
    hbmio.push_back(20);
    hbmio.push_back(1);
    hbmio.push_back(2);
    hbmio.push_back(3);
    hbmio.push_back(21);
    hbmio.push_back(22);
    hbmio.push_back(4);
    hbmio.push_back(5);
    hbmio.push_back(6);
    hbmio.push_back(23);
    hbmio.push_back(24);
    hbmio.push_back(7);
    hbmc.push_back(18);
    hbmw.push_back(14);
    hbmw.push_back(15);
  }
 //if(cu_index == 0) {
 //   hbmio.push_back(0);
 //   hbmio.push_back(1);
 //   hbmio.push_back(16);
 //   hbmio.push_back(17);
 //   hbmio.push_back(2);
 //   hbmc.push_back(6);
 //   hbmw.push_back(20);
 //   hbmw.push_back(21);
 // }
 // else {
 //   hbmio.push_back(3);
 //   hbmio.push_back(4);
 //   hbmio.push_back(18);
 //   hbmio.push_back(19);
 //   hbmio.push_back(5);
 //   hbmc.push_back(7);
 //   hbmw.push_back(22);
 //   hbmw.push_back(23);
 // }
  //hbm.emplace_back(handle_->get_device_info().ddr_bank);
  init_graph(hbmw,hbmc);
}

DpuV3eController::~DpuV3eController() {
}

std::vector<unsigned> DpuV3eController::get_hbmw() {
  return hbmw;
}
std::vector<unsigned> DpuV3eController::get_hbmc() {
  return hbmc;
}
std::vector<unsigned> DpuV3eController::get_hbmio() {
  return hbmio;
}
//std::vector<vart::TensorBuffer*> DpuV3eController::get_outputs(int batchsz) {
//    return get_outputs_inner(hbmio, batchsz);
//}
//vector<std::tuple<int, int,uint64_t>>  DpuV3eController::get_dpu_reg_outside(xclDeviceHandle xcl_handle,  bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs) {
//  return get_dpu_reg_outside_hbm(xcl_handle, create_tb_batch, in_addrs, out_addrs, inputs, outputs, hbmio);
//}

//void DpuV3eController::run(const std::vector<vart::TensorBuffer*> &inputs, 
//    const std::vector<vart::TensorBuffer*> &outputs) {
//  std::vector<vart::TensorBuffer*> input_tensor_buffers;
//  std::vector<vart::TensorBuffer*> output_tensor_buffers;
//  int inputBs = batch_size_;
//  if(inputs.size()%model_->get_input_tensors().size())
//    throw std::runtime_error("Error: input tensorbuffers error");
//  int ibs = inputs[0]->get_tensor()->get_shape()[0]/model_->get_input_tensors()[0]->get_shape()[0];
//  int obs = outputs[0]->get_tensor()->get_shape()[0]/model_->get_output_tensors()[0]->get_shape()[0];
//  // check if tensorbuffer store batch inputs/outputs
//  if ((inputs.size()/model_->get_input_tensors().size())>1)
//    inputBs = inputs.size()/model_->get_input_tensors().size();
//  else
//    inputBs = ibs;
//  if ((ibs < obs) || (inputBs > batch_size_) )
//    throw std::runtime_error("Error: size of tensorbuffer not supported");
//  //}
//  bool create_tb_outside=check_tensorbuffer_outside(outputs);
//  bool create_tb_batch=false;
//  bool tensorbuffer_phy=false;
//  //if (!model_->is_splitio()) 
//  if (!create_tb_outside) {
//
//    if ((ibs == inputBs)&&(ibs > 1))
//    {
//      create_tb_batch = true;
//    }
//
//  }
//  //if (create_tb_outside&&model_->is_splitio())
//  //    tensorbuffer_phy = true;
////  if (!model_->is_splitio()) {
//  if(create_tb_outside) {
//    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
//      << "create tensorbuffer by user side";
//    if (!tensorbuffer_phy) {
//      tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, true);
//    } 
//    //else {
//      //TODO
//      // for the condition that alloc addr outside API
//  
//     //}
//  }
//  else {
//    input_tensor_buffers = inputs;
//    output_tensor_buffers = outputs;
//  }
//  Engine& engine = Engine::get_instance();
//  const unsigned worker_id = engine.get_my_worker_id();
//  if (worker_id >= contexts_.size())
//  throw std::runtime_error("Error: worker_id too large; update controller code");
//  
//  auto &context = *(contexts_[worker_id]);
//  auto xcl_handle = context.get_dev_handle();
//  auto bo_handle = context.get_bo_handle();
//  auto bo_addr = context.get_bo_addr();
//  
//  // get device buffers for input TensorBuffers
//  vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2;
//
//  std::vector<uint64_t> in_addrs(batch_size_);
//  std::vector<uint64_t> out_addrs(batch_size_);
//  if (!tensorbuffer_phy) { 
//    xdpu_total_dpureg_map2 = get_dpu_reg_inside(create_tb_batch, in_addrs, out_addrs, output_tensor_buffers);
//  } else {
//    xdpu_total_dpureg_map2 = get_dpu_reg_outside(xcl_handle, create_tb_batch, in_addrs, out_addrs, inputs, outputs);
//  }
//  //const auto inSize = get_input_tensors()[0]->get_element_num();
//  __TIC__(INPUT_H2D)
//  if (!tensorbuffer_phy) { 
//    for (int i=0; i < inputBs; i++)
//    {
//      // instead of uploading all {output, input, intermediate}, 
//      // just upload input region
//      // io_bufs[i]->upload();
//     //const auto mode = std::ios_base::out | std::ios_base::binary | std::ios_base::trunc;
//     //  auto input_file = "./input"+ to_string(i)+".bin";
//     //  std::ofstream(input_file, mode).write((char*)inputs[i]->data().first,inSize);
//      for (unsigned j=0; j < model_->get_input_offset().size(); j++) {
//        uint8_t* dataPtr;
//        const auto inSize = get_input_tensors()[j]->get_element_num();
//        if (create_tb_batch)
//          dataPtr = ((uint8_t*)input_tensor_buffers[j]->data().first)+inSize*i;
//        else
//          dataPtr =(uint8_t*)input_tensor_buffers[i*model_->get_input_offset().size()+j]->data().first;
//        if (xclUnmgdPwrite(xcl_handle, 0, (void *)dataPtr, inSize,
//          in_addrs[i] + model_->get_input_offset()[j]))
//          throw std::runtime_error("Error: upload failed");
//      }
//
//    }
//  }
//  __TOC__(INPUT_H2D)
//  int p;
//  int exec_buf_result;
//  auto cu_base_addr = handle_->get_device_info().cu_base_addr;
//  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);
//  ecmd->cu_mask = handle_->get_device_info().cu_mask;
//  ecmd->extra_cu_masks = 0;
//  ecmd->stat_enabled = 1;
//  ecmd->state = ERT_CMD_STATE_NEW;
//  ecmd->opcode = ERT_EXEC_WRITE;
//  ecmd->type = ERT_CTRL;
//
//  //LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
//  //   <<"Engine : " << i<<  " workspace reg_id: " 
//
//  auto trigger_dpu_func = [&](){ 
//
//    std::vector<std::pair<int, int> > regVals;
//    if (0 == program_once_complete) {
//
//      // in debug mode, need to run preload instruction layer by layer
//      if(!debug_mode_){
//        program_once_complete = 1;
//      }
//      regVals.push_back({ XDPU_CONTROL_AP, XDPU_CONTROL_AP_START });
//      regVals.push_back({ XDPU_CONTROL_GIE / 4, XDPU_GLOBAL_INT_ENABLE });
//      regVals.push_back(  { XDPU_CONTROL_IER / 4, 1 });
//      regVals.push_back(  { XDPU_CONTROL_START / 4, 0x0 });
//      regVals.push_back(  { XDPU_CONTROL_RESET / 4, 0x1 });
//      regVals.push_back(  { XDPU_CONTROL_HP / 4, 0x204040 });
//      if (preload_code_addr_){
//        // do preload
//        regVals.push_back( { XDPU_CONTROL_INSTR_L / 4, preload_code_addr_ & 0xFFFFFFFF });
//        regVals.push_back( { XDPU_CONTROL_INSTR_H / 4, (preload_code_addr_ >> 32) & 0xFFFFFFFF });
//        auto iter = xdpu_total_dpureg_map.begin();
//        while(iter !=xdpu_total_dpureg_map.end()) {
//          regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
//          regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
//          iter++;
//        }
//        p = 6;
//        for (unsigned i=0; i < regVals.size(); i++) {
//          ecmd->data[p++] = (regVals[i].first) * 4;
//          ecmd->data[p++] = (regVals[i].second);
//        }
//        ecmd->count = 1 + p;
//        exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
//        if (exec_buf_result)
//          throw std::runtime_error("Error: xclExecBuf failed");
//
//        // wait for kernel
//        for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
//                && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);
//
//        if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
//          std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_START) << std::endl;
//          std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_END) << std::endl;
//          std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_START) << std::endl;
//          std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_END) << std::endl;
//          std::cout << "CONV START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_START) << std::endl;
//          std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_END) << std::endl;
//          std::cout << "MISC START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_START) << std::endl;
//          std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_END) << std::endl;
//          // _show_regs(xcl_handle, handle_->get_device_info().cu_base_addr);
//          std::cout << "Error: CU timeout when do preload " << std::endl;
//          throw std::runtime_error("Error: CU timeout when do preload "
//            + std::to_string(handle_->get_device_info().cu_index));
//        }
//        regVals.clear();
//      }
//    }
//    regVals.push_back(  { XDPU_CONTROL_INSTR_L / 4, code_addr_ & 0xFFFFFFFF });
//    regVals.push_back(  { XDPU_CONTROL_INSTR_H / 4, (code_addr_ >> 32) & 0xFFFFFFFF });
//    //regVals.push_back(  { XDPU_CONTROL_ADDR_0_L / 4, reg0_addr_ & 0xFFFFFFFF });
//    //regVals.push_back(  { XDPU_CONTROL_ADDR_0_H / 4, (reg0_addr_ >> 32) & 0xFFFFFFFF });
//    //cout << "code_addr " << code_addr_ << "  "<< endl;
//    auto iter = xdpu_total_dpureg_map.begin();
//    while(iter !=xdpu_total_dpureg_map.end()) {
//      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*iter->first) / 4, iter->second & 0xFFFFFFFF });
//      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*iter->first) / 4, (iter->second >> 32) & 0xFFFFFFFF });
//      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
//          << "parame: "  //
//          << iter->second      //
//          ;
//      iter++;
//    }
//    // program DPU input/output addrs
//    for (auto iter2 : xdpu_total_dpureg_map2) {
//      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_L + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, std::get<2>(iter2) & 0xFFFFFFFF });
//      regVals.push_back(  { (XDPU_CONTROL_ADDR_0_H + 8*std::get<0>(iter2) + std::get<1>(iter2)*0x100) / 4, (std::get<2>(iter2) >> 32) & 0xFFFFFFFF });
//      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
//          << "io: "  //
//          << std::get<2>(iter2)      //
//          ;
//    } 
// 
//    p = 6;
//    for (unsigned i=0; i < regVals.size(); i++) {
//      ecmd->data[p++] = (regVals[i].first) * 4;
//      ecmd->data[p++] = (regVals[i].second);
//    }
//    ecmd->count = 1 + p; 
//
//    // exec kernel
//    exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
//    if (exec_buf_result)
//      throw std::runtime_error("Error: xclExecBuf failed");
//
//    // wait for kernel
//    for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0 
//            && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);
//            
//    if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
//      std::cout << "Error: CU timeout " << std::endl;
//
//      std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_START) << std::endl;
//      std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_LOAD_END) << std::endl;
//      std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_START) << std::endl;
//      std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_SAVE_END) << std::endl;
//      std::cout << "CONV START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_START) << std::endl;
//      std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CONV_END) << std::endl;
//      std::cout << "MISC START:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_START) << std::endl;
//      std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_MISC_END) << std::endl;
//      throw std::runtime_error("Error: CU timeout " + std::to_string(handle_->get_device_info().cu_index));
//    }
//    if(ENV_PARAM(XLNX_SHOW_DPU_COUNTER))
//      std::cout << "IP COUNTER:" << read32_dpu_reg(xcl_handle, cu_base_addr + DPUREG_CYCLE_COUNTER) <<std::endl;
//  // download results into output TensorBuffers
//  };
//
//  // program DPU request
//  //
//  auto dbg_layers = model_->get_dbg_layers();
//  if(!debug_mode_) { //=== run release instructions 
//    if(dump_mode_ ) { // dump input    
//      int tensor_idx = 0;
//      for(auto& out: dbg_layers[0].inputs) {
//        auto offset = std::get<0>(out);
//        auto size = std::get<1>(out);
//        auto data = std::make_unique<char[]>(size);
//        for (unsigned i=0; i < in_addrs.size(); i++) {
//          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, in_addrs[i] + offset))
//            throw std::runtime_error("Error: dump failed!");
//          std::stringstream ss;  
//          ss << dump_folder_ << "/E" << i << "/" << std::get<2>(out); 
//          std::ofstream ofs(ss.str(), std::ofstream::binary);
//          ofs.write(data.get(), size);
//          ofs.close(); 
//        }
//        tensor_idx++;
//      } 
//    }
//
//    trigger_dpu_func(); 
//
//    if(dump_mode_ ) {  // dump final output   
//      int tensor_idx = 0;
//      for(auto& out: dbg_layers[0].outputs) {
//        auto offset = std::get<0>(out);
//        auto size = std::get<1>(out);
//        auto data = std::make_unique<char[]>(size);
//        for (unsigned i=0; i < out_addrs.size(); i++) { 
//          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, out_addrs[i] + offset))
//            throw std::runtime_error("Error: dump failed!");
//          std::stringstream ss;  
//          ss << dump_folder_ << "/E" << i << "/" << std::get<2>(out); 
//          std::ofstream ofs(ss.str(), std::ofstream::binary);
//          ofs.write(data.get(), size);
//          ofs.close(); 
//        }
//        tensor_idx++;
//      } 
//    }
//  } else {//=== run debug instructions
//    // dump first layer's inputs
//    if(dump_mode_ && (dbg_layers.size() > 0)) {   
//      auto& inputs = dbg_layers[0].inputs;
//      int tensor_idx = 0;
//      for(auto& input: inputs) {
//        auto offset = std::get<0>(input);
//        auto size = std::get<1>(input);
//        auto data = std::make_unique<char[]>(size);
//        for (unsigned i=0; i < in_addrs.size(); i++) { 
//          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, in_addrs[i] + offset))
//            throw std::runtime_error("Error: dump failed!");
//          std::stringstream ss;
//          ss << dump_folder_ << "/E" << i << "/" << std::get<2>(input); 
//          std::ofstream ofs(ss.str(), std::ofstream::binary);
//          ofs.write(data.get(), size);
//          ofs.close(); 
//        }
//        tensor_idx++;
//      } 
//    }
//
//    int layer_idx = 0; 
//    for(auto iter = dbg_layers.begin() + 1;iter != dbg_layers.end();iter++) {
//      auto layer = *iter;
//      auto code_info = layer_debug_mode.find(layer.name);
//      if (code_info != layer_debug_mode.end()) {
//        if((code_info->second).second>0) {
//         code_addr_ = (code_info->second).first;
//         auto code_info_pre = layer_debug_mode_preload.find(layer.name);
//         if (code_info_pre != layer_debug_mode_preload.end()) {
//           if((code_info_pre->second).second>0) {
//             preload_code_addr_ = (code_info_pre->second).first;
//           }
//         }
//      //if(std::get<1>(layer.code_addr) > 0) {
//      //  code_addr_ = std::get<0>(layer.code_addr); 
//       }
//        trigger_dpu_func();  
//      }
//      // Save the outputs to file  
//      if(dump_mode_) { 
//        int tensor_idx = 0;
//        for(auto& out: layer.outputs) {
//          auto offset = std::get<0>(out);
//          auto size = std::get<1>(out);
//          auto reg_id = std::get<3>(out);
//          auto data = std::make_unique<char[]>(size);
//          //for (unsigned i=0; i < io_bufs.size(); i++) {
//          for (auto it :  xdpu_total_dpureg_map2 ) {
//            auto regid = std::get<0>(it); 
//            if (regid == reg_id) {
//              if (xclUnmgdPread(xcl_handle, 0, data.get(), size, std::get<2>(it) + offset))
//                throw std::runtime_error("Error: dump failed!");
//              std::stringstream ss;  
//              ss << dump_folder_ << "/E" << std::get<1>(it) << "/" << std::get<2>(out); 
//              std::ofstream ofs(ss.str(), std::ofstream::binary);
//              ofs.write(data.get(), size);
//              ofs.close(); 
//            }
//          }
//          tensor_idx++;
//        }
//      }
//      layer_idx ++;
//    } 
//  }
// 
//  __TIC__(OUTPUT_D2H)
//  if (!tensorbuffer_phy) { 
//    for (int i=0; i < inputBs; i++)
//    {
//      // instead of downloading all {output, input, intermediate},
//      // just download output region
//      // io_bufs[i]->download();
//      for (unsigned j=0; j< model_->get_output_offset().size(); j++) {
//        const auto outSize = get_output_tensors()[j]->get_element_num();
//        uint8_t* dataPtr;
//        if (create_tb_batch)
//          dataPtr = ((uint8_t *)output_tensor_buffers[j]->data().first)+outSize*i;
//        else
//          dataPtr = (uint8_t *)output_tensor_buffers[i*model_->get_output_offset().size()+j]->data().first;
//        //__TIC_PROFILING__(OUTPUT)
//        if (xclUnmgdPread(xcl_handle, 0, (void*)dataPtr,
//          outSize,
//          out_addrs[i] + model_->get_output_offset()[j]))
//          throw std::runtime_error("Error: download failed");
//        //__TOC_PROFILING__(OUTPUT)
//      }
//    }
//  }
//  __TOC__(OUTPUT_D2H)
//  if((!tensorbuffer_phy) &&create_tb_outside) {
//    tensorbuffer_trans(input_tensor_buffers, output_tensor_buffers,inputs,outputs, false);
//  }
//}

