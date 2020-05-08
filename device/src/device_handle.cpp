#include "device_handle.hpp"
#include <memory>

DeviceHandle::DeviceHandle() {
  client_.reset(new butler::ButlerClient()); 
  if (client_->Ping() != butler::errCode::SUCCESS)
  {
    std::cerr << "cannot ping butler server" << std::endl;
    throw;
  }
}

DeviceHandle::~DeviceHandle() {
  if (client_.get() && obj_.get())
    client_->releaseResources(obj_->butler_handle);
}

void DeviceHandle::acquire(std::string xclbin) {
  
}
