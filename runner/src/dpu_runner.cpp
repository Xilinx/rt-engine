#include <iostream>
#include <fstream>
#include <sstream>
#include "dpu_runner.hpp"
#include "engine.hpp"
#include "json-c/json.h"
#include "dpuv3int8_controller.hpp"
#include "dpuv3me_controller.hpp"
#include "dpuv4e_controller.hpp"
#include "vitis/ai/target_factory.hpp"

namespace vart{

DpuRunner::DpuRunner(const xir::Subgraph* subgraph) : exec_core_idx_(0) {
  // default: each DpuController controls one core,
  //          each DpuRunner has one DpuController
  // (keep it simple)

  std::string kernel;
  if (subgraph->has_attr("dpu_fingerprint")) {
    const uint64_t fingerprint = subgraph->get_attr<std::uint64_t>("dpu_fingerprint");
    kernel = vitis::ai::target_factory()->create(fingerprint).type();
  } else {
    kernel = subgraph->get_attr<std::string>("kernel");
  }

  if (kernel == "dpdpuv3_wrapper") 
  // TODO/FIXME replace kernel name with standard name for dpuv3int8 
  // e.g., DPUABC123XYZ
  {
    const bool DPUV3INT8_DEBUGMODE =
        std::getenv("DPUV3INT8_DEBUGMODE") ? atoi(std::getenv("DPUV3INT8_DEBUGMODE")) == 1 : false;
 
    if(DPUV3INT8_DEBUGMODE==1) 
        dpu_controller_.emplace_back(new Dpuv3Int8DebugController(subgraph));
    else 
        dpu_controller_.emplace_back(new Dpuv3Int8Controller(subgraph));
  }
  else if (kernel == "DPUCVDX8H") 
  {
    dpu_controller_.emplace_back(new DpuV4eController(subgraph));
  }
  else if (kernel == "DPUCAHX8L")
  {
    dpu_controller_.emplace_back(new DpuV3meController(subgraph));
  }
  else 
    throw std::runtime_error("Error: no DpuController found for " + kernel);
  
  ip_scale.push_back(1.0f);
  op_scale.push_back(1.0f);

  if (dpu_controller_.empty())
    throw std::runtime_error("Error: no FPGA resources available");
}

DpuRunner::~DpuRunner() {
}

std::vector<const xir::Tensor*> DpuRunner::get_input_tensors() {
  return dpu_controller_[0]->get_input_tensors();
}
std::vector<const xir::Tensor*> DpuRunner::get_output_tensors() {
  return dpu_controller_[0]->get_output_tensors();
}

std::vector<float> DpuRunner::get_input_scale() const {
    return ip_scale; 
}

std::vector<float> DpuRunner::get_output_scale() const {
    return op_scale; 
}

std::vector<vart::TensorBuffer*> DpuRunner::get_inputs() {
  return dpu_controller_[0]->get_inputs();
}

std::vector<vart::TensorBuffer*> DpuRunner::get_outputs() {
  return dpu_controller_[0]->get_outputs();
}

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<vart::TensorBuffer*>& inputs,
  const std::vector<vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit([this, &inputs, &outputs] {
    auto core_idx = exec_core_idx_.fetch_add(1) % dpu_controller_.size();
    dpu_controller_[core_idx]->run(inputs, outputs);
  });
  return std::pair<uint32_t, int>(job_id, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  Engine& engine = Engine::get_instance();
  engine.wait(jobid, timeout);

  return 0;
}

} //namespace vart

/** @brief create dpu runner
*/
vart::Runner* create_runner(const xir::Subgraph* subgraph) {
     auto ret = std::make_unique<vart::DpuRunner>(subgraph);
     return ret.release();
}
