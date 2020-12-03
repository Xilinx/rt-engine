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
    cout << "Usage of resnet50 demo: ./resnet50 [xmodel_file] [meta.json] [imageDir]" << endl;
    return -1;
  }

  string xmodel_filename = argv[1];
  int numImgs = 4;
  int batchSz = 4; 
  string meta = argv[2];
  //bool goldenAvailable = 0;
  //bool verbose = 1;
  string img_dir = argv[3];
  assert((numImgs%batchSz)==0);
  const unsigned num_queries_ = numImgs/batchSz;

  std::unique_ptr<xir::Graph> graph0 = xir::Graph::deserialize(xmodel_filename);
  auto subgraph0 = graph0->get_root_subgraph();
  std::map<std::string, std::string> runset;
  runset.emplace("run","librt-engine.so");
  //subgraph0->children_topological_sort()[1]->set_attr<std::string>("kernel", "DPUCVDX8H");
  subgraph0->children_topological_sort()[1]->set_attr("runner", runset);
  //subgraph0->children_topological_sort()[1]->set_attr<std::string>("xclbin", "/group/dphi_cloud/v4e_rel/20200923/v4e_8pe_300MHz_xilinx_vck5000-es1_gen3x16_1_202010_1_a29ff10_Sep16Wed1614.xclbin");
  graph0->serialize("./dpu.xmodel");


  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize("./dpu.xmodel");
  auto subgraph = get_dpu_subgraph(graph.get());
  //std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();

  auto r = vart::Runner::create_runner(subgraph[0], "run");
  auto runner = r.get();
  auto inputs = dynamic_cast<vart::RunnerExt*>(runner)->get_inputs();
  auto outputs = dynamic_cast<vart::RunnerExt*>(runner)->get_outputs();
  auto output_tensors = runner->get_output_tensors(); 
  //std::unique_ptr<cpuUtil> cpuUtilobj_;
  //cpuUtilobj_.reset(new cpuUtil(meta, goldenAvailable, verbose, img_dir, num_queries_));
  std::vector<vart::TensorBuffer*> inTensors;    
  void *codePtr = NULL;
  std::string inputbin = "./tests/app/models/v4e_resnet50/input.bin";
  unsigned int size = getFileSize(inputbin);
  if (posix_memalign(&codePtr, getpagesize(), size*8))
    throw std::bad_alloc();
  auto infile = ifstream(inputbin, ios::in | ios::binary);
  for (unsigned i=0; infile.read(&((char*)codePtr)[i], sizeof(int8_t)); i++);
  std::vector<std::unique_ptr<vart::TensorBuffer> > tbufs;
  for (int bi=0; bi < 8; bi++)
   {
     memcpy((void*)inputs[0]->data().first+bi*size, codePtr,size);
   }
  auto tensorr = inputs[0]->get_tensor()->get_shape()[0];
cout <<tensorr << endl; 
  std::cout << std::endl << "Testing single thread..." << std::endl;
  auto t1 = std::chrono::high_resolution_clock::now();
  //std::cout<<"Loading "<<num_queries_*4<<" Images ..."<<std::endl;
  for (unsigned i=0; i < num_queries_; i++)
  {
        //cpuUtilobj_->fillInData(i, inputs);
    	auto ret = (runner)->execute_async(inputs, outputs);
       	(runner)->wait(uint32_t(ret.first), -1);
        //cpuUtilobj_->postProcess(outputs, i);
        //
    const auto mode = std::ios_base::out | std::ios_base::binary | std::ios_base::trunc;
    for (int bi=0; bi < 8; bi++) {
      for (int t=0;t<3;t++) { 
        auto output_file = "./output0" +to_string(t)+ to_string( bi) + ".bin";
        //auto output_file = "./output1" + to_string( bi) + ".bin";
        //auto output_file = "./output2" + to_string( bi) + ".bin";
        //void* outData;
        //size_t sz;
        //std::tie(outData, sz) = outputs[bi*3+t]->data();
        //const char *out = (const char*)outData;

        std::ofstream(output_file, mode).write((char*)outputs[t]->data().first+bi*output_tensors[t]->get_element_num(), output_tensors[t]->get_element_num());
      }
    }


  }
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "QPS: " << num_queries_/elapsed.count() << std::endl;
  return 0;
}
