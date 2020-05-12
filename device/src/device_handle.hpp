#pragma once

/*
 * Reference: xrt-device-handle/src/xrt_device_handle_butler.hpp
 */

#include <string>
#include <memory>
#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "butler_client.h"
#include "butler_dev.h"
#pragma GCC diagnostic pop 

struct DeviceObject {
  uint64_t cu_base_addr;
  uint64_t ddr_bank;
  size_t cu_index;
  unsigned int cu_mask;
  std::string full_name;
  size_t device_id;
  size_t core_id;
  uint32_t fingerprint;
  butler::handle butler_handle;
};

class DeviceHandle {
 public:
  DeviceHandle();
  ~DeviceHandle();
  void acquire(std::string kernelName, std::string xclbin);
 
 private:
  std::unique_ptr<DeviceObject> obj_;
  std::unique_ptr<butler::ButlerClient> client_;
};
