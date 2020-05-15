#include "device_handle.hpp"
#include <fstream>
#include <memory>

DeviceHandle::DeviceHandle() {
  client_.reset(new butler::ButlerClient()); 
  if (client_->Ping() != butler::errCode::SUCCESS)
    throw std::runtime_error("Error: cannot ping butler server");
}

DeviceHandle::~DeviceHandle() {
  if (client_.get() && handle_.get())
    client_->releaseResources(*handle_);
}

static uint64_t getDDRBankFromButlerBitmask(unsigned bitmask)
{
  const int numBits = sizeof(bitmask) * CHAR_BIT;
  for (int i=0; i < numBits; i++)
    if (bitmask & (1 << i))
      return i;

  throw std::runtime_error("Error: unknown ddr_bank config");
}


void DeviceHandle::acquire(std::string kernelName, std::string xclbin) {
  std::pair<butler::Alloc, std::vector<butler::xCU>> acquireResult;
  acquireResult = client_->acquireCU(kernelName, xclbin);

  auto alloc = acquireResult.first;
  if (alloc.myErrCode != butler::errCode::SUCCESS)
  {
    //std::cerr << alloc << std::endl;
    throw std::runtime_error("Error: could not acquire device handle");
  }
  //std::cout << "Device acquired" << std::endl << alloc << std::endl;

  auto xcu = acquireResult.second[0];
  auto cu_full_name = xcu.getKernelName() + ":" + xcu.getName() + ":" +
    std::to_string(xcu.getFPGAIdx()) + ":" + std::to_string(xcu.getCUIdx());

  info_.reset(new DeviceInfo{
    .cu_base_addr = xcu.getBaseAddr(),
    .ddr_bank = getDDRBankFromButlerBitmask(xcu.getKernelArgMemIdxMapAt(0)),
    .device_index = size_t(xcu.getFPGAIdx()),
    .cu_index = size_t(xcu.getCUIdx()),
    .cu_mask = (1u << xcu.getCUIdx()),
    .xclbin_path = xcu.getXCLBINPath(),
    .full_name = cu_full_name,
    .device_id = xcu.getOCLDev(),
    .fingerprint = 0,
  });

  handle_.reset(new butler::handle(alloc.myHandle));
}

/* 
 * OCL device handle
 */

OclDeviceHandle::OclDeviceHandle() 
 : context_(nullptr), commands_(nullptr), program_(nullptr) {
}

OclDeviceHandle::~OclDeviceHandle() {
  if (program_ != nullptr)
    clReleaseProgram(program_);
  if (commands_ != nullptr)
    clReleaseCommandQueue(commands_);
  if (context_ != nullptr)
    clReleaseContext(context_);
}

void OclDeviceHandle::acquire(std::string kernelName, std::string xclbin) {
  DeviceHandle::acquire(kernelName, xclbin);

  // create context
  int err;
  context_ = clCreateContext(0, 1, &get_device_info().device_id, NULL, NULL, &err);
  if (!context_)
    throw std::runtime_error("Error: failed to create a compute context");

  const int qprop = CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE;
  commands_ = clCreateCommandQueue(context_, get_device_info().device_id, qprop, &err);
  if (!commands_)
    throw std::runtime_error("Error: failed to create command queue");
 
  // read xclbin and create program
  std::string fnm = std::string(get_device_info().xclbin_path);
  std::ifstream stream(fnm);
  stream.seekg(0,stream.end);
  size_t size = stream.tellg();
  stream.seekg(0,stream.beg);
  std::vector<char> xclbinChar(size);
  stream.read(xclbinChar.data(),size);
  auto data = reinterpret_cast<const unsigned char*>(xclbinChar.data());

  /*
   * Note: the clCreateProgramWithBinary below may emit an error in 2019.x 
   * if the device is already programmed. (This is okay -- we don't want to 
   * reprogram and we can continue using the device with is current program.) 
   * Soren has fixed this in 2020.x to be more forgiving. I.e. allowing multiple 
   * calls to clCreateProgramWithBinary as long as same binary is used. 
   * https://github.com/Xilinx/XRT/pull/3379.  
   * http://jira.xilinx.com/browse/CR-1056085.
   */
  cl_int status = CL_SUCCESS;
  program_ = clCreateProgramWithBinary(
    context_, 1, &get_device_info().device_id, &size, &data, &status, &err);
}
