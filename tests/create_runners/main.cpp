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

#include <iostream>

#include <string>
#include <vector>
#include <thread>
#include <vart/runner.hpp>
#include <dpu_runner_ext.hpp>
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>

int main(int argc, char* argv[]) {
  // Check args
  if (argc != 2) {
    cout << "Usage: ./create_runners [xmodel_file]" << endl;
    return -1;
  }
  
  string xmodel_filename = argv[1];
 
  unsigned num_runners = 10;

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel_filename);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];
  std::map<std::string, std::string> runset;
  runset.emplace("run","librt-engine.so");
  subgraph->set_attr("runner", runset);
  
  std::vector<std::unique_ptr<vart::Runner>> runners_;
  
  std::vector<std::thread> threads(num_runners);
  
  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti] = std::thread([&]{runners_.push_back(vart::Runner::create_runner(subgraph,"run"));});

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
  
  return 0;
}
