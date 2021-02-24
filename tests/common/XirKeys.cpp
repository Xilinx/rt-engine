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

  auto tensorInfo = subgraph->get_attr<std::string>("tensor_info");
  const char *c = tensorInfo.c_str();
  json_object *jobj = json_tokener_parse(c);
  json_object_object_foreach(jobj, key, val) {
    std::string keyString(key);
    if (keyString == "inputs") {
      json_object_object_foreach(val, inputkey, inputval) {
        assert(inputkey);
        json_object *obj = json_object_object_get(inputval, "shape");
        json_object *shapeVal;
        shapeVal = json_object_array_get_idx(obj, 1);
        inH_ = json_object_get_int(shapeVal);
        shapeVal = json_object_array_get_idx(obj, 2);
        inW_ = json_object_get_int(shapeVal);
        shapeVal = json_object_array_get_idx(obj, 3);
        inCh_ = json_object_get_int(shapeVal);
      }
    }
    if (keyString == "outputs") {
      json_object_object_foreach(val, outputkey, outputval) {
        assert(outputkey);
        json_object *obj = json_object_object_get(outputval, "shape");
        json_object *shapeVal;
        shapeVal = json_object_array_get_idx(obj, 1);
        outH_ = json_object_get_int(shapeVal);
        shapeVal = json_object_array_get_idx(obj, 2);
        outW_ = json_object_get_int(shapeVal);
        shapeVal = json_object_array_get_idx(obj, 3);
        outCh_ = json_object_get_int(shapeVal);
      }
    }
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