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
  std::vector<const xir::vart::Tensor*> get_input_tensors(); 
  std::vector<const xir::vart::Tensor*> get_output_tensors(); 
  std::vector<xir::vart::TensorBuffer*> get_inputs(unsigned id=0);
  std::vector<xir::vart::TensorBuffer*> get_outputs(unsigned id=0);

 private:
  std::unique_ptr<OclDeviceBuffer> alloc(void *hptr, size_t sz, cl_mem_flags flags);
  void upload(OclDeviceBuffer*);
  void download(OclDeviceBuffer*);
  void execute(OclDeviceBuffer *in, OclDeviceBuffer *out);

  OclDeviceHandle handle_;
  std::vector<std::vector<xir::vart::TensorBuffer*>> inbufs_;
  std::vector<std::vector<xir::vart::TensorBuffer*>> outbufs_;
  std::vector<std::unique_ptr<xir::vart::TensorBuffer>> tbs_;
  std::unordered_map<xir::vart::TensorBuffer*, 
                     std::unique_ptr<OclDeviceBuffer>> tbuf2obuf_;
};
