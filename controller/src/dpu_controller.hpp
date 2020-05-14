#pragma once

#include <vector>
#include "tensor_buffer.hpp"
#include "device_handle.hpp"
#include "device_memory.hpp"

/*
 * xrt-device-handle/src/xrt_device_handle_butler.cpp
 * xir::XrtDeviceHandle acquires resource
 *
 * auto xrt_cu = std::make_unique<xir::XrtCu>(std::string{"dpu"});
 * return std::make_shared<DpuControllerXrtCloud>(std::move(xrt_cu));
 * xrt_cu creates/holds xir::XrtDeviceHandle 
 *
 * Make buffers for host_ptr, sz, ddr_bank
 * auto-manage buffers -- free if exceed total_memory/num_buffers limit
 * LRU displace buffers?
 *
 */

class DpuController {
 public:
  DpuController(std::string meta);
  ~DpuController();
  void run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
           const std::vector<xir::vart::TensorBuffer*> &outputs);
  std::vector<const xir::vart::Tensor*> get_input_tensors() const; 
  std::vector<const xir::vart::Tensor*> get_output_tensors() const; 
  std::vector<xir::vart::TensorBuffer*> get_inputs();
  std::vector<xir::vart::TensorBuffer*> get_outputs();

 private:
  std::vector<xir::vart::TensorBuffer*> 
  create_tensor_buffers(const std::vector<const xir::vart::Tensor*> &tensors);
  OclDeviceBuffer *alloc(xir::vart::TensorBuffer *tb, cl_mem_flags flags);
  void upload(OclDeviceBuffer*) const;
  void download(OclDeviceBuffer*) const;
  void execute(OclDeviceBuffer *in, OclDeviceBuffer *out) const;

  OclDeviceHandle handle_;
  std::vector<std::unique_ptr<xir::vart::TensorBuffer>> tbufs_;
  std::unordered_map<xir::vart::TensorBuffer*, std::unique_ptr<OclDeviceBuffer>> tbuf2dbuf_;
  std::mutex tbuf_mtx_;
};
