#pragma once

#include <future>
#include <map>
#include <queue>
#include <mutex>
#include <condition_variable>
#include <atomic>
#include <memory>
#include <cmath>

#include "xir/tensor/tensor.hpp"
#include "vart/runner.hpp"
#include "dpu_runner_ext.hpp"
#include "dpu_controller.hpp"

/*
 * References:
 * /proj/xsjhdstaff1/aaronn/git/xcdl/Vitis-AI/vart
 *  dpu-runner/src/cloud/cloud_dpu_runner.hpp
 *  dpu-runner/src/dpu_runner_base_imp.hpp
 *  runner/include/vart/runner.hpp
 */

namespace vart {

class DpuRunner: public vart::dpu::DpuRunnerExt {
  public:
    DpuRunner(const xir::Subgraph* subgraph);
    ~DpuRunner();
    DpuRunner(const DpuRunner&) = delete;
    DpuRunner& operator=(const DpuRunner& other) = delete;

    virtual std::pair<uint32_t, int> 
    execute_async(const std::vector<vart::TensorBuffer*>& inputs,
      const std::vector<vart::TensorBuffer*>& outputs) override;

    virtual int wait(int jobid, int timeout) override;
    
    virtual TensorFormat get_tensor_format() override { 
      return Runner::TensorFormat::NHWC; }
    
    virtual std::vector<const xir::Tensor*> get_input_tensors() override; 
    virtual std::vector<const xir::Tensor*> get_output_tensors() override; 
    
    virtual std::vector<vart::TensorBuffer*> get_inputs() override;
    virtual std::vector<vart::TensorBuffer*> get_outputs() override;
    virtual std::vector<float> get_input_scale() const override;
    virtual std::vector<float> get_output_scale() const override;

  protected:
    std::vector<std::unique_ptr<DpuController>> dpu_controller_;
    std::atomic<unsigned> exec_core_idx_;
    std::vector<float> ip_scale;
    std::vector<float> op_scale;
};

class CpuFlatTensorBuffer : public vart::TensorBuffer {
public:
  explicit CpuFlatTensorBuffer(void *data, const xir::Tensor *tensor) : TensorBuffer{tensor}, data_{data} {};
  virtual ~CpuFlatTensorBuffer() = default;

public:
  virtual std::pair<uint64_t, size_t>
  data(const std::vector<int> idx = {}) override {
  uint32_t dtype_size = std::ceil(tensor_->get_data_type().bit_width / 8.f);
    if (idx.size() == 0) {
    //return std::make_pair(data_, tensor_->get_element_num());
	return std::make_pair(reinterpret_cast<uint64_t>(data_), tensor_->get_element_num()*dtype_size);
  }
  auto dims = tensor_->get_shape();
  auto offset = 0;
  for (auto k = 0; k < tensor_->get_element_num(); k++) {
    auto stride = 1;
    for (auto m = k + 1; m < tensor_->get_element_num(); m++) {
      stride *= dims[m];
    }
    offset += idx[k] * stride;
  }

  auto elem_num = tensor_->get_element_num();

  //# Temp code to add offset according to previous
  char *data = reinterpret_cast<char*>(data_) +  offset * dtype_size;
  
  //return std::make_pair((char *)data_ + offset * dtype_size,
  return std::make_pair(reinterpret_cast<uint64_t>(data), 
      (elem_num - offset) * dtype_size);
  }

private:
  void *data_;
};
 
} //vart namespace

extern "C" {
  vart::Runner* create_runner(const xir::Subgraph* subgraph);
}
