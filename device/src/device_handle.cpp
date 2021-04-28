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
 
#include <experimental/xrm_experimental.h>

#include "experimental/xrt++.hpp"
#include "xrt_bin_stream.hpp"
#include "device_handle.hpp"
#include "vitis/ai/env_config.hpp"
#include <glog/logging.h>

DEF_ENV_PARAM(DEBUG_DEVICE_HANDLE, "0")
static std::atomic<bool> naive_resource_mgr_on_(false);
static std::atomic<unsigned> naive_resource_mgr_cu_idx_(0);

static std::mutex g_allocation_lock;

DeviceResource::DeviceResource(std::string kernelName, std::string xclbin) {
  // fallback unmanaged/caveman resource manager
  auto num_devices = xclProbe();
  if (num_devices == 0)
    throw std::runtime_error("Error: no devices available");

  // simulate assigning a new cuIdx each time Controller creates DeviceResource 
  // TODO support multiple devices
  const int deviceIdx = 0;
  naive_resource_mgr_on_ = true;
  auto cuIdx = naive_resource_mgr_cu_idx_.fetch_add(1);
  xir::XrtBinStream binstream(xclbin);
  if (cuIdx > (binstream.get_num_of_cu()-1)) cuIdx = rand()%binstream.get_num_of_cu(); 
  if (cuIdx >= binstream.get_num_of_cu())
    throw std::runtime_error("Error: no CUs available");

  auto cu_full_name = kernelName + ":" 
    + std::to_string(deviceIdx) + ":" + std::to_string(cuIdx);

  info_.reset(new DeviceInfo{
      .cu_base_addr = binstream.get_cu_base_addr(cuIdx),
      .ddr_bank = 0, // TODO get actual DDR bank
      .device_index = deviceIdx,
      .cu_index = cuIdx,
      .cu_mask = (1u << cuIdx),
      .xclbin_path = xclbin,
      .full_name = cu_full_name,
      .device_id = 0,
      .xdev = nullptr,
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

XrmResource::XrmResource(std::string kernelName, std::string xclbin)
    : cu_prop_(new xrmCuProperty()), cu_rsrc_(new xrmCuResource()) {
  context_ = xrmCreateContext(XRM_API_VERSION_1);
  if (context_ == NULL)
    throw std::runtime_error("Error: failed to create XRM context");

  if (!xrmIsDaemonRunning(context_))
    throw std::runtime_error("Error: failed to connect to XRM");

  // prepare request
  std::memset(cu_prop_.get(), 0, sizeof(xrmCuProperty));
  std::memset(cu_rsrc_.get(), 0, sizeof(xrmCuResource));
  std::strcpy(cu_prop_->kernelName, std::string(kernelName).c_str());
  std::strcpy(cu_prop_->kernelAlias, "");
  cu_prop_->devExcl = false;

  cu_prop_->requestLoad = 1;

  cu_prop_->poolId = 0; // Allocate CUs from the system pool

  // get available xclbins
  auto xclbins = get_xclbins_in_dir(xclbin);

  for (unsigned i = 0; i < xclbins.size(); i++) 
  {
    // try to load xclbin
    char xclbinPath[XRM_MAX_PATH_NAME_LEN];
    std::strcpy(xclbinPath, xclbins[i].c_str()); // XRM does not take const char* :(
    int err
      = xrmCuAllocLeastUsedWithLoad(context_, cu_prop_.get(), xclbinPath, cu_rsrc_.get()); 
    if (err) {
      naive_resource_mgr_on_ = true;
      std::string fnm = std::string(xclbinPath);
      xir::XrtBinStream binstream(fnm);
      // Try to acquire a new CU from xclbin
      auto cu_num = binstream.get_num_of_cu();
      auto cuIdx = naive_resource_mgr_cu_idx_.fetch_add(1);
      if (cuIdx > (cu_num-1)) cuIdx =  rand() % cu_num;
      auto realKernelName = find_kernel_name(binstream.get_cu(cuIdx));
      if (realKernelName.find(kernelName) != std::string::npos) {
        std::strcpy(cu_prop_->kernelName, std::string(realKernelName).c_str());
        err = xrmCuAllocLeastUsedWithLoad(context_, cu_prop_.get(), xclbinPath, cu_rsrc_.get());
      }
      if (err) {
        naive_resource_mgr_cu_idx_--;
        continue; // keep trying other xclbins
      }
    }
    LOG_IF(INFO, ENV_PARAM(DEBUG_DEVICE_HANDLE))
      << "Device acuqired : "  //
      << cu_rsrc_->xclbinFileName      //
      ;

    //std::cout << "Device acquired " << cu_rsrc_->xclbinFileName << std::endl;

    auto cu_full_name = std::string(cu_prop_->kernelName) + ":" + 
                        std::to_string(cu_rsrc_->deviceId) + ":" +
                        std::to_string(cu_rsrc_->cuId);
    info_.reset(new DeviceInfo{
        .cu_base_addr = cu_rsrc_->baseAddr,
        .ddr_bank = cu_rsrc_->membankId,
        .device_index = size_t(cu_rsrc_->deviceId),
        .cu_index = size_t(cu_rsrc_->cuId),
        .cu_mask = (1u << cu_rsrc_->cuId),
        .xclbin_path = cu_rsrc_->xclbinFileName,
        .full_name = cu_full_name,
        .device_id = nullptr,
        .xdev = nullptr,
        .fingerprint = 0,
    });

    // Wait turn to run OCL Commands
    std::lock_guard<std::mutex> lockGuard0(g_allocation_lock);

    cl_platform_id platform_id;
    char cl_platform_vendor[1001];
    char cl_platform_name[1001];

    err = clGetPlatformIDs(1, &platform_id, NULL);
    if (err != CL_SUCCESS)
      throw std::runtime_error("Error: XrmResource clGetPlatformIDs");

    err = clGetPlatformInfo(platform_id, CL_PLATFORM_VENDOR, 1000,
        (void *)cl_platform_vendor, NULL);
    if (err != CL_SUCCESS) 
      throw std::runtime_error("Error: XrmResource clGetPlatformInfo");

    err = clGetPlatformInfo(platform_id, CL_PLATFORM_NAME, 1000,
                             (void *) cl_platform_name, NULL);
    if (err != CL_SUCCESS) 
      throw std::runtime_error("Error: XrmResource clGetPlatformInfo");

    cl_uint numDevices = 0;
    cl_device_id devices[100];
    err = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ACCELERATOR,
        99, &devices[0], &numDevices);
    if (err != CL_SUCCESS) 
      throw std::runtime_error("Error: XrmResource clGetDeviceIDs");

    info_->device_id = devices[info_->device_index];
    info_->xdev = xclGetXrtDevice(info_->device_id, &err);
	  if (err)
		  throw(std::runtime_error("Error: XrmResource failed to get xdev"));

    return;
  }

  throw std::runtime_error("Error: Could not acquire CU");
}

XrmResource::~XrmResource() { 
  if (naive_resource_mgr_on_)
    naive_resource_mgr_cu_idx_--;
  xrmCuRelease(context_, cu_rsrc_.get()); 
}

///////////////////////////////////////////////

DeviceHandle::DeviceHandle(std::string kernelName, std::string xclbin) {
  if (std::getenv("RTE_ACQUIRE_DEVICE_UNMANAGED")) {
    resource_.reset(new DeviceResource(kernelName, xclbin));
    return;
  }

  resource_.reset(new XrmResource(kernelName, xclbin));
}

/*
 * XCL device handle
 */

// Initialize shared state
std::map<std::pair<xrt_device*,size_t>, size_t> XclDeviceHandle::use_count_;
std::mutex XclDeviceHandle::use_count_mutex_;

XclDeviceHandle::XclDeviceHandle(std::string kernelName, std::string xclbin)
    : DeviceHandle(kernelName, xclbin), context_(nullptr), commands_(nullptr),
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

XrtDeviceHandle::XrtDeviceHandle(std::string kernelName, std::string xclbin)
    : DeviceHandle(kernelName, xclbin) {
  auto handle = xclOpen(get_device_info().device_index, NULL, XCL_INFO);
  std::string fnm = std::string(get_device_info().xclbin_path);
  xir::XrtBinStream binstream(fnm);
  if (get_device_info().cu_index == 0)
    binstream.burn(handle); // only program if you're the first CU
  xclClose(handle);

  uuid_ = binstream.get_uuid();
  context_.reset(new XrtContext(*this));
}

XrtDeviceHandle::~XrtDeviceHandle() {
}

/*
 * XRT device context (MUST alloc one for each thread)
 */
XrtContext::XrtContext(XrtDeviceHandle &handle) : handle_(handle) {
  dev_handle_ = xclOpen(handle.get_device_info().device_index, NULL, XCL_INFO);
  auto ret = xclOpenContext(dev_handle_, handle.get_uuid(), 
    handle.get_device_info().cu_index, true);
  if (ret)
    throw std::runtime_error("Error: xclOpenContext failed");
  bo_handle_ = xclAllocBO(dev_handle_, 4096, 0, XCL_BO_FLAGS_EXECBUF);
  bo_addr_ = xclMapBO(dev_handle_, bo_handle_, true);
}

XrtContext::~XrtContext() {
  xclFreeBO(dev_handle_, bo_handle_);
  xclCloseContext(dev_handle_, handle_.get_uuid(), handle_.get_device_info().cu_index);
  xclClose(dev_handle_);
}
