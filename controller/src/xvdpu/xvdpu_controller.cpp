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
#include "xvdpu_controller.hpp"
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
#ifndef _WIN32
#include "trace.hpp"
#endif
using namespace std;
using namespace chrono;
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")
DEF_ENV_PARAM(XLNX_SHOW_DPU_COUNTER, "0");
DEF_ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK, "1");


static xrt::bo task_queue;

DpuXvdpuController::DpuXvdpuController(std::string meta, xir::Attrs* attrs)
  : DpuXrtCloudController(meta, attrs) {
	  
  auto hbmw = get_hbmw();
  init_graph(hbmw, hbmw, attrs);
  dpu.reset(new Dpu(debug_mode_, handle_->get_device_info(), batch_size_));
  //task_queue = get_xrt_bo(contexts_[0]->get_dev_device(), 64*1024, hbmw);
	  
}

DpuXvdpuController::DpuXvdpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs) 
  : DpuXrtCloudController(subgraph, attrs) {
  auto hbmw = get_hbmw();
  init_graph(hbmw, hbmw, attrs);
  dpu.reset(new Dpu(debug_mode_, handle_->get_device_info(), batch_size_));
  //task_queue = get_xrt_bo(contexts_[0]->get_dev_device(), 64*1024, hbmw);
}
DpuXvdpuController::~DpuXvdpuController() {
}
