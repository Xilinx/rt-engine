// Copyright 2021 Xilinx Inc.
// //
// // Licensed under the Apache License, Version 2.0 (the "License");
// // you may not use this file except in compliance with the License.
// // You may obtain a copy of the License at
// //
// //      http://www.apache.org/licenses/LICENSE-2.0
// //
// // Unless required by applicable law or agreed to in writing, software
// // distributed under the License is distributed on an "AS IS" BASIS,
// // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// // See the License for the specific language governing permissions and
// // limitations under the License.
//

#include <assert.h>
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>

#include <cassert>
#include <cmath>
#include <cstdio>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <queue>
#include <string>
#include <vector>
#include <chrono>

#include <vart/runner.hpp>
#include <vart/runner_ext.hpp>
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>
#include "common.h"

using namespace std;
static long getFileSize(std::string filename)
{
    struct stat stat_buf;
    int rc = stat(filename.c_str(), &stat_buf);
    return rc == 0 ? stat_buf.st_size : -1;
}

int main(int argc, char* argv[]) {
  // Check args
  if (argc != 6) {
    cout << "Usage: ./resnet50 [xmodel_file] [input_file] [core_batch] [tensor_batch] [thread_num]" << endl;
    return -1;
  }

  string xmodel_filename = argv[1];
  string input_file = argv[2];
  int core_batch = atoi(argv[3]);
  int tensor_batch = atoi(argv[4]); // 2 for image bonding, 1 for others
  int thread_num = atoi(argv[5]);
  std::cout << "core_batch " << core_batch << ", thread_num " << thread_num << std::endl;

  std::unique_ptr<xir::Graph> graph0 = xir::Graph::deserialize(xmodel_filename);
#if 0
  auto subgraph0 = graph0->get_root_subgraph();
  std::map<std::string, std::string> runset;
  runset.emplace("run","librt-engine.so");
  subgraph0->children_topological_sort()[1]->set_attr("runner", runset);
  graph0->serialize("./dpu.xmodel");

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize("./dpu.xmodel");
#else
  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel_filename);
#endif

  auto subgraph = get_dpu_subgraph(graph.get());

  std::thread workers[thread_num];
  for(int th=0; th<thread_num; th++) {
    workers[th] = std::thread([&, th]() {
      auto r = vart::Runner::create_runner(subgraph[0], "run");
      auto runner = r.get();
      auto inputs = dynamic_cast<vart::RunnerExt*>(runner)->get_inputs();
      auto outputs = dynamic_cast<vart::RunnerExt*>(runner)->get_outputs();
      auto output_tensors = runner->get_output_tensors();

      void *codePtr = NULL;
      std::string inputbin = input_file;
      unsigned int size = getFileSize(inputbin);
      if (posix_memalign(&codePtr, getpagesize(), size * core_batch))
        throw std::bad_alloc();
      auto infile = ifstream(inputbin, ios::in | ios::binary);
      for (unsigned i=0; infile.read(&((char*)codePtr)[i], sizeof(int8_t)); i++);
      for (int bi=0; bi < core_batch; bi++)
      {
         memcpy((void*)inputs[0]->data(std::vector<int>{bi,0,0,0}).first, codePtr, size);
      }

      for (auto& input : inputs) {
	//std::cout << input->get_tensor()->get_element_num() << " " << input->get_tensor()->get_shape()[0] << std::endl;
        input->sync_for_write(0, tensor_batch*input->get_tensor()->get_element_num() /
                                   input->get_tensor()->get_shape()[0]);
      }
      
      auto ret = (runner)->execute_async(inputs, outputs);
             (runner)->wait(uint32_t(ret.first), -1);
      for (auto& output : outputs) {
        //std::cout << output->get_tensor()->get_element_num() << " " << output->get_tensor()->get_shape()[0] << std::endl;
        output->sync_for_read(0, tensor_batch*output->get_tensor()->get_element_num() /
                                   output->get_tensor()->get_shape()[0]);
      }

      const auto mode = std::ios_base::out | std::ios_base::binary | std::ios_base::trunc;
      auto dims = outputs[0]->get_tensor()->get_shape();
      for (auto &x : dims) x=0;

      for (int bi = 0; bi < core_batch; bi++) {
	dims[0]=bi;
        for (int o = 0; o < output_tensors.size(); o++) {
          auto output_file = "./output_th" + to_string(th) + "_o" + to_string(o) + "_b" + to_string(bi) + ".bin";
          std::ofstream(output_file, mode).write((char*)outputs[o]->data(dims).first, tensor_batch*output_tensors[o]->get_element_num()/output_tensors[o]->get_shape()[0]);
        }
      }

    });
  }

  for(int th=0; th<thread_num; th++) {
    workers[th].join();
  }

  return 0;
}
