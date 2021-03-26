/*
 * Copyright 2019 Xilinx Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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

/**
 * @brief Entry for runing ResNet50 neural network
 *
 * @note Runner APIs prefixed with "dpu" are used to easily program &
 *       deploy ResNet50 on DPU platform.
 *
 */
int main(int argc, char* argv[]) {
  // Check args
  if (argc != 4) {
    cout << "Usage: ./resnet50 [xmodel_file] [core_batch] [thread_num]" << endl;
    return -1;
  }

  string xmodel_filename = argv[1];
  int core_batch = atoi(argv[2]);
  int thread_num = atoi(argv[3]);
  std::cout << "core_batch " << core_batch << ", thread_num " << thread_num << std::endl;
  int numImgs = 4;
  int batchSz = 4; 
  assert((numImgs%batchSz)==0);
  const unsigned num_queries_ = numImgs/batchSz;

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
      std::string inputbin = "./tests/vart_dpuv3e/data.bin";
      unsigned int size = getFileSize(inputbin);
      if (posix_memalign(&codePtr, getpagesize(), size * core_batch))
        throw std::bad_alloc();
      auto infile = ifstream(inputbin, ios::in | ios::binary);
      for (unsigned i=0; infile.read(&((char*)codePtr)[i], sizeof(int8_t)); i++);
      
      for (int bi=0; bi < core_batch; bi++)
      {
         memcpy((void*)inputs[0]->data().first+bi*size, codePtr,size);
      }

      //auto t1 = std::chrono::high_resolution_clock::now();
      
      for (unsigned i=0; i < num_queries_; i++)
      {
         auto ret = (runner)->execute_async(inputs, outputs);
        	(runner)->wait(uint32_t(ret.first), -1);
         
         const auto mode = std::ios_base::out | std::ios_base::binary | std::ios_base::trunc;
	 //std::cout << "thread: " << th << std::endl;
         for (int bi=0; bi < core_batch; bi++) {
           for (int t=0;t<1;t++) {
             auto output_file = "./output" + to_string(th) +  to_string(t) + to_string(bi) + ".bin";
             std::ofstream(output_file, mode).write((char*)outputs[t]->data().first + bi*output_tensors[t]->get_element_num(), output_tensors[t]->get_element_num());
           }
         }
      }
    //auto t2 = std::chrono::high_resolution_clock::now();
    //std::chrono::duration<double> elapsed = t2-t1;
    });
  }

  for(int th=0; th<thread_num; th++) {
    workers[th].join();
  }

  //std::cout << "Elapsed: " << elapsed.count() << std::endl;
  //std::cout << "QPS: " << num_queries_/elapsed.count() << std::endl;
  return 0;
}
