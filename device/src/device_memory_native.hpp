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

#include "xir/tensor/tensor.hpp"
#include "device_handle.hpp"
#include "device_memory.hpp"
#include "vart/tensor_buffer.hpp"

class XrtNativeDeviceBuffer : public DeviceBuffer {
 public:
  XrtNativeDeviceBuffer(const XrtNativeDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank);
  XrtNativeDeviceBuffer(const XrtNativeDeviceHandle *handle, void *data, size_t size, unsigned bank);
  ~XrtNativeDeviceBuffer();
  void upload() const override;
  void download() const override;
  void sync_for_read(uint64_t offset, size_t size) override;
  void sync_for_write(uint64_t offset, size_t size) override;
  void copy_from_host(const void* buf, size_t size, size_t offset) override;
  void copy_to_host(void* buf, size_t size, size_t offset) override;
  
 private:
  xrt::bo bo_;
};

