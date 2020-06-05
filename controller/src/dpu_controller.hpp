#pragma once

#include <mutex>
#include <vector>
#include "tensor_buffer.hpp"
#include "device_handle.hpp"
#include "device_memory.hpp"

/*
 * DPU-specific hostcode
 */

class DpuController {
 public:
  DpuController(std::string meta) {}
  virtual ~DpuController() {}
  virtual void run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
           const std::vector<xir::vart::TensorBuffer*> &outputs) = 0;
  virtual std::vector<const xir::vart::Tensor*> get_input_tensors() const = 0; 
  virtual std::vector<const xir::vart::Tensor*> get_output_tensors() const = 0; 
  virtual std::vector<xir::vart::TensorBuffer*> get_inputs() = 0;
  virtual std::vector<xir::vart::TensorBuffer*> get_outputs() = 0;

 private:
  DpuController() = delete;
};

class XclDpuController : public DpuController {
 public:
  XclDpuController(std::string meta);
  virtual ~XclDpuController() override;
  virtual void run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
           const std::vector<xir::vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::vart::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::vart::Tensor*> get_output_tensors() const override; 
  virtual std::vector<xir::vart::TensorBuffer*> get_inputs() override;
  virtual std::vector<xir::vart::TensorBuffer*> get_outputs() override;

 protected:
  virtual std::vector<xir::vart::TensorBuffer*> 
    create_tensor_buffers(const std::vector<const xir::vart::Tensor*> &tensors);
  XclDeviceBuffer *alloc(xir::vart::TensorBuffer *tb, cl_mem_flags flags);
  virtual void upload(XclDeviceBuffer*) const;
  virtual void download(XclDeviceBuffer*) const;
  virtual void execute(XclDeviceBuffer *in, XclDeviceBuffer *out) const;

  XclDeviceHandle handle_;
  std::vector<std::unique_ptr<xir::vart::TensorBuffer>> tbufs_;
  std::unordered_map<xir::vart::TensorBuffer*, std::unique_ptr<XclDeviceBuffer>> tbuf2dbuf_;
  std::mutex tbuf_mtx_;
};
