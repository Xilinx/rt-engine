#include <iostream>
#include "dpu_runner.hpp"
#include "engine.hpp"

DpuRunner::DpuRunner(std::string meta) {
  dpu_controller_.emplace_back(new DpuController(meta));
}

DpuRunner::~DpuRunner() {
}

std::vector<const xir::vart::Tensor*> DpuRunner::get_input_tensors() {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 1, 224, 224, 3 };
  static xir::vart::Tensor tensor("input", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}
std::vector<const xir::vart::Tensor*> DpuRunner::get_output_tensors() {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 1, 1, 1, 1000 };
  static xir::vart::Tensor tensor("output", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<xir::vart::TensorBuffer*>& inputs,
  const std::vector<xir::vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit([this, &inputs, &outputs] {
    dpu_controller_[0]->run(inputs, outputs);
  });
  return std::pair<uint32_t, int>(job_id, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  (void)timeout;
  Engine& engine = Engine::get_instance();
  engine.wait(jobid);

  return 0;
}
