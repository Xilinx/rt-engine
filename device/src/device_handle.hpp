#pragma once

/*
 * Reference: vart/xrt-device-handle/src/xrt_device_handle_butler.hpp
 */

#include <string>
#include <memory>
#include <xrt.h>
#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "butler_client.h"
#include "butler_dev.h"
#pragma GCC diagnostic pop 

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

class DeviceHandle {
 public:
  DeviceHandle(std::string kernelName, std::string xclbin);
  virtual ~DeviceHandle();
  const DeviceInfo& get_device_info() const { return *info_; }

 private:
  std::unique_ptr<DeviceInfo> info_;
  std::unique_ptr<butler::handle> handle_;
  std::unique_ptr<butler::ButlerClient> client_;
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
