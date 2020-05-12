// Vitis API execute_async example
#include "dpu_runner.hpp"

int main(int argc, char** argv) {
  if (argc < 2) 
    throw std::runtime_error("Usage: app.exe path_to_meta.json");

  DpuRunner runner(argv[1]);
  const std::vector<vart::TensorBuffer*> inputs;
  const std::vector<vart::TensorBuffer*> outputs;
  auto ret = runner.execute_async(inputs, outputs);
  runner.wait(uint32_t(ret.first), -1);
  return 0;
}
