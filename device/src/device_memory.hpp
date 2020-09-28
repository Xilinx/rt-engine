#pragma once

#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "CL/cl_ext_xilinx.h"
#pragma GCC diagnostic pop 
#include "xir/tensor/tensor.hpp"
#include "vart/runner.hpp"
//#include "tensor_buffer.hpp"
#include "device_handle.hpp"

class DeviceBuffer {
 public:
  DeviceBuffer(const DeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  virtual ~DeviceBuffer() {};
  vart::TensorBuffer *get_tensor_buffer() const { return tbuf_; }
  size_t get_size() const { return size_; }
  uint64_t get_phys_addr() const { return phys_addr_; }
  unsigned get_bank() const { return bank_; }
  virtual void upload() const = 0;
  virtual void download() const = 0;

 protected: 
  const DeviceHandle *handle_;
  vart::TensorBuffer *tbuf_;
  unsigned bank_;
  size_t size_;
  uint64_t phys_addr_;

 private:
  DeviceBuffer() = delete;
};

class XclDeviceBuffer : public DeviceBuffer {
 public:
  XclDeviceBuffer(const XclDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  ~XclDeviceBuffer();
  void upload() const override;
  void download() const override;

 private:
  cl_mem mem_;
};

class XrtDeviceBuffer : public DeviceBuffer {
 public:
  XrtDeviceBuffer(const XrtDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  ~XrtDeviceBuffer();
  void upload() const override;
  void download() const override;

 private:
  xclBufferHandle mem_;
};
