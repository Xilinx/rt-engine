#pragma once

#include <unordered_map>
#include <mutex>
#include <list>
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
  DpuController(std::string meta, xir::Attrs* attrs) {}
  DpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs) {}
  virtual ~DpuController() {}
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) = 0;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const = 0; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const = 0; 
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) = 0;
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) = 0;
  virtual std::vector<float> get_input_scale() = 0;
  virtual std::vector<float> get_output_scale() = 0;

 private:
  DpuController() = delete;
};

template <class Dhandle, class DbufIn, class DbufOut>
class XclDpuController : public DpuController {
 public:
  XclDpuController(std::string meta, xir::Attrs* attrs=nullptr);
  XclDpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs=nullptr);
  virtual ~XclDpuController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override;
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override;
  virtual std::vector<float> get_input_scale() override;
  virtual std::vector<float> get_output_scale() override;

 protected:
  virtual std::vector<vart::TensorBuffer*> create_tensor_buffers(
    const std::vector<const xir::Tensor*> &tensors, bool isInput, int ddrBank=-1);
  virtual void free_tensor_buffers(std::vector<vart::TensorBuffer*>&);
  DeviceBuffer *get_device_buffer(vart::TensorBuffer *tb);

  std::unique_ptr<Dhandle> handle_;
  std::list<std::unique_ptr<vart::TensorBuffer>> tbufs_;
  std::unordered_map<vart::TensorBuffer*, std::unique_ptr<DeviceBuffer>> tbuf2dbuf_;
  std::mutex tbuf_mtx_;
private:
  std::unique_ptr<xir::Attrs> default_attrs_;
};

class SampleDpuController 
 : public XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer> {
 public:
  SampleDpuController(std::string meta, xir::Attrs* attrs=nullptr);
  SampleDpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs=nullptr);
  virtual ~SampleDpuController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;

 private:
  virtual void execute(XclDeviceBuffer *in, XclDeviceBuffer *out) const;
};
