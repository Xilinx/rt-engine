#include <fstream>
#include <sstream>

#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "CL/cl_ext_xilinx.h"
#pragma GCC diagnostic pop 
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

void DpuController::run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
                        const std::vector<xir::vart::TensorBuffer*> &outputs) {
  void *indata = (void*)(inputs[0]->data().first);
  void *outdata = (void*)(outputs[0]->data().first);

  std::unique_ptr<OclDeviceBuffer> inbuf = alloc(indata, 
    inputs[0]->get_tensor()->get_element_num()*sizeof(int8_t), CL_MEM_READ_ONLY);
  std::unique_ptr<OclDeviceBuffer> outbuf = alloc(outdata, 
    outputs[0]->get_tensor()->get_element_num()*sizeof(int8_t), CL_MEM_WRITE_ONLY);

  upload(inbuf.get());
  execute(inbuf.get(), outbuf.get());
  download(outbuf.get());
}

void DpuController::upload(OclDeviceBuffer *buf) {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_.get_command_queue(), 
    1, &(buf->get_mem()), 
    0, // do migration from host
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: upload to device failed");
  clWaitForEvents(1, &event);

}

void DpuController::download(OclDeviceBuffer *buf) {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_.get_command_queue(), 
    1, &(buf->get_mem()), 
    CL_MIGRATE_MEM_OBJECT_HOST, 
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: download from device failed");
  clWaitForEvents(1, &event);
}

void DpuController::execute(OclDeviceBuffer *in, OclDeviceBuffer *out) {
  (void)in;
  (void)out;
  // TODO run kernel
}

std::unique_ptr<OclDeviceBuffer> 
DpuController::alloc(void *host_ptr, size_t size, cl_mem_flags flags) {
  static const std::vector<unsigned> ddrBankMap = {
    XCL_MEM_DDR_BANK0,
    XCL_MEM_DDR_BANK1,
    XCL_MEM_DDR_BANK2,
    XCL_MEM_DDR_BANK3
  };

  return std::unique_ptr<OclDeviceBuffer>(new OclDeviceBuffer(handle_, 
    host_ptr, size, ddrBankMap[handle_.get_device_info().ddr_bank], flags));
}
