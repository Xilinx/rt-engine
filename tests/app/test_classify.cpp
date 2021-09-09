// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "tests.hpp"

TestClassify::TestClassify(std::string runner_dir, unsigned num_queries) 
 : num_queries_(num_queries)
{
  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runner_.reset(new vart::DpuRunner(subgraph));
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
  for (unsigned i = 0; i < num_queries_; i++)
      images_[i].resize(inSize);
}

void TestClassify::copy(std::vector<float>, std::vector<vart::TensorBuffer*>){ //TO-DO MNDBG
}

