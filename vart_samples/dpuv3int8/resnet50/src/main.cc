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
#include <dpu_runner_ext.hpp>
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>

//#include "common.h"
/* header file OpenCV for image processing */
#include <opencv2/opencv.hpp>
#include "cpuutil.hpp"

using namespace std;
using namespace cv;

std::vector<const xir::Subgraph*> get_dpu_subgraph(
            const xir::Graph* graph) {
    auto root = graph->get_root_subgraph();
    auto children = root->children_topological_sort();
    auto ret = std::vector<const xir::Subgraph*>();
    for (auto c : children) {
        CHECK(c->has_attr("device"));
        auto device = c->get_attr<std::string>("device");
        if (device == "DPU") {
            ret.emplace_back(c);
        }
    }
    return ret;
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
    cout << "Usage of resnet50 demo: ./resnet50 [xmodel_file] [meta.json] [imageDir]" << endl;
    return -1;
  }

  string xmodel_filename = argv[1];
  int numImgs = 4;
  int batchSz = 4; 
  string meta = argv[2];
  bool goldenAvailable = 0;
  bool verbose = 1;
  string img_dir = argv[3];
  assert((numImgs%batchSz)==0);
  const unsigned num_queries_ = numImgs/batchSz;

  std::unique_ptr<xir::Graph> graph0 = xir::Graph::deserialize(xmodel_filename);
  auto subgraph0 = graph0->get_root_subgraph();
  std::map<std::string, std::string> runset;
  runset.emplace("run","./build/libengine.so");
  subgraph0->children_topological_sort()[1]->set_attr("runner", runset);
//  subgraph0->children_topological_sort()[1]->set_attr<std::string>("kernel", "DPUCVDX8H");
//  subgraph0->children_topological_sort()[1]->set_attr<std::string>("xclbin", "");
  graph0->serialize("./dpu.xmodel");
  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize("./dpu.xmodel");
  auto subgraph = get_dpu_subgraph(graph.get());

  auto r = vart::Runner::create_runner(subgraph[0], "run");
  auto runner = r.get();
  auto inputs = dynamic_cast<vart::dpu::DpuRunnerExt*>(runner)->get_inputs();
  auto outputs = dynamic_cast<vart::dpu::DpuRunnerExt*>(runner)->get_outputs();
  
  std::unique_ptr<cpuUtil> cpuUtilobj_;
  cpuUtilobj_.reset(new cpuUtil(meta, goldenAvailable, verbose, img_dir, num_queries_));
  
  std::cout << std::endl << "Testing single thread..." << std::endl;
  auto t1 = std::chrono::high_resolution_clock::now();
  std::cout<<"Loading "<<num_queries_*4<<" Images ..."<<std::endl;
  for (unsigned i=0; i < num_queries_; i++)
  {
        cpuUtilobj_->fillInData(i, inputs);
    	auto ret = (runner)->execute_async(inputs, outputs);
       	(runner)->wait(uint32_t(ret.first), -1);
        cpuUtilobj_->postProcess(outputs, i);
  }
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "QPS: " << num_queries_/elapsed.count() << std::endl;
  return 0;
}
