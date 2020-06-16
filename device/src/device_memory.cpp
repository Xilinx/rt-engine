#include "device_memory.hpp"

DeviceBuffer::DeviceBuffer(const DeviceHandle *handle, const xir::vart::TensorBuffer *tbuf, unsigned bank) 
 : handle_(handle), tbuf_(tbuf), bank_(bank), size_(0), phys_addr_(0)
{
  static const size_t dataSize = xir::vart::size_of(tbuf->get_tensor()->get_data_type());
  if (dataSize == 0)
    throw std::runtime_error("Error: cannot alloc device buffer -- unknown datatype");

  size_ = tbuf->get_tensor()->get_element_num() * dataSize;
}

/*
 * XclDeviceBuffer
 */

XclDeviceBuffer::XclDeviceBuffer(const XclDeviceHandle *handle, xir::vart::TensorBuffer *tbuf, unsigned bank) 
 : DeviceBuffer(handle, tbuf, bank) {
  static const std::vector<unsigned> ddrBankMap = {
    XCL_MEM_DDR_BANK0,
    XCL_MEM_DDR_BANK1,
    XCL_MEM_DDR_BANK2,
    XCL_MEM_DDR_BANK3
  };
  cl_mem_ext_ptr_t cfg;
  cfg.flags = ddrBankMap[bank_];
  cfg.obj = (void*)tbuf->data().first;
  cfg.param = 0;

  const auto flags = CL_MEM_READ_WRITE;
  cl_mem_flags memFlags = flags | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR;
  mem_ = clCreateBuffer(handle->get_context(), memFlags, size_, &cfg, NULL);
  if (mem_ == 0)
    throw std::runtime_error("Error: failed to allocate device buffer");

  // initialize memory
  cl_event events[2];
  int err = clEnqueueMigrateMemObjects(handle->get_command_queue(), 1, &mem_,
    CL_MIGRATE_MEM_OBJECT_CONTENT_UNDEFINED, 0, NULL, &events[0]);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: failed to reset device buffer");
  err = clEnqueueWriteBuffer(handle->get_command_queue(), mem_, CL_TRUE,
      0, size_, cfg.obj, 0, NULL, &events[1]);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: failed to init device buffer");
  clWaitForEvents(2, &events[0]);

  xclGetMemObjDeviceAddress(
    mem_, handle->get_device_info().device_id, sizeof(phys_addr_), &phys_addr_);
}

void XclDeviceBuffer::upload() const {
  auto myHandle = dynamic_cast<const XclDeviceHandle*>(handle_);
  cl_event event;
  int err = clEnqueueMigrateMemObjects(myHandle->get_command_queue(), 
    1, &mem_, 
    0, // do migration from host
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: upload to device failed");
  clWaitForEvents(1, &event);
}

void XclDeviceBuffer::download() const {
  auto myHandle = dynamic_cast<const XclDeviceHandle*>(handle_);
  cl_event event;
  int err = clEnqueueMigrateMemObjects(myHandle->get_command_queue(), 
    1, &mem_, 
    CL_MIGRATE_MEM_OBJECT_HOST, 
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: download from device failed");
  clWaitForEvents(1, &event);
}

XclDeviceBuffer::~XclDeviceBuffer() {
  clReleaseMemObject(mem_);
}

/*
 * XrtDeviceBuffer
 */
XrtDeviceBuffer::XrtDeviceBuffer(const XrtDeviceHandle *handle, xir::vart::TensorBuffer *tbuf, unsigned bank) 
 : DeviceBuffer(handle, tbuf, bank) {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  mem_ = xclAllocUserPtrBO(
    myHandle->get_dev_handle(), (void*)tbuf->data().first, size_, bank_);

  xclBOProperties p;
  xclGetBOProperties(myHandle->get_dev_handle(), mem_, &p);
  phys_addr_ = p.paddr;
}

void XrtDeviceBuffer::upload() const {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  xclSyncBO(myHandle->get_dev_handle(), mem_, XCL_BO_SYNC_BO_TO_DEVICE, size_, 0);
}

void XrtDeviceBuffer::download() const {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  xclSyncBO(myHandle->get_dev_handle(), mem_, XCL_BO_SYNC_BO_FROM_DEVICE, size_, 0);
}

XrtDeviceBuffer::~XrtDeviceBuffer() {
  auto myHandle = dynamic_cast<const XrtDeviceHandle*>(handle_);
  xclFreeBO(myHandle->get_dev_handle(), mem_);
}
