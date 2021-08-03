// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

class IpuDeviceBuffer : public DeviceBuffer {
 public:
  IpuDeviceBuffer(const IpuDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  IpuDeviceBuffer(const IpuDeviceHandle *handle, void *data, size_t size, unsigned bank);
  ~IpuDeviceBuffer();
  void upload() const override;
  void download() const override;
  void sync_for_read(uint64_t offset, size_t size) override;
  void sync_for_write(uint64_t offset, size_t size) override;
  void copy_from_host(const void* buf, size_t size, size_t offset) override;
  void copy_to_host(void* buf, size_t size, size_t offset) override;

 private:
  xclBufferHandle mem_;
};
