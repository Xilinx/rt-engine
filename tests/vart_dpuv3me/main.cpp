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
//#include <vart/dpu/dpu_runner_ext.hpp>
#include <vart/runner_ext.hpp>
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>
#include "common.h"
/* header file OpenCV for image processing */
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
    cout << "Usage of demo: ./app [xmodel_file] [meta.json] [imageDir]" << endl;
    return -1;
  }

  string xmodel_filename = argv[1];
  int numImgs = 4;
  int batchSz = 1; 
  string meta = argv[2];
  string img_dir = argv[3];
  assert((numImgs%batchSz)==0);
  const unsigned num_queries_ = 1;//numImgs/batchSz;

  std::unique_ptr<xir::Graph> graph0 = xir::Graph::deserialize(xmodel_filename);
  auto subgraph0 = graph0->get_root_subgraph();
  std::map<std::string, std::string> runset;
  runset.emplace("run","librt-engine.so");
  subgraph0->children_topological_sort()[1]->set_attr<std::string>("kernel", "DPUCAHX8L");
  subgraph0->children_topological_sort()[1]->set_attr("runner", runset);
  graph0->serialize("./dpu.xmodel");

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize("./dpu.xmodel");
  auto subgraph = get_dpu_subgraph(graph.get());
 
  auto r = vart::Runner::create_runner(subgraph[0], "run");
  auto runner = r.get();
  auto inputs = dynamic_cast<vart::RunnerExt*>(runner)->get_inputs();
  auto outputs = dynamic_cast<vart::RunnerExt*>(runner)->get_outputs();
 
  std::cout << std::endl << "Testing single thread..." << std::endl;
  auto t1 = std::chrono::high_resolution_clock::now();
  //std::cout<<"Loading "<<num_queries_*4<<" Images ..."<<std::endl;
  for (unsigned i=0; i < num_queries_; i++)
  {
    	auto ret = (runner)->execute_async(inputs, outputs);
       	(runner)->wait(uint32_t(ret.first), -1);
  }
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::chrono::duration<double, std::micro> elapsed_micro = t2 - t1;

  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "Elapsed-micro: " << elapsed_micro.count() << std::endl;
  std::cout << "QPS: " << num_queries_/elapsed.count() << std::endl;
  return 0;
}
