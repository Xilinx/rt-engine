#include <fstream>
#include <sstream>
#include <unistd.h>
#include <unordered_map>

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
                        const std::vector<xir::vart::TensorBuffer*> &outputs) const {
  OclDeviceBuffer* inbuf = tbuf2obuf_.find(inputs[0])->second.get();
  OclDeviceBuffer* outbuf = tbuf2obuf_.find(outputs[0])->second.get();
  upload(inbuf);
  execute(inbuf, outbuf);
  download(outbuf);
}

void DpuController::upload(OclDeviceBuffer *buf) const {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_.get_command_queue(), 
    1, &(buf->get_mem()), 
    0, // do migration from host
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: upload to device failed");
  clWaitForEvents(1, &event);
}

void DpuController::download(OclDeviceBuffer *buf) const {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_.get_command_queue(), 
    1, &(buf->get_mem()), 
    CL_MIGRATE_MEM_OBJECT_HOST, 
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: download from device failed");
  clWaitForEvents(1, &event);
}

void DpuController::execute(OclDeviceBuffer *in, OclDeviceBuffer *out) const {
  (void)in;
  (void)out;
  // TODO run kernel
}

std::unique_ptr<OclDeviceBuffer>
DpuController::alloc(void *host_ptr, size_t size, cl_mem_flags flags) const {
  static const std::vector<unsigned> ddrBankMap = {
    XCL_MEM_DDR_BANK0,
    XCL_MEM_DDR_BANK1,
    XCL_MEM_DDR_BANK2,
    XCL_MEM_DDR_BANK3
  };

  return std::unique_ptr<OclDeviceBuffer>(new OclDeviceBuffer(handle_, 
    host_ptr, size, ddrBankMap[handle_.get_device_info().ddr_bank], flags));
}

std::vector<const xir::vart::Tensor*> DpuController::get_input_tensors() const {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 4, 224, 224, 3 };
  static xir::vart::Tensor tensor("input", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}
std::vector<const xir::vart::Tensor*> DpuController::get_output_tensors() const {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 4, 1, 1, 1000 };
  static xir::vart::Tensor tensor("output", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}

std::vector<xir::vart::TensorBuffer*> DpuController::get_inputs() {
  std::vector<xir::vart::TensorBuffer*> ibufs;
  auto inTensors = get_input_tensors();
  for (unsigned ti=0; ti < inTensors.size(); ti++)
  {
    void *data;
    size_t size = inTensors[ti]->get_element_num() * sizeof(int8_t);
    if (posix_memalign(&data, getpagesize(), size))
      throw std::bad_alloc();

    auto bufptr = new xir::vart::CpuFlatTensorBuffer(data, inTensors[ti]);
    std::unique_ptr<OclDeviceBuffer> dbuf(alloc(data, size, CL_MEM_READ_ONLY));
    ibufs.emplace_back(bufptr);
    {
      std::unique_lock<std::mutex> lock(tbuf_mtx_);
      tbufs_.emplace_back(std::unique_ptr<xir::vart::CpuFlatTensorBuffer>(bufptr));
      tbuf2obuf_.emplace(bufptr, std::move(dbuf));
    }
  }
  return ibufs;
}

std::vector<xir::vart::TensorBuffer*> DpuController::get_outputs() {
  std::vector<xir::vart::TensorBuffer*> obufs;
  auto outTensors = get_output_tensors();
  for (unsigned ti=0; ti < outTensors.size(); ti++)
  {
    void *data;
    size_t size = outTensors[ti]->get_element_num() * sizeof(int8_t);
    if (posix_memalign(&data, getpagesize(), size))
      throw std::bad_alloc();

    auto bufptr = new xir::vart::CpuFlatTensorBuffer(data, outTensors[ti]);
    std::unique_ptr<OclDeviceBuffer> dbuf(alloc(data, size, CL_MEM_WRITE_ONLY));
    obufs.emplace_back(bufptr);
    {
      std::unique_lock<std::mutex> lock(tbuf_mtx_);
      tbufs_.emplace_back(std::unique_ptr<xir::vart::CpuFlatTensorBuffer>(bufptr));
      tbuf2obuf_.emplace(bufptr, std::move(dbuf));
    }
  }
  return obufs;
}
