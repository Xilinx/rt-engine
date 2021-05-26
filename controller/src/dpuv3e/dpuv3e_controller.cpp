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
DEF_ENV_PARAM(XLNX_DPU_HBM_GLOBAL_ADDRESSING, "0");
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

DpuV3eController::DpuV3eController(std::string meta, xir::Attrs* attrs) 
  : DpuCloudController(meta, attrs) {
  hbmio.clear();
  hbmw.clear();
  hbmc.clear();
  for (int idx=0; idx<32; idx++) {
    hbmio.push_back(idx);
    hbmw.push_back(idx);
    hbmc.push_back(idx);
  }
 
  init_graph(hbmw,hbmc,attrs);
}

DpuV3eController::DpuV3eController(const xir::Subgraph *subgraph, xir::Attrs* attrs) 
  : DpuCloudController(subgraph, attrs) {
  hbmio.clear();
  hbmw.clear();
  hbmc.clear();

  if(ENV_PARAM(XLNX_DPU_HBM_GLOBAL_ADDRESSING)) {
    for (int i=0; i< 32; i++) {
      hbmio.push_back(i);
      hbmc.push_back(i);
      hbmw.push_back(i);
    }
  }
  else {
    auto handle = contexts_[0]->get_dev_handle();
    auto cu_index = handle_->get_device_info().cu_index;

    xclDeviceInfo2 deviceInfo;
    if (xclGetDeviceInfo2(handle, &deviceInfo)) {
      throw std::runtime_error("Unable to obtain device information");
    }
    string dsa = deviceInfo.mName;

    if (dsa.find("u50lv") != std::string::npos) {
      if (cu_index == 0) {
        hbmio.push_back(0);
        hbmio.push_back(1);
        hbmio.push_back(16);
        hbmio.push_back(17);
        hbmio.push_back(2);
        hbmc.push_back(6);
        hbmw.push_back(20);
        hbmw.push_back(21);
      }
      else {
        hbmio.push_back(3);
        hbmio.push_back(4);
        hbmio.push_back(18);
        hbmio.push_back(19);
        hbmio.push_back(5);
        hbmc.push_back(7);
        hbmw.push_back(22);
        hbmw.push_back(23);
      }
    }
    else if (dsa.find("u50") != std::string::npos) {
      if (cu_index == 0) {
        hbmio.push_back(0);
        hbmio.push_back(10);
        hbmio.push_back(11);
        hbmc.push_back(8);
        hbmw.push_back(4);
        hbmw.push_back(5);
      }
      else {
        hbmio.push_back(1);
        hbmio.push_back(12);
        hbmio.push_back(13);
        hbmc.push_back(9);
        hbmw.push_back(6);
        hbmw.push_back(7);
      }
    }
    else if (dsa.find("u280") != std::string::npos) {
      if (cu_index == 0) {
        hbmio.push_back(0);
        hbmio.push_back(19);
        hbmio.push_back(20);
        hbmio.push_back(1);
        hbmc.push_back(16);
        hbmw.push_back(10);
        hbmw.push_back(11);
      }
      else if (cu_index == 1) {
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
    }
  }


  init_graph(hbmw,hbmc,attrs);
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
