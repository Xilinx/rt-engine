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

template <class TDhandle, class TDbuf>
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
  TDbuf *alloc(xir::vart::TensorBuffer *tb, cl_mem_flags flags);

  std::unique_ptr<TDhandle> handle_;
  std::vector<std::unique_ptr<xir::vart::TensorBuffer>> tbufs_;
  std::unordered_map<xir::vart::TensorBuffer*, std::unique_ptr<TDbuf>> tbuf2dbuf_;
  std::mutex tbuf_mtx_;
};

class SampleDpuController : public XclDpuController<XclDeviceHandle, XclDeviceBuffer> {
 public:
  SampleDpuController(std::string meta);
  virtual ~SampleDpuController() override;
  virtual void run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
      const std::vector<xir::vart::TensorBuffer*> &outputs) override;

 private:
  virtual void upload(XclDeviceBuffer*) const;
  virtual void download(XclDeviceBuffer*) const;
  virtual void execute(XclDeviceBuffer *in, XclDeviceBuffer *out) const;
};
