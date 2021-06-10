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

FpgaOnlySingleQueryExecution::FpgaOnlySingleQueryExecution(std::string runner_dir) 
{

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runner_.reset(new vart::DpuRunner(subgraph));
  
  std::cout<<"********************************"<<std::endl;
  std::cout<<"Loading 4 Images ..."<<std::endl;
  std::cout<<"Loading meta file from "<<runner_dir<<std::endl;

}

void FpgaOnlySingleQueryExecution::run() {
  
  auto inputs = runner_->get_inputs();
  auto outputs = runner_->get_outputs();
  auto ret = runner_->execute_async(inputs, outputs);
  runner_->wait(uint32_t(ret.first), -1);

}

