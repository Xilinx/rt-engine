#include <iostream>
#include "dpu_runner.hpp"
#include "engine.hpp"

DpuRunner::DpuRunner() {
}

DpuRunner::~DpuRunner() {
}

std::vector<const xir::Tensor*> DpuRunner::get_input_tensors() {
  return std::vector<const xir::Tensor*>();
}
std::vector<const xir::Tensor*> DpuRunner::get_output_tensors() {
  return std::vector<const xir::Tensor*>();
}

class DpuTask : public EngineTask {
  public:
    DpuTask(
      const std::vector<vart::TensorBuffer*>& inputs,
      const std::vector<vart::TensorBuffer*>& outputs) 
      : inputs_(inputs), outputs_(outputs) { }
    virtual void operator()(void) {
      std::cout << "Hello!" << std::endl;
      std::cout << inputs_.size() << " " << outputs_.size() << std::endl;
    }

  private:
    const std::vector<vart::TensorBuffer*>& inputs_;
    const std::vector<vart::TensorBuffer*>& outputs_;
};

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<vart::TensorBuffer*>& inputs,
  const std::vector<vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit(new DpuTask(inputs, outputs));
  return std::pair<uint32_t, int>(job_id, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  (void)timeout;
  Engine& engine = Engine::get_instance();
  engine.wait(jobid);

  return 0;
}
