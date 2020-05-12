#include "device_handle.hpp"
#include <memory>

DeviceHandle::DeviceHandle() {
  client_.reset(new butler::ButlerClient()); 
  if (client_->Ping() != butler::errCode::SUCCESS)
    throw std::runtime_error("Error: cannot ping butler server");
}

DeviceHandle::~DeviceHandle() {
  if (client_.get() && obj_.get())
    client_->releaseResources(obj_->butler_handle);
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
    std::cerr << alloc << std::endl;
    throw std::runtime_error("Error: could not acquire device handle");
  }
  std::cout << "Device acquired" << std::endl << alloc << std::endl;

  auto xcu = acquireResult.second[0];
  auto cu_full_name = xcu.getKernelName() + ":" + xcu.getName() + ":" +
    std::to_string(xcu.getFPGAIdx()) + ":" + std::to_string(xcu.getCUIdx());

  obj_.reset(new DeviceObject{
    .cu_base_addr = xcu.getBaseAddr(),
    .ddr_bank = getDDRBankFromButlerBitmask(xcu.getKernelArgMemIdxMapAt(0)),
    .cu_index = size_t(xcu.getCUIdx()),
    .cu_mask = (1u << xcu.getCUIdx()),
    .full_name = cu_full_name,
    .device_id = size_t(xcu.getFPGAIdx()),
    .core_id = size_t(xcu.getCUIdx()),
    .fingerprint = 0,
    .butler_handle = alloc.myHandle
  });
}
