#include "device_handle.hpp"
#include "xrt_bin_stream.hpp"
#include <fstream>
#include <memory>

static uint64_t getDDRBankFromButlerBitmask(unsigned bitmask)
{
  const int numBits = sizeof(bitmask) * CHAR_BIT;
  for (int i=0; i < numBits; i++)
    if (bitmask & (1 << i))
      return i;

  throw std::runtime_error("Error: unknown ddr_bank config");
}

DeviceHandle::DeviceHandle(std::string kernelName, std::string xclbin) {
  client_.reset(new butler::ButlerClient()); 
  if (client_->Ping() != butler::errCode::SUCCESS)
    throw std::runtime_error("Error: cannot ping butler server");

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
    .xdev = xcu.getXDev(),
    .fingerprint = 0,
  });

  handle_.reset(new butler::handle(alloc.myHandle));
}

DeviceHandle::~DeviceHandle() {
  if (client_.get() && handle_.get())
    client_->releaseResources(*handle_);
}

/* 
 * XCL device handle
 */

XclDeviceHandle::XclDeviceHandle(std::string kernelName, std::string xclbin) 
 : DeviceHandle(kernelName, xclbin),
   context_(nullptr), commands_(nullptr), program_(nullptr) {
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

XclDeviceHandle::~XclDeviceHandle() {
  if (program_)
    clReleaseProgram(program_);
  if (commands_)
    clReleaseCommandQueue(commands_);
  if (context_)
    clReleaseContext(context_);
}

/* 
 * XRT device handle
 */

XrtDeviceHandle::XrtDeviceHandle(std::string kernelName, std::string xclbin) 
: DeviceHandle(kernelName, xclbin) {
  auto handle = xclOpen(get_device_info().device_index, NULL, XCL_INFO);
  std::string fnm = std::string(get_device_info().xclbin_path);
  xir::XrtBinStream binstream(fnm); 
  binstream.burn(handle);
  xclClose(handle);

  uuid_ = binstream.get_uuid();
  xhandle_ = xclOpen(get_device_info().device_index, NULL, XCL_INFO);
  auto ret = xclOpenContext(xhandle_, &uuid_[0], get_device_info().cu_index, true);
  if (ret)
    throw std::runtime_error("Error: xclOpenContext failed");
}

XrtDeviceHandle::~XrtDeviceHandle() {
  xclCloseContext(xhandle_, &uuid_[0], get_device_info().cu_index);
  xclClose(xhandle_);
}
