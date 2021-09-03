// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <atomic>
#include <climits>
#include <fstream>
#include <memory>
#include <dirent.h>
#include <iostream>
#include <cstring>
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#pragma GCC diagnostic pop
 
#include <experimental/xrt-next.h>

#include "experimental/xrt++.hpp"
#include "xrt_bin_stream.hpp"
#include "device_handle.hpp"
#include "vitis/ai/env_config.hpp"
#include <glog/logging.h>

DEF_ENV_PARAM(DEBUG_DEVICE_HANDLE, "0")
static std::atomic<bool> naive_resource_mgr_on_(false);
static std::atomic<unsigned> naive_resource_mgr_cu_idx_(0);

static std::mutex g_allocation_lock;


DeviceResource::DeviceResource(std::string kernelName, std::string xclbin, xir::Attrs* attrs) {
  // fallback unmanaged/caveman resource manager
  auto num_devices = xclProbe();
  if (num_devices == 0)
    throw std::runtime_error("Error: no devices available");

  // simulate assigning a new cuIdx each time Controller creates DeviceResource 
  // TODO support multiple devices
  //const int deviceIdx = 0;
  size_t deviceIdx=0;
  // cuIdx is for cu index in xclbin
  // cuIdx_xrt is for cu index from XRT side
  size_t cuIdx=0;
  size_t cuIdx_xrt=0;
  xir::XrtBinStream binstream(xclbin);
  auto handle = xclOpen(deviceIdx, NULL, XCL_INFO);
  static std::unordered_map<size_t,size_t> cuIdxMap;
  cuIdx = naive_resource_mgr_cu_idx_.fetch_add(1);
  if (cuIdx == 0) {
    binstream.burn(handle); // only program if you're the first CU
    for (size_t cucnt = 0; cucnt < binstream.get_num_of_cu(); cucnt++) {
      cuIdx_xrt = xclIPName2Index(handle, binstream.get_cu(cucnt).c_str());
      cuIdxMap.emplace(cuIdx_xrt, cucnt); 
    }
  }
  if (attrs->has_attr("__device_id__")) { 
    auto device_index = attrs->get_attr<size_t>("__device_id__");
    if (device_index > (num_devices-1))
      throw std::runtime_error("Error: no devices available");
    deviceIdx = device_index;
  }
  if (attrs->has_attr("__device_core_id__")) {
    auto cu_index = attrs->get_attr<size_t>("__device_core_id__");
    if (cu_index > (binstream.get_num_of_cu()-1))
      throw std::runtime_error("Error: no CU available");
    cuIdx_xrt = cu_index;
    auto item = cuIdxMap.find(cuIdx_xrt);
    if (item == cuIdxMap.end()) {
      throw std::runtime_error("Error: no CUs available");
    } else {
      cuIdx = item->second;
    }
  } else {
    //seed to make sure rand() is differnet in differnet process 
    srand((int)time(0));
    if (cuIdx > (binstream.get_num_of_cu()-1)) cuIdx = rand()%binstream.get_num_of_cu(); 
    cuIdx_xrt = xclIPName2Index(handle, binstream.get_cu(cuIdx).c_str());
  }
  xclClose(handle);
  naive_resource_mgr_on_ = true;

  if (cuIdx_xrt >= binstream.get_num_of_cu())
    throw std::runtime_error("Error: no CUs available");

  auto cu_full_name = kernelName + ":" 
    + std::to_string(deviceIdx) + ":" + std::to_string(cuIdx_xrt);
  uuid_ = binstream.get_uuid();
  info_.reset(new DeviceInfo{
      .cu_base_addr = binstream.get_cu_base_addr(cuIdx),
      .ddr_bank = 0, // TODO get actual DDR bank
      .device_index = deviceIdx,
      .cu_index = cuIdx_xrt,
      .cu_mask = (1u << cuIdx_xrt),
      .xclbin_path = xclbin,
      .full_name = cu_full_name,
      .device_id = 0,
      .device_handle = nullptr,
      .xdev = nullptr,
      .uuid = get_uuid(),
      .fingerprint = 0,
  });

  int err;
  cl_platform_id platform_id;
  char cl_platform_vendor[1001];
  char cl_platform_name[1001];

  err = clGetPlatformIDs(1, &platform_id, NULL);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: DeviceResource clGetPlatformIDs");

  err = clGetPlatformInfo(platform_id, CL_PLATFORM_VENDOR, 1000,
      (void *)cl_platform_vendor, NULL);
  if (err != CL_SUCCESS) 
    throw std::runtime_error("Error: DeviceResource clGetPlatformInfo");

  err = clGetPlatformInfo(platform_id, CL_PLATFORM_NAME, 1000,
                           (void *) cl_platform_name, NULL);
  if (err != CL_SUCCESS) 
    throw std::runtime_error("Error: DeviceResource clGetPlatformInfo");

  cl_uint numDevices = 0;
  cl_device_id devices[100];
  err = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ACCELERATOR,
      99, &devices[0], &numDevices);
  if (err != CL_SUCCESS) 
    throw std::runtime_error("Error: DeviceResource clGetDeviceIDs");

  info_->device_id = devices[info_->device_index];
  info_->xdev = xclGetXrtDevice(info_->device_id, &err);
	if (err)
    throw(std::runtime_error("Error: DeviceResource failed to get xdev"));
}

DeviceResource::~DeviceResource() {
  if (naive_resource_mgr_on_)
    naive_resource_mgr_cu_idx_--;
}

static const std::string find_kernel_name(std::string name) {
  std::string ret;
  auto pos = name.find_first_of(':');
  if (pos != std::string::npos) {
    ret = name.substr(0, pos);
  }

  return ret;
}

static std::vector<std::string> get_xclbins_in_dir(std::string path) {
  if (path.find(".xclbin") != std::string::npos)
    return {path};

  std::vector<std::string> xclbinPaths;

  DIR *dir;
  struct dirent *ent;
  if ((dir = opendir(path.c_str())) != NULL) {
    /* print all the files and directories within directory */
    while ((ent = readdir(dir)) != NULL) {
      std::string name(ent->d_name);
      if (name.find(".xclbin") != std::string::npos)
        xclbinPaths.push_back(path + "/" + name);
    }
    closedir(dir);
  }

  return xclbinPaths;
}

std::string KernelNameManager::getRealKernelName(std::string xclbinPath, std::string kernelName) {
  xir::XrtBinStream binstream(xclbinPath);
  auto cu_num = binstream.get_num_of_cu();
  std::string realKernelName; 
  for(unsigned int nameIdx=0; nameIdx < cu_num; nameIdx++) { //for TRD if there is other IP with differnet CU name, need to loop 
    if ((binstream.get_cu(nameIdx) == kernelName))
      return kernelName; // exact match
    if ((find_kernel_name(binstream.get_cu(nameIdx))) == kernelName)
      return kernelName; // exact match
    if (xclbin2usedCuIdx.find(xclbinPath) == xclbin2usedCuIdx.end())
      xclbin2usedCuIdx[xclbinPath] = 0;
    auto cuIdx = (xclbin2usedCuIdx[xclbinPath]++ % cu_num);
    auto tmpKernelName = find_kernel_name(binstream.get_cu(cuIdx));
    if(tmpKernelName.find(kernelName) != std::string::npos) { // find correct dpu CU
      realKernelName = tmpKernelName;
      break;
    }
  }
  if (realKernelName.empty()) 
    return kernelName;
  // found matching "real kernel name"
  return realKernelName;
}

///////////////////////////////////////////////

DeviceHandle::DeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs, ResourceType type) {

  if (std::getenv("RTE_ACQUIRE_DEVICE_UNMANAGED") || type == ResourceType::DEVICE) {
    resource_.reset(new DeviceResource(kernelName, xclbin, attrs));
    return;
  }

  if (type == ResourceType::XRM) {
    #ifdef XRM_FOUND
      resource_.reset(new XrmResource(kernelName, xclbin, attrs));
    #else
      resource_.reset(new DeviceResource(kernelName, xclbin, attrs));
    #endif
    return;
  }

  if (type == ResourceType::IPU) {
    std::cout << "Called IPU Resource Allocator" << std::endl;
    resource_.reset(new IpuResource(kernelName, xclbin, attrs));
    return;
  }

  throw std::runtime_error("Error: Unknown Resource Type Requested");
}

/*
 * XCL device handle
 */

// Initialize shared state
std::map<std::pair<xrt_device*,size_t>, size_t> XclDeviceHandle::use_count_;
std::mutex XclDeviceHandle::use_count_mutex_;

XclDeviceHandle::XclDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs)
    : DeviceHandle(kernelName, xclbin, attrs), context_(nullptr), commands_(nullptr),
      program_(nullptr) {

  // Wait turn to run OCL Commands
  std::lock_guard<std::mutex> lockGuard0(g_allocation_lock);

  // create context
  int err;
  context_ =
      clCreateContext(0, 1, &get_device_info().device_id, NULL, NULL, &err);
  if (!context_)
    throw std::runtime_error("Error: failed to create a compute context");

  const int qprop = CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE;
  commands_ =
      clCreateCommandQueue(context_, get_device_info().device_id, qprop, &err);
  if (!commands_)
    throw std::runtime_error("Error: failed to create command queue");

  if (get_device_info().cu_index == 0)
  {
    // read xclbin and create program
    std::string fnm = std::string(get_device_info().xclbin_path);
    std::ifstream stream(fnm);
    stream.seekg(0, stream.end);
    size_t size = stream.tellg();
    stream.seekg(0, stream.beg);
    std::vector<char> xclbinChar(size);
    stream.read(xclbinChar.data(), size);
    auto data = reinterpret_cast<const unsigned char *>(xclbinChar.data());

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

  {
    auto devCU = std::make_pair(get_device_info().xdev,get_device_info().cu_index);
    std::lock_guard<std::mutex> lockGuard(use_count_mutex_);
    if (use_count_.find(devCU) == use_count_.end()) {
      xrtcpp::acquire_cu_context(get_device_info().xdev, get_device_info().cu_index);
      use_count_[devCU] = 1;
    }
    else
      ++use_count_[devCU];
  }
}

XclDeviceHandle::~XclDeviceHandle() {
  {
    auto devCU = std::make_pair(get_device_info().xdev,get_device_info().cu_index);
    std::lock_guard<std::mutex> lockGuard(use_count_mutex_);
    if (use_count_.find(devCU) != use_count_.end() && get_device_info().xdev) {
      xrtcpp::release_cu_context(get_device_info().xdev, get_device_info().cu_index);
      use_count_.erase(devCU);
    }
  }

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

XrtDeviceHandle::XrtDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs)
    : DeviceHandle(kernelName, xclbin, attrs) {
  context_.reset(new XrtContext(*this));
}

XrtDeviceHandle::~XrtDeviceHandle() {
}

/*
 * XRT device context (MUST alloc one for each thread)
 */
XrtContext::XrtContext(XrtDeviceHandle &handle) : handle_(handle) {
  dev_handle_ = xclOpen(handle.get_device_info().device_index, NULL, XCL_INFO);
  auto ret = xclOpenContext(dev_handle_, handle.get_device_info().uuid, 
    handle.get_device_info().cu_index, true);
  if (ret)
    throw std::runtime_error("Error: xclOpenContext failed");
  bo_handle_ = xclAllocBO(dev_handle_, 4096, 0, XCL_BO_FLAGS_EXECBUF);
  bo_addr_ = xclMapBO(dev_handle_, bo_handle_, true);
}

XrtContext::~XrtContext() {
  xclFreeBO(dev_handle_, bo_handle_);
  xclCloseContext(dev_handle_, handle_.get_device_info().uuid, handle_.get_device_info().cu_index);
  xclClose(dev_handle_);
}

/*
 * IPU device handle
 */
IpuDeviceHandle::IpuDeviceHandle(std::string kernelName, std::string xclbin, xir::Attrs* attrs)
  : DeviceHandle(kernelName, xclbin, attrs, ResourceType::IPU) {

  context_ = std::make_unique<IpuContext>(*this);

}

IpuDeviceHandle::~IpuDeviceHandle() = default;

/*
 * IPU device context (MUST alloc one for each thread)
 */
IpuContext::IpuContext(IpuDeviceHandle &handle) : handle_(handle) {

  // Deal with hwemu limitation share single handle for now.
  // dev_handle_ = xclOpen(handle.get_device_info().device_index, NULL, XCL_INFO);
  dev_handle_ = handle_.get_device_info().device_handle;

  // Unclear if I need xclOpenContext for IPU

  //auto ret = xclOpenContext(dev_handle_, handle.get_uuid(),
  //                          handle.get_device_info().cu_index, true);
  //if (ret)
  //  throw std::runtime_error("Error: xclOpenContext failed");
  bo_handle_ = xclAllocBO(dev_handle_, 4096, 0, XCL_BO_FLAGS_EXECBUF);
  bo_addr_ = xclMapBO(dev_handle_, bo_handle_, true);
}

IpuContext::~IpuContext() {
  xclFreeBO(dev_handle_, bo_handle_);
  xclCloseContext(dev_handle_, handle_.get_uuid(), handle_.get_device_info().cu_index);
  xclClose(dev_handle_);
}

IpuResource::IpuResource(std::string kernelName, std::string xclbin, xir::Attrs* attrs) {

  auto num_devices = xclProbe();
  if (num_devices == 0)
    throw std::runtime_error("Error: no devices available");

  size_t deviceIdx=0;
  size_t cuIdx=0;
  
  auto handle = xclOpen(deviceIdx, NULL, XCL_INFO);
  xir::XrtBinStream binstream(xclbin);
  binstream.burn(handle);
  //xclClose(handle); Don't close it for now due to hwemu limitation

  uuid_ = binstream.get_uuid();

  auto cu_full_name = kernelName + ":"
         + std::to_string(deviceIdx) + ":" + std::to_string(cuIdx);

  info_.reset(new DeviceInfo{
    .cu_base_addr = 0,
    .ddr_bank = 0,
    .device_index = deviceIdx,
    .cu_index = cuIdx,
    .cu_mask = (1u << cuIdx),
    .xclbin_path = xclbin,
    .full_name = cu_full_name,
    .device_id = 0,
    .device_handle = handle,
    .xdev = nullptr,
    .uuid = get_uuid(),
    .fingerprint = 0,
  });
}

IpuResource::~IpuResource() {
}
