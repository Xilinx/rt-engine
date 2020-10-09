#include "tests.hpp"

FpgaOnlySingleQueryExecutionHack::FpgaOnlySingleQueryExecutionHack(std::string runner_dir) 
{

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runner_.reset(new vart::DpuRunner(subgraph));
  
  std::cout<<"********************************"<<std::endl;
  std::cout<<"Loading 4 Images ..."<<std::endl;
  std::cout<<"Loading meta file from "<<runner_dir<<std::endl;

}

void FpgaOnlySingleQueryExecutionHack::run() {
  
  auto inputs = runner_->get_inputs();
  auto outputs = runner_->get_outputs();
  auto ret = runner_->execute_async(inputs, outputs);
  runner_->wait(uint32_t(ret.first), -1);

}

