#include <fstream>
#include <memory>
#include <dirent.h>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "butler_client.h"
#include "butler_cu_selection_algo.h"
#include "butler_dev.h"
#pragma GCC diagnostic pop
 
#ifdef XRM  
  #include <xrm.h>
#endif

#include "experimental/xrt++.hpp"
#include "xrt_bin_stream.hpp"
#include "device_handle.hpp"

static uint64_t getDDRBankFromButlerBitmask(unsigned bitmask) {
  const int numBits = sizeof(bitmask) * CHAR_BIT;
  for (int i = 0; i < numBits; i++)
    if (bitmask & (1 << i))
      return i;

  throw std::runtime_error("Error: unknown ddr_bank config");
}

static std::atomic<bool> naive_resource_mgr_on_(false);
static std::atomic<unsigned> naive_resource_mgr_cu_idx_(0);

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

  auto handle = xclOpen(deviceIdx, NULL, XCL_INFO);
  xclDeviceInfo2 deviceInfo;
  xclGetDeviceInfo2(handle, &deviceInfo);
  xclClose(handle);

  xir::XrtBinStream binstream(xclbin);
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
      .device_id = 0, // TODO get actual OCL device_id
      .xdev = nullptr,
      .fingerprint = 0,
  });
}

DeviceResource::~DeviceResource() {
  if (naive_resource_mgr_on_)
    naive_resource_mgr_cu_idx_--;
}

ButlerResource::ButlerResource(std::string kernelName, std::string xclbin) {
  client_.reset(new butler::ButlerClient());
  if (client_->Ping() != butler::errCode::SUCCESS)
    throw std::runtime_error("Error: cannot ping butler server");

  std::pair<butler::Alloc, std::vector<butler::xCU>> acquireResult;
  acquireResult = client_->acquireCU(kernelName, xclbin);

  auto alloc = acquireResult.first;
  if (alloc.myErrCode != butler::errCode::SUCCESS) {
    std::cerr << alloc << std::endl;
    throw std::runtime_error("Error: could not acquire device handle");
  }
  std::cout << "Device acquired" << std::endl << alloc << std::endl;

  auto xcu = acquireResult.second[0];
  auto cu_full_name = xcu.getKernelName() + ":" + xcu.getName() + ":" +
                      std::to_string(xcu.getFPGAIdx()) + ":" +
                      std::to_string(xcu.getCUIdx());

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

  handle_ = alloc.myHandle;
}

ButlerResource::~ButlerResource() {
  if (client_.get())
    client_->releaseResources(handle_);
}

#ifdef XRM
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
  memset(cu_prop_.get(), 0, sizeof(xrmCuProperty));
  memset(cu_rsrc_.get(), 0, sizeof(xrmCuResource));
  strcpy(cu_prop_->kernelName, std::string(kernelName).c_str());
  strcpy(cu_prop_->kernelAlias, "");
  cu_prop_->devExcl = false;
  cu_prop_->requestLoad = 100;
  cu_prop_->poolId = 0;

  // get available xclbins
  auto xclbins = get_xclbins_in_dir(xclbin);

  for (unsigned i = 0; i < xclbins.size(); i++) 
  {
    // try to load xclbin
    char xclbinPath[XRM_MAX_PATH_NAME_LEN];
    strcpy(xclbinPath, xclbins[i].c_str()); // XRM does not take const char* :(
    int err 
      = xrmCuAllocWithLoad(context_, cu_prop_.get(), xclbinPath, cu_rsrc_.get());
    if (err)
      continue; // keep trying other xclbins

    std::cout << "Device acquired " << cu_rsrc_->xclbinFileName << std::endl;

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

  throw std::runtime_error("Error: could not acquire device handle");
}

XrmResource::~XrmResource() { 
  xrmCuRelease(context_, cu_rsrc_.get()); 
}
#endif

///////////////////////////////////////////////

DeviceHandle::DeviceHandle(std::string kernelName, std::string xclbin) {
  if (std::getenv("RTE_ACQUIRE_DEVICE_UNMANAGED")) {
    resource_.reset(new DeviceResource(kernelName, xclbin));
    return;
  }

#ifndef XRM
  resource_.reset(new ButlerResource(kernelName, xclbin));
#else
  resource_.reset(new XrmResource(kernelName, xclbin));
#endif
}

/*
 * XCL device handle
 */

XclDeviceHandle::XclDeviceHandle(std::string kernelName, std::string xclbin)
    : DeviceHandle(kernelName, xclbin), context_(nullptr), commands_(nullptr),
      program_(nullptr) {
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

  xrtcpp::acquire_cu_context(get_device_info().xdev, get_device_info().cu_index
    /*,shared=true*/ // enable shared in new XRT codebase
  ); 
}

XclDeviceHandle::~XclDeviceHandle() {
  if (get_device_info().xdev)
    xrtcpp::release_cu_context(get_device_info().xdev, get_device_info().cu_index);

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

#if 0
class ForceFirstCUSelection : public butler::CUSelectionAlgo {
public:
  ForceFirstCUSelection() {};
  virtual ~ForceFirstCUSelection() = default;

private:
  butler::UDFResult execute(butler::CUSelectionAlgoParam_t param) const {
    const std::vector<butler::XCLBIN>* xclbins_ptr = param.xclbins;
    const std::vector<butler::XCLBIN>& xclbins = *xclbins_ptr;
    const butler::System* system = param.system;
    butler::UDFResult rtn;
    rtn.valid = true;
    rtn.myErrCode = butler::errCode::ASSIGNMENT_UNFEASIBLE;

    std::cout << "# fpgas: " << system->getNumFPGAs() << std::endl;
    std::cout << "# xclbins: " << xclbins.size() << std::endl;
    if (system->getNumFPGAs() == 1 && xclbins.size() == 1)
    {
      // return first FPGA without any checks
      std::cout << "returning 1st FPGA without any checks" << std::endl;
      const butler::xFPGA* fpgaResource = system->getFPGAAtIdx(0);
      rtn.myErrCode = butler::errCode::SUCCESS;
      rtn.FPGAidx = fpgaResource->getIdx();
      rtn.CUidx = 0;
      rtn.XCLBINidx = 0;
    }

    return rtn;
  }
};
#endif

#if 0
class CUSelection : public butler::CUSelectionAlgo {
public:
  CUSelection() {};
  virtual ~CUSelection() = default;

private:
  butler::UDFResult execute(butler::CUSelectionAlgoParam_t param) const {
    const std::vector<butler::XCLBIN>* xclbins_ptr = param.xclbins;
    const std::vector<butler::XCLBIN>& xclbins = *xclbins_ptr;
    const butler::System* system = param.system;
    const std::string* kernelName = param.kernelName;
    int FPGAindex = -1;
    int CUindex = -1;
    butler::XCLBIN *xclbinPtr = nullptr;
    butler::UDFResult rtn;
    rtn.valid = true;
    rtn.myErrCode = butler::errCode::ASSIGNMENT_UNFEASIBLE;

    // find first free CU with kernel name
    for (int i = 0; (i < system->getNumFPGAs()) && (FPGAindex == -1); i++){
      const butler::xFPGA* fpga = system->getFPGAAtIdx(i);
      for (int j = 0; j < fpga->getNumCUs() && (FPGAindex == -1); j++){
        const xCU* cu = fpga->getCUAtIdx(j);
        if (cu->getKernelName().compare(*kernelName) == 0){
          if (!cu->getUsed()){
            FPGAindex = i;
            CUindex = j;
          }
        }
      }
    }
    if (0 > FPGAindex){
      for (int i = 0; (i < system->getNumFPGAs()) && (FPGAindex == -1); i++){
        const butler::xFPGA* fpga = system->getFPGAAtIdx(i);
        const std::string& FPGADSAName = fpga->getDSAName();
        // if fpga not free, continue
        if (fpga->AreCUsUsed()) continue;
        // allocate
        for (int j = 0; j < xclbins.size() && (FPGAindex == -1); j++){
          const std::string& xclbinDSAName = xclbins[j].getDSAName();
          if (FPGADSAName.compare(xclbinDSAName) == 0){
            for(int k = 0 ; k < xclbins[j].getNumCUs() && (FPGAindex == -1); k++){
              if (xclbins[j].getCUAtIdx(k)->getKernelName().compare(*kernelName) == 0){
                FPGAindex = i;
                CUindex = k;
                xclbinPtr = const_cast<XCLBIN *>(&(*(xclbins.begin() + j)));
              }
            }
          }
        }
      }
    }
    if (0 <= FPGAindex){
      const xFPGA* fpgaResource = system->getFPGAAtIdx(FPGAindex);
      rtn.myErrCode = butler::errCode::SUCCESS;
      rtn.FPGAidx = fpgaResource->getIdx();
      // CU in XCLBIN
      if (xclbinPtr != nullptr) {
        rtn.CUidx = CUindex;
        rtn.XCLBINidx = xclbinPtr->getIdx();
      }
      // CU on FPGA
      else{
        const xCU* cuResource = fpgaResource->getCUAtIdx(CUindex);
        rtn.CUidx = cuResource->getCUIdx();
      }
    }
    return rtn;
  }
};
#endif