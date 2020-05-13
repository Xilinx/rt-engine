#pragma once

/*
 * Reference: vart/xrt-device-handle/src/xrt_device_handle_butler.hpp
 */

#include <string>
#include <memory>
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
  uint32_t fingerprint;
};

class DeviceHandle {
 public:
  DeviceHandle();
  ~DeviceHandle();
  virtual void acquire(std::string kernelName, std::string xclbin);
  const DeviceInfo& get_device_info() const { return *info_; }

 private:
  std::unique_ptr<DeviceInfo> info_;
  std::unique_ptr<butler::handle> handle_;
  std::unique_ptr<butler::ButlerClient> client_;
};

class OclDeviceHandle : public DeviceHandle {
 public:
  virtual void acquire(std::string kernelName, std::string xclbin) override;
  const cl_context& get_context() const { return context_; }
  const cl_command_queue& get_command_queue() const { return commands_; }
  const cl_program& get_program() const { return program_; }
  
 private:
  cl_context context_;
  cl_command_queue commands_;
  cl_program program_;
};

