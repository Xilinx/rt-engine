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

#include "device_memory.hpp"
#include<cmath>

DeviceBuffer::DeviceBuffer(const DeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank) 
 : handle_(handle), tbuf_(tbuf), bank_(bank), size_(0), phys_addr_(0)
{
  const size_t dataSize =  std::ceil((tbuf->get_tensor())->get_data_type().bit_width / 8.f);
  UNI_LOG_CHECK(dataSize != 0, VART_DEVICE_BUFFER_ALLOC_ERROR);
  //if (dataSize == 0)
  //  throw std::runtime_error("Error: cannot alloc device buffer -- unknown datatype");

  size_ = tbuf->get_tensor()->get_element_num() * dataSize;
}

DeviceBuffer::DeviceBuffer(const DeviceHandle *handle, void *data, size_t size, unsigned bank)
  : handle_(handle), tbuf_(nullptr), bank_(bank), size_(size), phys_addr_(0), data_(data) {
}

/*
 * XrtDeviceBuffer
 */
XrtDeviceBuffer::XrtDeviceBuffer(const XrtDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank) 
 : DeviceBuffer(handle, tbuf, bank) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  mem_ = xclAllocUserPtrBO(devHandle, (void*)tbuf->data().first, size_, bank_);
  if (mem_ == NULLBO)
    throw std::bad_alloc();

  xclBOProperties p;
  xclGetBOProperties(devHandle, mem_, &p);
  phys_addr_ = p.paddr;
}

XrtDeviceBuffer::XrtDeviceBuffer(const XrtDeviceHandle *handle, void *data, size_t size, unsigned bank)
  : DeviceBuffer(handle, data, size, bank) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  mem_ = xclAllocUserPtrBO(devHandle, data, size, bank);
  if (mem_ == NULLBO)
    throw std::bad_alloc();

  xclBOProperties p;
  xclGetBOProperties(devHandle, mem_, &p);
  phys_addr_ = p.paddr;
}

void XrtDeviceBuffer::upload() const {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  xclSyncBO(devHandle, mem_, XCL_BO_SYNC_BO_TO_DEVICE, size_, 0);
}

void XrtDeviceBuffer::download() const {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  xclSyncBO(devHandle, mem_, XCL_BO_SYNC_BO_FROM_DEVICE, size_, 0);
}

void XrtDeviceBuffer::sync_for_read(uint64_t offset, size_t size) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  xclSyncBO(devHandle, mem_, XCL_BO_SYNC_BO_FROM_DEVICE, size, offset);
}

void XrtDeviceBuffer::sync_for_write(uint64_t offset, size_t size) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  xclSyncBO(devHandle, mem_, XCL_BO_SYNC_BO_TO_DEVICE, size, offset);
}

void XrtDeviceBuffer::copy_from_host(const void* buf, size_t size, size_t offset) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  auto ok = xclUnmgdPwrite(devHandle, 0, buf, size, get_phys_addr() + offset);
  CHECK_EQ(ok, 0);
}

void XrtDeviceBuffer::copy_to_host(void* buf, size_t size, size_t offset) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  auto ok = xclUnmgdPread(devHandle, 0, buf, size, get_phys_addr() + offset);
  CHECK_EQ(ok, 0);
}

XrtDeviceBuffer::~XrtDeviceBuffer() {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  auto devHandle = myHandle->get_context().get_dev_handle();
  xclFreeBO(devHandle, mem_);
}

/*
 * IpuDeviceBuffer
 */
// This is all dummy code to keep the infrastructure happy
IpuDeviceBuffer::IpuDeviceBuffer(const IpuDeviceHandle *handle, size_t size, unsigned int bank)
  : DeviceBuffer(handle, (void*)nullptr, size, bank) {mem_=0;}
IpuDeviceBuffer::IpuDeviceBuffer(const IpuDeviceHandle *handle, vart::TensorBuffer *tbuf, unsigned bank)
 : DeviceBuffer(handle, tbuf, bank) {mem_=0;}
IpuDeviceBuffer::IpuDeviceBuffer(const IpuDeviceHandle *handle, void *data, size_t size, unsigned bank)
  : DeviceBuffer(handle, data, size, bank) {mem_=0;}
void IpuDeviceBuffer::upload() const {}
void IpuDeviceBuffer::download() const {}
void IpuDeviceBuffer::sync_for_read(uint64_t offset, size_t size) {}
void IpuDeviceBuffer::sync_for_write(uint64_t offset, size_t size) {}
void IpuDeviceBuffer::copy_from_host(const void* buf, size_t size, size_t offset) {}
void IpuDeviceBuffer::copy_to_host(void* buf, size_t size, size_t offset) {}
IpuDeviceBuffer::~IpuDeviceBuffer() {}
void *IpuDeviceBuffer::get_data() const {return nullptr;}
