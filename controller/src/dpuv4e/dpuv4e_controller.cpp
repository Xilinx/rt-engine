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
#include "dpuv4e_controller.hpp"
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

DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")
DEF_ENV_PARAM(XLNX_SHOW_DPU_COUNTER, "0");
//DEF_ENV_PARAM(XLNX_ENABLE_DUMP, "0");
//DEF_ENV_PARAM(XLNX_ENABLE_DEBUG_MODE, "0");
DEF_ENV_PARAM(XLNX_ENABLE_FINGERPRINT_CHECK, "1");

DpuV4eController::DpuV4eController(std::string meta, xir::Attrs* attrs)
  : DpuCloudController(meta, attrs) {
	  
  auto hbmw = get_hbmw();
  init_graph(hbmw, hbmw, attrs);
	  
}

DpuV4eController::DpuV4eController(const xir::Subgraph *subgraph, xir::Attrs* attrs) 
  : DpuCloudController(subgraph, attrs) {
  auto hbmw = get_hbmw();
  init_graph(hbmw, hbmw, attrs);
}
DpuV4eController::~DpuV4eController() {
}



