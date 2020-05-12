#pragma once

#include <vart/runner.hpp> 
#include "dpu_controller.hpp"

/*
 * References:
 * /proj/xsjhdstaff1/aaronn/git/xcdl/Vitis-AI/vart
 *  dpu-runner/src/cloud/cloud_dpu_runner.hpp
 *  dpu-runner/src/dpu_runner_base_imp.hpp
 *  runner/include/vart/runner.hpp
 */

class DpuRunner: public vart::Runner {
  public:
    DpuRunner(std::string meta);
    ~DpuRunner();
    DpuRunner(const DpuRunner&) = delete;
    DpuRunner& operator=(const DpuRunner& other) = delete;

    virtual std::pair<uint32_t, int> execute_async(
      const std::vector<vart::TensorBuffer*>& inputs,
      const std::vector<vart::TensorBuffer*>& outputs) override;
    virtual int wait(int jobid, int timeout) override;
    virtual std::vector<const xir::Tensor*> get_input_tensors() override; 
    virtual std::vector<const xir::Tensor*> get_output_tensors() override; 

  private:
    std::vector<std::unique_ptr<DpuController> > dpu_controller_;
};
