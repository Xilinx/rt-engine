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

/*
 * Reference: vart/xrt-device-handle/src/xrt_device_handle_butler.hpp
 */
#include <array>
#include <map>
#include <unordered_map>
#include <mutex>
#include <memory>
#include <string>
#include <xrt.h>
#include "xir/attrs/attrs.hpp"

#include <experimental/xrt-next.h>
#include <xrt/xrt_kernel.h>
#include <experimental/xrt_ip.h>
#include <UniLog/UniLog.hpp>

namespace xir {
//class Subgraph;
class Attrs;
}  // namespace xir

struct DeviceInfo {
  uint64_t cu_base_addr;
  uint64_t ddr_bank;
  size_t device_index;
  size_t cu_index;
  unsigned int cu_mask;
  std::string xclbin_path;
  std::string full_name;
  std::string kernel_name;
  xclDeviceHandle device_handle;
  unsigned char*  uuid;
  uint32_t fingerprint;
};

// Define resource Types
// Each type of resource will be acquired in a different way
enum class ResourceType {DEVICE, XRM, IPU};

/*
 * DeviceResource acquires/releases resource & populates DeviceInfo
 */
class DeviceResource {
 public:
  DeviceResource(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  DeviceResource() {}
  virtual ~DeviceResource();
  const DeviceInfo& get_device_info() const { return *info_; }
  unsigned char* get_uuid() { return &uuid_[0]; }

 protected:
  std::unique_ptr<DeviceInfo> info_;
  std::array<unsigned char, sizeof(xuid_t)> uuid_;
};

// Dummy Class
// Do Nothing
class IpuResource : public DeviceResource {
public:
  IpuResource(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  ~IpuResource();
};
/* 
 * DeviceHandle holds a DeviceResource
 * Derived classes add convenience functions for XRT API layer
 */

class DeviceHandle {
 public:
  DeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs, ResourceType type = ResourceType::XRM );
  virtual ~DeviceHandle() {}
  const DeviceInfo& get_device_info() const { return resource_->get_device_info(); }

 private:
  void raw_acquire(std::string kernelName, std::string xclbin);
  std::unique_ptr<DeviceResource> resource_;
  DeviceHandle() = delete;
};

class XrtContext;

class XrtDeviceHandle : public DeviceHandle {
 public:
  XrtDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  virtual ~XrtDeviceHandle();

  // a convenience context for basic work 
  // IMPORTANT: each worker thread must alloc its own context for exec()/wait()
  const XrtContext& get_context() const { return *context_; }
  
 private:
  std::unique_ptr<XrtContext> context_;
};

class XrtNativeContext;
class XrtNativeDeviceHandle : public DeviceHandle {
 public:
  XrtNativeDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  virtual ~XrtNativeDeviceHandle();

  // a convenience context for basic work 
  // IMPORTANT: each worker thread must alloc its own context for exec()/wait()
  const XrtNativeContext& get_context() const { return *context_; }
  xrt::uuid get_uuid()  {return uuid_;}
  xrt::device get_device() {return device_;}
 private:
  std::unique_ptr<XrtNativeContext> context_;
  xrt::uuid uuid_;
  xrt::device device_;
};

class XrtNativeContext {
 // must create a separate XrtNativeContext for each hostcode worker thread
 public: 
  XrtNativeContext(XrtNativeDeviceHandle &);
  virtual ~XrtNativeContext();
  xrt::kernel get_dev_kernel() const { return kernel_; }
  xrt::device get_dev_device() const { return device_; }

 private:
  XrtNativeContext() = delete;
  XrtNativeContext(const XrtNativeContext &) = delete;

  XrtNativeDeviceHandle &handle_;
  xrt::kernel kernel_;
  xrt::device device_;
};

class XrtContext {
 // must create a separate XrtContext for each hostcode worker thread
 public: 
  XrtContext(XrtDeviceHandle &);
  virtual ~XrtContext();
  xclDeviceHandle get_dev_handle() const { return dev_handle_; }
  xclBufferHandle get_bo_handle() const { return bo_handle_; }
  void *get_bo_addr() { return bo_addr_; }

 private:
  XrtContext() = delete;
  XrtContext(const XrtContext &) = delete;

  XrtDeviceHandle &handle_;
  xclDeviceHandle dev_handle_;
  xclBufferHandle bo_handle_;
  void *bo_addr_;
};

class IpuDeviceHandle : public DeviceHandle {
public:
  IpuDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  virtual ~IpuDeviceHandle();
};

class KernelNameManager {
  public:
    ~KernelNameManager() { }
    static KernelNameManager &getInstance() {
      static KernelNameManager instance;
      return instance;
    }
    std::string getRealKernelName(std::string xclbinPath, std::string kernelName);
  private:
    KernelNameManager() {};
    std::unordered_map<std::string, unsigned > xclbin2usedCuIdx;
};

