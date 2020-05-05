#include <iostream>
#include "dpu_runner.hpp"
#include "engine.hpp"

DpuRunner::DpuRunner() {
}

DpuRunner::~DpuRunner() {
}

std::vector<const xir::Tensor*> DpuRunner::get_input_tensors() {
  return std::vector<const xir::Tensor*>();
}
std::vector<const xir::Tensor*> DpuRunner::get_output_tensors() {
  return std::vector<const xir::Tensor*>();
}

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<vart::TensorBuffer*>& inputs,
  const std::vector<vart::TensorBuffer*>& outputs) {
  (void)inputs;
  (void)outputs;

  const Engine& engine = Engine::get_instance();
  engine.submit(0, [&inputs, &outputs] {
    std::cout << "Hello!" << std::endl;
    std::cout << inputs.size() << " " << outputs.size() << std::endl;
  });

  return std::pair<uint32_t, int>(0, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  (void)jobid;
  (void)timeout;
  return 0;
}
