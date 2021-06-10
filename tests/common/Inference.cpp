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

#include <thread>
#include <chrono>
#include "Inference.hpp"

Inference::Inference(
  std::string xmodel, unsigned num_queries, unsigned num_threads, unsigned num_runners, std::string image_dir,
  const bool verbose, std::string synset_filename, std::string golden_filename, std::string accuracyCheckTop1Top5Nums, std::string performanceCheck)
  : xmodel_(xmodel), num_queries_(num_queries), num_threads_(num_threads), num_runners_(num_runners) {

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel_);
  std::vector<xir::Subgraph*> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  subgraph_ = subgraphs[1];

  for (unsigned i = 0; i < num_runners_; i++)
    runners_.push_back(std::make_unique<vart::DpuRunner>(subgraph_));

  std::cout << "Executing test for " << xmodel << std::endl;
  std::cout << "********************************" << std::endl;
  std::cout << "Loading " << num_queries_ * 4 << " Images ..." << std::endl;

  cpuUtilobj_ = std::make_unique<cpuUtil>(xmodel, image_dir, num_queries_, verbose, synset_filename, golden_filename, accuracyCheckTop1Top5Nums, performanceCheck);


}

int Inference::run() {
  auto t0 = std::chrono::high_resolution_clock::now();               

  std::vector<std::thread> threads(num_threads_);

  for (unsigned ti = 0; ti < threads.size(); ti++) {
    auto ri = ti % runners_.size();
    threads[ti] = std::thread([this, ti, ri] { run_thread(ti, ri, num_queries_ / num_threads_); });
  }

  for (unsigned ti = 0; ti < threads.size(); ti++)
    threads[ti].join();

  auto t1 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t1-t0;
  
  std::cout << "Total Execution time for "<<num_queries_<<" queries: "<<elapsed.count()*1000 <<"ms"<< std::endl;
  std::cout << "Average queries per second: " << num_queries_/elapsed.count() << "qps"<<std::endl;
  int returnCode = cpuUtilobj_->printtop1top5(num_queries_, elapsed.count());

  return returnCode;
}

void Inference::run_thread(unsigned tidx, unsigned ridx, unsigned n) {
  auto runner = runners_[ridx].get();
  auto inputs = runner->make_inputs();
  auto outputs = runner->make_outputs();

  for (unsigned i = tidx * n; i < (tidx + 1) * n; i++) {
    cpuUtilobj_->fillInData(i, inputs);
    auto ret = runner->execute_async(inputs, outputs);
    runner->wait(uint32_t(ret.first), 20000);
    cpuUtilobj_->postProcess(outputs, i);
  }
}

