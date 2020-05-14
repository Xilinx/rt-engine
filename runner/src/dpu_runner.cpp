#include <iostream>
#include "dpu_runner.hpp"
#include "engine.hpp"

DpuRunner::DpuRunner(std::string meta)
 : dpu_controller_(new DpuController(meta)) {
}

DpuRunner::~DpuRunner() {
}

std::vector<const xir::vart::Tensor*> DpuRunner::get_input_tensors() {
  return dpu_controller_->get_input_tensors();
}
std::vector<const xir::vart::Tensor*> DpuRunner::get_output_tensors() {
  return dpu_controller_->get_output_tensors();
}

std::vector<xir::vart::TensorBuffer*> DpuRunner::get_inputs() {
  return dpu_controller_->get_inputs();
}

std::vector<xir::vart::TensorBuffer*> DpuRunner::get_outputs() {
  return dpu_controller_->get_outputs();
}

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<xir::vart::TensorBuffer*>& inputs,
  const std::vector<xir::vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit([this, &inputs, &outputs] {
    dpu_controller_->run(inputs, outputs);
  });
  return std::pair<uint32_t, int>(job_id, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  (void)timeout;
  Engine& engine = Engine::get_instance();
  engine.wait(jobid);

  return 0;
}
