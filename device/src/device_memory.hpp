#pragma once

#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "CL/cl_ext_xilinx.h"
#pragma GCC diagnostic pop 
#include "device_handle.hpp"

class OclDeviceBuffer {
 public:
  OclDeviceBuffer(const OclDeviceHandle &handle, void *host_ptr, size_t size, unsigned bank, cl_mem_flags flags);
  void *get_host_ptr() const { return host_ptr_; }
  const cl_mem& get_mem() const { return mem_; }
  uint64_t get_phys_addr() const { return phys_addr_; }
  ~OclDeviceBuffer();

 private:
  void *host_ptr_;
  size_t size_;
  unsigned bank_;
  uint64_t phys_addr_;
  cl_mem mem_;
};
