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

#include <unistd.h>
#include <thread>
#include "tests.hpp"
#include "vart/tensor_buffer.hpp"

MultiThreadTest::MultiThreadTest(
  std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners) 
 : num_queries_(nqueries), num_threads_(nthreads), num_runners_(nrunners), 
   runner_dir_(runner_dir), runners_(nrunners)
{
  std::vector<std::thread> threads(num_runners_);
  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti] = std::thread([this,ti]{init_thread(ti);});

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}

void MultiThreadTest::run() {
  std::vector<std::thread> threads(num_threads_);
  for (unsigned ti=0; ti < threads.size(); ti++)
  {
    auto ri = ti % runners_.size();
    threads[ti] = std::thread([this,ri]{run_thread(ri, num_queries_/num_threads_);});
  }

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}

void MultiThreadTest::init_thread(unsigned ridx) {
  if(runner_dir_.find(".json") != std::string::npos)
    runners_[ridx].reset(new vart::DpuRunner(runner_dir_));
  else
  {
    std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir_);
    std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
    auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
    runners_[ridx].reset(new vart::DpuRunner(subgraph));
  }
}

void MultiThreadTest::run_thread(unsigned ridx, unsigned n) {
  auto runner = runners_[ridx].get();
  auto inputs = runner->get_inputs();
  auto outputs = runner->get_outputs();

  for (unsigned i=0; i < n; i++)
  {
    auto ret = runner->execute_async(inputs, outputs);
    runner->wait(uint32_t(ret.first), -1);
  }
}

