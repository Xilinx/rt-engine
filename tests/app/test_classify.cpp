#include <unistd.h>
#include "tests.hpp"

TestClassify::TestClassify(std::string runner_dir, unsigned num_queries) 
 : num_queries_(num_queries)
{
  runner_.reset(new DpuRunner(runner_dir));
  loadImages(); // TO-DO MNDBG: this function needs to be populated to read JPEG and save NHWC or NCHW tensors

}

void TestClassify::run() {
  auto inputs = runner_->get_inputs();
  auto outputs = runner_->get_outputs();

  for (unsigned i=0; i < num_queries_; i++)
  {
    copy(images_[i], inputs);//TO-DO MNDBG: copy data from images_[i] to inputs tensorbuffer, this inputs tensorbuffer can be used to store standard tensors. Later, when wo go to dpuv3int8 specific controller file, there we can convert the standard tensorbuffer to ddr 32bit space aligned tensorbuffer.

    //Notes: tensorbuffer basically holds a block of memory of a certain size. We can keep reusing the same block fo memory as we loop through all images. each tensorbuffer has a 1-1 mapping to devicebuffer. SO, using get_inputs(), we would allocate a given size of tensorbuffer on host side and equivalent device buffer and store this as 1-1 map. We keep reusing this tensorbuffer to process images.

    auto ret = runner_->execute_async(inputs, outputs);
    runner_->wait(uint32_t(ret.first), -1);
  }
}

void TestClassify::loadImages(){ //TO-DO MNDBG
  images_.resize(num_queries_);
  int inSize = 224*224*3;
  for (int i = 0; i < num_queries_; i++)
      images_[i].resize(inSize);
}

void TestClassify::copy(std::vector<float>, std::vector<xir::vart::TensorBuffer*>){ //TO-DO MNDBG
}

