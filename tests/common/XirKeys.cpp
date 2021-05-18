#include <xir/graph/graph.hpp>
#include <xir/graph/subgraph.hpp>
#include "XirKeys.hpp"

XirKeys::XirKeys(std::string xmodel) {
  // Defaults
  inW_ = 0;
  inH_ = 0;
  inCh_ = 0;
  outW_ = 0;
  outH_ = 0;
  outCh_ = 0;

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];

  //auto attrs = subgraph->get_attrs();
  //auto keys = attrs->get_keys();
  //TO-DO: Extend this to mulit input, multi output
  auto input_tensors = subgraph->get_input_tensors();
  auto output_tensors = subgraph->get_output_tensors();
  for (auto it : input_tensors)
  {
    inH_ = it->get_shape().at(1);
    inW_ = it->get_shape().at(2);
    inCh_ = it->get_shape().at(3);
  }

  for (auto it : output_tensors)
  {
    outH_ = it->get_shape().at(1);
    outW_ = it->get_shape().at(2);
    outCh_ = it->get_shape().at(3);
  }

  // if any still zero throw
  if (!(inW_ && inH_ && inCh_ && outW_ && outH_ && outCh_))
    throw std::runtime_error("Error reading shapes from model.");
}

uint32_t XirKeys::getOutW() const { return outW_; }

uint32_t XirKeys::getOutH() const { return outH_; }

uint32_t XirKeys::getOutCh() const { return outCh_; }

uint32_t XirKeys::getInW() const { return inW_; }

uint32_t XirKeys::getInH() const { return inH_; }

uint32_t XirKeys::getInCh() const { return inCh_; }
