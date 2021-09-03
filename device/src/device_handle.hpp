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
#include <map>
#include <unordered_map>
#include <mutex>
#include <memory>
#include <string>
#include <xrt.h>
#include <CL/opencl.h>
#include "xir/attrs/attrs.hpp"

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
  cl_device_id device_id;
  xclDeviceHandle device_handle;
  xrt_device *xdev;
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

class XclDeviceHandle : public DeviceHandle {
 public:
  XclDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  virtual ~XclDeviceHandle();
  const cl_context& get_context() const { return context_; }
  const cl_command_queue& get_command_queue() const { return commands_; }
  const cl_program& get_program() const { return program_; }
  
 private:
  cl_context context_;
  cl_command_queue commands_;
  cl_program program_;

  // use_count_ map used to track how many runners are assigned
  //   to a given (xrt_device, cu_index) pair.
  //   Because it is static, it is shared state across threads, and must be protected by a mutex
  static std::map<std::pair<xrt_device*,size_t>, size_t> use_count_;
  static std::mutex use_count_mutex_;
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

class IpuContext;
class IpuDeviceHandle : public DeviceHandle {
public:
  IpuDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  virtual ~IpuDeviceHandle();

  // a convenience context for basic work
  // IMPORTANT: each worker thread must alloc its own context for exec()/wait()
  const IpuContext& get_context() const { return *context_; }
  unsigned char* get_uuid() { return &uuid_[0]; }

private:
  std::unique_ptr<IpuContext> context_;
  std::array<unsigned char, sizeof(xuid_t)> uuid_;
};

class IpuContext {
  // must create a separate IpuContext for each hostcode worker thread
public:
  IpuContext(IpuDeviceHandle &);
  virtual ~IpuContext();
  xclDeviceHandle get_dev_handle() const { return dev_handle_; }
  xclBufferHandle get_bo_handle() const { return bo_handle_; }
  void *get_bo_addr() { return bo_addr_; }

private:
  IpuContext() = delete;
  IpuContext(const IpuContext &) = delete;

  IpuDeviceHandle &handle_;
  xclDeviceHandle dev_handle_;
  xclBufferHandle bo_handle_;
  void *bo_addr_;
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
    unordered_map<std::string, unsigned > xclbin2usedCuIdx;
};

