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

#include "device_handle_xrm.hpp"

DEF_ENV_PARAM(DEBUG_DEVICE_HANDLE, "0")
static std::mutex g_allocation_lock_xrm;

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

int XrmResource::alloc_without_deviceId(std::string kernelName, char* xclbinPath) {
  KernelNameManager& kernelNameManager = KernelNameManager::getInstance();
  auto realKernel = kernelNameManager.getRealKernelName(xclbinPath, kernelName);
  std::strcpy(cu_prop_->kernelName, std::string(realKernel).c_str());
  auto err = xrmCuAllocLeastUsedWithLoad(context_, cu_prop_.get(), xclbinPath, cu_rsrc_.get());
  return err;
}

int XrmResource::alloc_with_deviceId(std::string kernelName, char* xclbinPath, xir::Attrs* attrs) {
  auto device_index = attrs->get_attr<size_t>("__device_id__");
  xrmLoadOneDevice(context_, device_index, xclbinPath); // if already load, here may fail, so not check status
  KernelNameManager& kernelNameManager = KernelNameManager::getInstance();
  auto realKernel = kernelNameManager.getRealKernelName(xclbinPath, kernelName);
  std::strcpy(cu_prop_->kernelName, std::string(realKernel).c_str());
  auto err = xrmCuAllocLeastUsedFromDev(context_, device_index, cu_prop_.get(), cu_rsrc_.get());
  return err;
}

int XrmResource::alloc_from_attrs(std::string kernelName, char* xclbinPath, xir::Attrs* attrs) {
  int err=-1;
  bool cu_correct=false;
  std::vector<std::unique_ptr<xrmCuResource>> cu_rsrc;
  std::string fnm = std::string(xclbinPath);
  xir::XrtBinStream binstream(fnm);
  std::unordered_map<int, int> allocedCus;
  auto cu_num = binstream.get_num_of_cu();
  while(!cu_correct) {
    if (attrs->has_attr("__device_id__")) {
      err = alloc_with_deviceId(kernelName, xclbinPath, attrs);
    } else {
      err = alloc_without_deviceId(kernelName, xclbinPath);
    } 
    if (0==err) {   
      //select correct core
      if ((kernelName == "DPUCVDX8H")||(kernelName == "DPUCAHX8L")||(kernelName == "DPUCAHX8H")) {
        if (attrs->has_attr("__device_core_id__")) { // this only used in runtime and can't be set outside
          auto core_id = attrs->get_attr<size_t>("__device_core_id__");
          if (cu_rsrc_->cuId != (int)core_id ) {
            if (allocedCus.size() == cu_num) {
              for (unsigned sz=0;sz<cu_rsrc.size();sz++) {
                xrmCuRelease(context_, cu_rsrc[sz].get());
              }
              xrmCuRelease(context_, cu_rsrc_.get());
              return -1;
            }
            allocedCus.emplace(std::make_pair(cu_rsrc_->cuId,cu_rsrc_->deviceId));
            cu_rsrc.emplace_back(std::move(cu_rsrc_));
            cu_rsrc_.reset(new xrmCuResource); 
            std::memset(cu_rsrc_.get(), 0, sizeof(xrmCuResource));
          } else { // bath match
            cu_correct=true;
          }
        } else { // no batch info
          cu_correct=true;
        }
      } else { // v3int8
        cu_correct=true;
      }
    } else { 
      for (unsigned sz=0;sz<cu_rsrc.size();sz++) {
        xrmCuRelease(context_, cu_rsrc[sz].get());
      }
      return -1;
    }
  } 
  for (unsigned sz=0;sz<cu_rsrc.size();sz++) {
    xrmCuRelease(context_, cu_rsrc[sz].get());
  }
  return err;
}

XrmResource::XrmResource(std::string kernelName, std::string xclbin, xir::Attrs* attrs)
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

  cu_prop_->requestLoad = 0x100;

  cu_prop_->poolId = 0; // Allocate CUs from the system pool

  // get available xclbins
  auto xclbins = get_xclbins_in_dir(xclbin);

  if (std::getenv("XLNX_ENABLE_DEVICES")){
    int maxDeviceId = xclProbe();
    for (int idx = 0; idx <= maxDeviceId; idx++ ) {
      xrmDisableOneDevice(context_, idx);
    }

    string token;
    istringstream tokenStream(std::getenv("XLNX_ENABLE_DEVICES"));
    while (getline(tokenStream, token, ',')) {
        xrmEnableOneDevice(context_, stoi(token));
    }
  } else {
    int maxDeviceId = xclProbe();
    for (int idx = 0; idx <= maxDeviceId; idx++ ) {
      xrmEnableOneDevice(context_, idx);
    }
  }

  for (unsigned i = 0; i < xclbins.size(); i++) 
  {
    // try to load xclbin
    char xclbinPath[XRM_MAX_PATH_NAME_LEN];
    std::strcpy(xclbinPath, xclbins[i].c_str()); // XRM does not take const char* :(
    int err = alloc_from_attrs(kernelName, xclbinPath, attrs);
    if (err) {
      continue; // keep trying other xclbins
    }
    LOG_IF(INFO, ENV_PARAM(DEBUG_DEVICE_HANDLE))
      << "Device acuqired : "  //
      << cu_rsrc_->xclbinFileName      //
      << ", deviceId : "  //
      << cu_rsrc_->deviceId      //
      << ", cuId : "  //
      << cu_rsrc_->cuId      //
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
        .device_handle = nullptr,
        .xdev = nullptr,
        .uuid =&(cu_rsrc_->uuid[0]),
        .fingerprint = 0,
    });

    // Wait turn to run OCL Commands
    std::lock_guard<std::mutex> lockGuard0(g_allocation_lock_xrm);

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
  xrmCuRelease(context_, cu_rsrc_.get()); 
}
