#include <iostream>
#include <fstream>
#include <sstream>
#include "dpu_runner.hpp"
#include "engine.hpp"
#include "json-c/json.h"
#include "dpu_controller_factory.hpp"
#include "vitis/ai/target_factory.hpp"

namespace vart{

DpuRunner::DpuRunner(const xir::Subgraph* subgraph) {
  // default: each DpuController controls one core,
  //          each DpuRunner has one DpuController
  // (keep it simple)

  std::string kernel;
  if (subgraph->has_attr("dpu_fingerprint")) {
    const uint64_t fingerprint = subgraph->get_attr<std::uint64_t>("dpu_fingerprint");
    kernel = vitis::ai::target_factory()->create(fingerprint).type();
  } else {
    kernel = subgraph->get_attr<std::string>("kernel");
  }

  dpu_controller_ = DpuControllerFactory::get_instance().get(kernel, subgraph);
  
  in_bufs = dpu_controller_->get_inputs();
  out_bufs = dpu_controller_->get_outputs();
}

DpuRunner::DpuRunner(std::string meta) {
  // default: each DpuController controls one core,
  //          each DpuRunner has one DpuController
  // (keep it simple)
 
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, "kernel", &obj))
    std::cout<<"missing kernel field in meta.json"<<std::endl;
  std::string kernel = json_object_get_string(obj);

  dpu_controller_ = DpuControllerFactory::get_instance().get(kernel, meta);

  in_bufs = dpu_controller_->get_inputs();
  out_bufs = dpu_controller_->get_outputs();
}


DpuRunner::~DpuRunner() {
}

std::vector<const xir::Tensor*> DpuRunner::get_input_tensors() {
  return dpu_controller_->get_input_tensors();
}
std::vector<const xir::Tensor*> DpuRunner::get_output_tensors() {
  return dpu_controller_->get_output_tensors();
}

std::vector<vart::TensorBuffer*> DpuRunner::get_inputs() {
  return in_bufs;
}

std::vector<vart::TensorBuffer*> DpuRunner::get_outputs() {
  return out_bufs;
}

std::vector<vart::TensorBuffer*> DpuRunner::make_inputs(int batchsz) {
  return dpu_controller_->get_inputs(batchsz);
}
std::vector<vart::TensorBuffer*> DpuRunner::make_outputs(int batchsz) {
  return dpu_controller_->get_outputs(batchsz);
}



std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<vart::TensorBuffer*>& inputs,
  const std::vector<vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit([this, &inputs, &outputs] {
    dpu_controller_->run(inputs, outputs);
  });
  return std::pair<uint32_t, int>(job_id, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  Engine& engine = Engine::get_instance();
  engine.wait(jobid, timeout);

  return 0;
}

} //namespace vart

/** @brief create dpu runner
*/
vart::Runner* create_runner(const xir::Subgraph* subgraph) {
     auto ret = std::make_unique<vart::DpuRunner>(subgraph);
     return ret.release();
}
