// Vitis API execute_async example
#include "dpu_runner.hpp"

int main() {
  DpuRunner runner;
  const std::vector<vart::TensorBuffer*> inputs;
  const std::vector<vart::TensorBuffer*> outputs;
  runner.execute_async(inputs, outputs);
  return 0;
}
