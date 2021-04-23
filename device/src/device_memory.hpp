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
  DeviceBuffer(const DeviceHandle *handle, void *data, size_t size, unsigned bank);
  virtual ~DeviceBuffer() {};
  vart::TensorBuffer *get_tensor_buffer() const { return tbuf_; }
  size_t get_size() const { return size_; }
  uint64_t get_phys_addr() const { return phys_addr_; }
  unsigned get_bank() const { return bank_; }
  virtual void upload() const = 0;
  virtual void download() const = 0;

  /**
   * @brief Invalid cache for reading Before read, it is no-op 
   * in case get_location() returns DEVICE_ONLY or HOST_VIRT.
   * @param The start offset address.
   * @param The data size.
   */
  virtual void sync_for_read(uint64_t offset, size_t size) = 0;
  /**
   * @brief Flush cache for writing after write, it is no-op
   * in case get_location() returns DEVICE_ONLY or HOST_VIRT.
   * @param The start offset address.
   * @param The data size.
   */
  virtual void sync_for_write(uint64_t offset, size_t size) = 0;
  /**
   * @brief copy data from source buffer.
   * @param source buffer start address.
   * @param data size to be copied.
   * @param the start offset to be copied.
   */
  virtual void copy_from_host(const void* buf, size_t size, size_t offset) = 0;
  /**
   * @brief copy data to destination buffer.
   * @param destination buffer start address.
   * @param data size to be copied.
   * @param the start offset to be copied.
   */
  virtual void copy_to_host(void* buf, size_t size, size_t offset) = 0;

 protected: 
  const DeviceHandle *handle_;
  vart::TensorBuffer *tbuf_;
  unsigned bank_;
  size_t size_;
  uint64_t phys_addr_;
  void *data_;

 private:
  DeviceBuffer() = delete;
};

class XclDeviceBuffer : public DeviceBuffer {
 public:
  XclDeviceBuffer(const XclDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  XclDeviceBuffer(const XclDeviceHandle *handle, void *data, size_t size, unsigned bank);
  ~XclDeviceBuffer();
  void upload() const override;
  void download() const override;
  void sync_for_read(uint64_t offset, size_t size) override;
  void sync_for_write(uint64_t offset, size_t size) override;
  void copy_from_host(const void* buf, size_t size, size_t offset) override;
  void copy_to_host(void* buf, size_t size, size_t offset) override;

 private:
  cl_mem mem_;
};

class XrtDeviceBuffer : public DeviceBuffer {
 public:
  XrtDeviceBuffer(const XrtDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  XrtDeviceBuffer(const XrtDeviceHandle *handle, void *data, size_t size, unsigned bank);
  ~XrtDeviceBuffer();
  void upload() const override;
  void download() const override;
  void sync_for_read(uint64_t offset, size_t size) override;
  void sync_for_write(uint64_t offset, size_t size) override;
  void copy_from_host(const void* buf, size_t size, size_t offset) override;
  void copy_to_host(void* buf, size_t size, size_t offset) override;

 private:
  xclBufferHandle mem_;
};
