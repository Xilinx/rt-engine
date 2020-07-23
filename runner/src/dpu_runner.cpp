#include <iostream>
#include <fstream>
#include <sstream>
#include "dpu_runner.hpp"
#include "engine.hpp"
#include "json-c/json.h"

DpuRunner::DpuRunner(std::string meta) : exec_core_idx_(0) {
  // default: each DpuController controls one core,
  //          each DpuRunner has one DpuController
  // (keep it simple)
  dpu_controller_.emplace_back(new SampleDpuController(meta));
  if (dpu_controller_.empty())
    throw std::runtime_error("Error: no FPGA resources available");
}

DpuRunner::~DpuRunner() {
}

std::vector<const xir::vart::Tensor*> DpuRunner::get_input_tensors() {
  return dpu_controller_[0]->get_input_tensors();
}
std::vector<const xir::vart::Tensor*> DpuRunner::get_output_tensors() {
  return dpu_controller_[0]->get_output_tensors();
}

std::vector<xir::vart::TensorBuffer*> DpuRunner::get_inputs() {
  return dpu_controller_[0]->get_inputs();
}

std::vector<xir::vart::TensorBuffer*> DpuRunner::get_outputs() {
  return dpu_controller_[0]->get_outputs();
}

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<xir::vart::TensorBuffer*>& inputs,
  const std::vector<xir::vart::TensorBuffer*>& outputs) {
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
