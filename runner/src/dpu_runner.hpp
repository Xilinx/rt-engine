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
#include "vart/runner_ext.hpp"
#include "dpu_controller.hpp"
#include "vart/experimental/runner_helper.hpp"

/*
 * References:
 * /proj/xsjhdstaff1/aaronn/git/xcdl/Vitis-AI/vart
 *  dpu-runner/src/cloud/cloud_dpu_runner.hpp
 *  dpu-runner/src/dpu_runner_base_imp.hpp
 *  runner/include/vart/runner.hpp
 */

namespace vart {

class DpuRunner : public vart::RunnerExt
{
public:
  DpuRunner(const xir::Subgraph* subgraph);

  DpuRunner(std::string meta);

  ~DpuRunner();

  DpuRunner(const DpuRunner&) = delete;

  DpuRunner& operator=(const DpuRunner& other) = delete;

  virtual std::pair<uint32_t, int>
  execute_async(const std::vector<vart::TensorBuffer*>& inputs,
                const std::vector<vart::TensorBuffer*>& outputs) override;

  virtual int wait(int jobid, int timeout) override;

  virtual TensorFormat get_tensor_format() override
  {
    return Runner::TensorFormat::NHWC;
  }

  virtual std::vector<const xir::Tensor*> get_input_tensors() override;

  virtual std::vector<const xir::Tensor*> get_output_tensors() override;

  virtual std::vector<vart::TensorBuffer*> get_inputs() override;

  virtual std::vector<vart::TensorBuffer*> get_outputs() override;

  virtual std::vector<vart::TensorBuffer*> make_inputs(int batchsz = -1);

  virtual std::vector<vart::TensorBuffer*> make_outputs(int batchsz = -1);

protected:
  std::shared_ptr<DpuController> dpu_controller_;
  //std::vector<vart::TensorBuffer*> in_bufs;
  //std::vector<vart::TensorBuffer*> out_bufs;
};
}
/*

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
*/

extern "C" {
  vart::Runner* create_runner(const xir::Subgraph* subgraph);
  vart::Runner* create_runner_with_attrs(const xir::Subgraph* subgraph, xir::Attrs* attrs);
}
