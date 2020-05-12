#pragma once

#include "device_handle.hpp"

/*
 * xrt-device-handle/src/xrt_device_handle_butler.cpp
 * xir::XrtDeviceHandle acquires resource
 *
 * auto xrt_cu = std::make_unique<xir::XrtCu>(std::string{"dpu"});
 * return std::make_shared<DpuControllerXrtCloud>(std::move(xrt_cu));
 * xrt_cu creates/holds xir::XrtDeviceHandle 
 *
 * Make buffers for host_ptr, sz, ddr_bank
 * auto-manage buffers -- free if exceed total_memory/num_buffers limit
 * LRU displace buffers?
 *
 * mem = makeFpgaBuffer(host_ptr, sz, ddr_bank, rw)
 * mem.transfer()
 * mem.get_fpga_addr()
 * mem.get_host_ptr()
 *
 */

class DpuController {
 public:
  DpuController(std::string meta);
  ~DpuController();
  void run(void *in_ptr, void *out_ptr);

 private:
  // alloc()
  // upload()
  // download()
  // execute()
  DeviceHandle handle_;
};
