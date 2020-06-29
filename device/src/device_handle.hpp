#pragma once

/*
 * Reference: vart/xrt-device-handle/src/xrt_device_handle_butler.hpp
 */

#include <memory>
#include <string>
#include <xrt.h>
#include <CL/opencl.h>

namespace butler {
  class ButlerClient;
}
class xrmCuProperty;
class xrmCuResource;

struct DeviceInfo {
  uint64_t cu_base_addr;
  uint64_t ddr_bank;
  size_t device_index;
  size_t cu_index;
  unsigned int cu_mask;
  std::string xclbin_path;
  std::string full_name;
  cl_device_id device_id;
  xrt_device *xdev;
  uint32_t fingerprint;
};

/* 
 * DeviceResource acquires/releases resource & populates DeviceInfo
 */
class DeviceResource {
 public:
  DeviceResource(std::string kernelName, std::string xclbin);
  DeviceResource() {}
  virtual ~DeviceResource() {}
  const DeviceInfo& get_device_info() const { return *info_; }

 protected:
  std::unique_ptr<DeviceInfo> info_;
};

class ButlerResource : public DeviceResource {
 public:
  ButlerResource(std::string kernelName, std::string xclbin);
  ~ButlerResource();

 private:
  unsigned int handle_;
  std::unique_ptr<butler::ButlerClient> client_;
};

class XrmResource : public DeviceResource {
 public:
  XrmResource(std::string kernelName, std::string xclbin);
  ~XrmResource();

 private:
  void *context_;
  std::unique_ptr<xrmCuProperty> cu_prop_;
  std::unique_ptr<xrmCuResource> cu_rsrc_;
};

/* 
 * DeviceHandle holds a DeviceResource
 * Derived classes add convenience functions for XRT API layer
 */

class DeviceHandle {
 public:
  DeviceHandle(std::string kernelName, std::string xclbin);
  virtual ~DeviceHandle() {}
  const DeviceInfo& get_device_info() const { return resource_->get_device_info(); }

 private:
  void raw_acquire(std::string kernelName, std::string xclbin);
  std::unique_ptr<DeviceResource> resource_;
  DeviceHandle() = delete;
};

class XclDeviceHandle : public DeviceHandle {
 public:
  XclDeviceHandle(std::string kernelName, std::string xclbin);
  virtual ~XclDeviceHandle();
  const cl_context& get_context() const { return context_; }
  const cl_command_queue& get_command_queue() const { return commands_; }
  const cl_program& get_program() const { return program_; }
  
 private:
  cl_context context_;
  cl_command_queue commands_;
  cl_program program_;
};

class XrtDeviceHandle : public DeviceHandle {
 public:
  XrtDeviceHandle(std::string kernelName, std::string xclbin);
  virtual ~XrtDeviceHandle();
  const xclDeviceHandle& get_dev_handle() const { return xhandle_; }
  
 private:
  xclDeviceHandle xhandle_;
  std::array<unsigned char, sizeof(xuid_t)> uuid_;
};