// Vitis API execute_async example
#include <unistd.h>
#include "dpu_runner.hpp"

int main(int argc, char** argv) {
  if (argc < 2) 
    throw std::runtime_error("Usage: app.exe path_to_meta.json");

  DpuRunner runner(argv[1]);

  auto inTensor = runner.get_input_tensors()[0];
  auto outTensor = runner.get_output_tensors()[0];

  // allocate memory
  void *inData, *outData;
  if (posix_memalign(&inData, getpagesize(), 
    inTensor->get_element_num() * sizeof(int8_t)))
    throw std::bad_alloc();
  if (posix_memalign(&outData, getpagesize(), 
    outTensor->get_element_num() * sizeof(int8_t)))
    throw std::bad_alloc();

  xir::vart::CpuFlatTensorBuffer inbuf(inData, inTensor);
  xir::vart::CpuFlatTensorBuffer outbuf(outData, outTensor);
  const std::vector<xir::vart::TensorBuffer*> inputs{&inbuf};
  const std::vector<xir::vart::TensorBuffer*> outputs{&outbuf};

  auto ret = runner.execute_async(inputs, outputs);
  runner.wait(uint32_t(ret.first), -1);
  return 0;
}
