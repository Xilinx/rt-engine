#include <unistd.h>
#include "tests.hpp"

SingleThreadTest::SingleThreadTest(std::string runner_dir, unsigned num_queries) 
 : num_queries_(num_queries)
{
  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runner_.reset(new vart::DpuRunner(subgraph));
}

void SingleThreadTest::run() {
  auto inputs = runner_->get_inputs();
  auto outputs = runner_->get_outputs();

  for (unsigned i=0; i < num_queries_; i++)
  {
    auto ret = runner_->execute_async(inputs, outputs);
    runner_->wait(uint32_t(ret.first), -1);
  }
}
