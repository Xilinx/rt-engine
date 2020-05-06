// Vitis API execute_async example
#include "dpu_runner.hpp"

int main() {
  DpuRunner runner;
  const std::vector<vart::TensorBuffer*> inputs;
  const std::vector<vart::TensorBuffer*> outputs;
  auto ret = runner.execute_async(inputs, outputs);
  runner.wait(uint32_t(ret.first), -1);
  return 0;
}
