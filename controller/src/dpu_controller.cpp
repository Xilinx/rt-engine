#include <fstream>
#include <sstream>

#include "CL/cl_ext_xilinx.h"
#include "experimental/xrt++.hpp"

#include "dpu_controller.hpp"
#include "json-c/json.h"


DpuController::DpuController(std::string meta) {
  // load meta file
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     

  // get kernel name
  json_object *kernelObj = NULL;
  if (!json_object_object_get_ex(jobj, "kernel", &kernelObj))
    throw std::runtime_error("Error: missing 'kernel' field in meta.json");
  std::string kernelName = json_object_get_string(kernelObj);

  // get xclbin path and acquire handle
  json_object *xclbinObj = NULL;
  if (!json_object_object_get_ex(jobj, "xclbin", &xclbinObj))
    throw std::runtime_error("Error: missing 'xclbin' field in meta.json");
  std::string xclbinPath = json_object_get_string(xclbinObj);
  std::cout << "xclbin: " << xclbinPath << std::endl;
  handle_.acquire(kernelName, xclbinPath);
}

DpuController::~DpuController() {
}

void DpuController::run(void *in_ptr, void *out_ptr) {
  (void)in_ptr;
  (void)out_ptr;
}

void DpuController::upload(void *in_ptr) {
}

void DpuController::download(void *out_ptr) {
}

void DpuController::execute() {
}

cl_mem DpuController::alloc(void *host_ptr, size_t size, cl_mem_flags flags) {
  const std::vector<unsigned> ddrBankMap = {
    XCL_MEM_DDR_BANK0,
    XCL_MEM_DDR_BANK1,
    XCL_MEM_DDR_BANK2,
    XCL_MEM_DDR_BANK3
  };

  cl_mem_ext_ptr_t cfg;
  cfg.flags = ddrBankMap[handle_.getDeviceInfo().ddr_bank];
  cfg.obj = host_ptr;
  cfg.param = 0;

  cl_mem_flags memFlags = flags | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR;
  cl_mem mem = clCreateBuffer(handle_.getContext(), memFlags, size, &cfg, NULL);
  if (mem == 0)
    throw std::runtime_error("Error: failed to allocate device memory\n");

  return mem;
}
