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

#include "device_memory_native.hpp"
#include<cmath>


/*
 * XrtNativeDeviceBuffer
 */
XrtNativeDeviceBuffer::XrtNativeDeviceBuffer(const XrtNativeDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank) 
 : DeviceBuffer(handle, tbuf, bank) {
  auto myHandle = dynamic_cast<const XrtNativeDeviceHandle*>(handle_);
  auto device = myHandle->get_context().get_dev_device();
  bo_ = xrt::bo(device, (void*)tbuf->data().first, size_, bank_);
  phys_addr_ = bo_.address();
}

XrtNativeDeviceBuffer::XrtNativeDeviceBuffer(const XrtNativeDeviceHandle *handle, void *data, size_t size, unsigned bank)
  : DeviceBuffer(handle, data, size, bank) {
  auto myHandle = dynamic_cast<const XrtNativeDeviceHandle*>(handle_);
  auto device = myHandle->get_context().get_dev_device();
  bo_ = xrt::bo(device, data, size, bank);
  phys_addr_ = bo_.address();
}

void XrtNativeDeviceBuffer::upload() const {
  //bo_.sync(XCL_BO_SYNC_BO_TO_DEVICE);
}

void XrtNativeDeviceBuffer::download() const {
  //bo_.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
}

void XrtNativeDeviceBuffer::sync_for_read(uint64_t offset, size_t size) {
  bo_.sync(XCL_BO_SYNC_BO_FROM_DEVICE, size, offset);
}

void XrtNativeDeviceBuffer::sync_for_write(uint64_t offset, size_t size) {
  bo_.sync(XCL_BO_SYNC_BO_TO_DEVICE, size, offset);
}

void XrtNativeDeviceBuffer::copy_from_host(const void* buf, size_t size, size_t offset) {
  bo_.write(buf, size, offset);
  bo_.sync(XCL_BO_SYNC_BO_TO_DEVICE, size, offset);
}

void XrtNativeDeviceBuffer::copy_to_host(void* buf, size_t size, size_t offset) {
  bo_.sync(XCL_BO_SYNC_BO_FROM_DEVICE, size, offset);
  bo_.read(buf, size, offset);
}

XrtNativeDeviceBuffer::~XrtNativeDeviceBuffer() {
}

