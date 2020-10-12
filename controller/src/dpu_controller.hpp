#pragma once

#include <unordered_map>
#include <mutex>
#include <vector>
#include "vart/runner.hpp"
//#include "tensor_buffer.hpp"
#include "device_handle.hpp"
#include "device_memory.hpp"

/*
 * DPU-specific hostcode
 */

class DpuController {
 public:
  DpuController(std::string meta) {}
  DpuController(const xir::Subgraph *subgraph) {}
  virtual ~DpuController() {}
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) = 0;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const = 0; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const = 0; 
  virtual std::vector<vart::TensorBuffer*> get_inputs() = 0;
  virtual std::vector<vart::TensorBuffer*> get_outputs() = 0;

 private:
  DpuController() = delete;
};

template <class Dhandle, class DbufIn, class DbufOut>
class XclDpuController : public DpuController {
 public:
  XclDpuController(std::string meta);
  XclDpuController(const xir::Subgraph *subgraph);
  virtual ~XclDpuController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs() override;
  virtual std::vector<vart::TensorBuffer*> get_outputs() override;

 protected:
  virtual std::vector<vart::TensorBuffer*> create_tensor_buffers(
    const std::vector<const xir::Tensor*> &tensors, bool isInput=true);
  DeviceBuffer *get_device_buffer(vart::TensorBuffer *tb);

  std::unique_ptr<Dhandle> handle_;
  std::vector<std::unique_ptr<vart::TensorBuffer>> tbufs_;
  std::vector<std::unique_ptr<vart::TensorBuffer>> input_tensor_buffers_;
  std::vector<std::unique_ptr<vart::TensorBuffer>> output_tensor_buffers_;
  std::unordered_map<vart::TensorBuffer*, std::unique_ptr<DeviceBuffer>> tbuf2dbuf_;
  std::mutex tbuf_mtx_;
};

class SampleDpuController 
 : public XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer> {
 public:
  SampleDpuController(std::string meta);
  virtual ~SampleDpuController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;

 private:
  virtual void execute(XclDeviceBuffer *in, XclDeviceBuffer *out) const;
};
