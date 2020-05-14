#include <unistd.h>
#include "tests.hpp"

SingleThreadTest::SingleThreadTest(std::string runner_dir, unsigned num_queries) 
 : num_queries_(num_queries)
{
  runner_.reset(new DpuRunner(runner_dir));
}

void SingleThreadTest::run() {
  auto inTensor = runner_->get_input_tensors()[0];
  auto outTensor = runner_->get_output_tensors()[0];

  // allocate memory
  void *inData, *outData;
  if (posix_memalign(&inData, getpagesize(), 
    inTensor->get_element_num() * sizeof(int8_t)))
    throw std::bad_alloc();
  if (posix_memalign(&outData, getpagesize(), 
    outTensor->get_element_num() * sizeof(int8_t)))
    throw std::bad_alloc();

  // construct input objects
  xir::vart::CpuFlatTensorBuffer inbuf(inData, inTensor);
  xir::vart::CpuFlatTensorBuffer outbuf(outData, outTensor);
  const std::vector<xir::vart::TensorBuffer*> inputs{&inbuf};
  const std::vector<xir::vart::TensorBuffer*> outputs{&outbuf};

  for (unsigned i=0; i < num_queries_; i++)
  {
    auto ret = runner_->execute_async(inputs, outputs);
    runner_->wait(uint32_t(ret.first), -1);
  }
}
