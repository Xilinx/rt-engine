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

using namespace std;
using namespace cv;


/**
 * @brief Entry for runing ResNet50 neural network
 *
 * @note Runner APIs prefixed with "dpu" are used to easily program &
 *       deploy ResNet50 on DPU platform.
 *
 */
int main(int argc, char* argv[]) {
  // Check args
  if (argc != 2) {
    cout << "Usage of resnet50 demo: ./resnet50 [model_file]" << endl;
    return -1;
  }
  
  /*create runner*/
  auto runner_ = vart::Runner::create_runner(argv[1]);

  int idx = 0;
  /*get in/out tensor*/
  auto inputs = dynamic_cast<vart::dpu::DpuRunnerExt*>(runner_[idx].get())->get_inputs();
  auto outputs = dynamic_cast<vart::dpu::DpuRunnerExt*>(runner_[idx].get())->get_outputs();

  std::cout << std::endl << "Testing single thread..." << std::endl;
  auto t1 = std::chrono::high_resolution_clock::now();
  int num_queries_ = 10000;
  for (unsigned i=0; i < num_queries_; i++)
  {
     	auto ret = runner_[idx]->execute_async(inputs, outputs);
    	runner_[idx]->wait(uint32_t(ret.first), -1);
  }
   auto t2 = std::chrono::high_resolution_clock::now();
   std::chrono::duration<double> elapsed = t2-t1;
   std::cout << "Elapsed: " << elapsed.count() << std::endl;
   std::cout << "QPS: " << num_queries_/elapsed.count() << std::endl;


  return 0;
}
