#include "dpu_runner.hpp"

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
  const std::vector<vart::TensorBuffer*>& input,
  const std::vector<vart::TensorBuffer*>& output) {
  (void)input;
  (void)output;
  return std::pair<uint32_t, int>(0, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  (void)jobid;
  (void)timeout;
  return 0;
}
