#include "device_memory.hpp"

OclDeviceBuffer::OclDeviceBuffer(const OclDeviceHandle &handle, void *host_ptr, size_t size, unsigned bank, cl_mem_flags flags) 
 : host_ptr_(host_ptr), size_(size), bank_(bank) {
  cl_mem_ext_ptr_t cfg;
  cfg.flags = bank_;
  cfg.obj = host_ptr_;
  cfg.param = 0;

  cl_mem_flags memFlags = flags | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR;
  mem_ = clCreateBuffer(handle.get_context(), memFlags, size_, &cfg, NULL);
  if (mem_ == 0)
    throw std::runtime_error("Error: failed to allocate device buffer");

  if (flags == CL_MEM_WRITE_ONLY) {
    // initialize memory
    cl_event event;
    int err = clEnqueueMigrateMemObjects(handle.get_command_queue(), 1, &mem_,
      CL_MIGRATE_MEM_OBJECT_CONTENT_UNDEFINED, 0, NULL, &event);
    if (err != CL_SUCCESS)
      throw std::runtime_error("Error: failed to initialize device buffer");
    clWaitForEvents(1, &event);
  }

  xclGetMemObjDeviceAddress(
    mem_, handle.get_device_info().device_id, sizeof(phys_addr_), &phys_addr_);
}

OclDeviceBuffer::~OclDeviceBuffer() {
  clReleaseMemObject(mem_);
}
