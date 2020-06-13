#pragma once

#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "CL/cl_ext_xilinx.h"
#pragma GCC diagnostic pop 
#include "tensor_buffer.hpp"
#include "device_handle.hpp"

template <class Dhandle>
class DeviceBuffer {
 public:
  DeviceBuffer(const Dhandle &handle, const xir::vart::TensorBuffer *tbuf, unsigned bank);
  virtual ~DeviceBuffer() {};
  xir::vart::TensorBuffer *get_tensor_buffer() const { return tbuf_; }
  size_t get_size() const { return size_; }
  uint64_t get_phys_addr() const { return phys_addr_; }
  virtual void upload() const = 0;
  virtual void download() const = 0;

 protected: 
  const Dhandle &handle_;
  const xir::vart::TensorBuffer *tbuf_;
  unsigned bank_;
  size_t size_;
  uint64_t phys_addr_;

 private:
  DeviceBuffer() = delete;
};

class XclDeviceBuffer : public DeviceBuffer<XclDeviceHandle> {
 public:
  XclDeviceBuffer(const XclDeviceHandle &handle, xir::vart::TensorBuffer *tbuf, unsigned bank);
  ~XclDeviceBuffer();
  void upload() const override;
  void download() const override;

 private:
  cl_mem mem_;
};

class XrtDeviceBuffer : public DeviceBuffer<XrtDeviceHandle> {
 public:
  XrtDeviceBuffer(const XrtDeviceHandle &handle, xir::vart::TensorBuffer *tbuf, unsigned bank);
  ~XrtDeviceBuffer();
  void upload() const override;
  void download() const override;

 private:
  xclBufferHandle mem_;
};
