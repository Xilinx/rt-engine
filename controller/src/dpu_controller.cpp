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

OclDpuController::OclDpuController(std::string meta) : DpuController(meta) {
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
  std::cout << "loading xclbin: " << xclbinPath << std::endl;
  handle_.acquire(kernelName, xclbinPath);
}

OclDpuController::~OclDpuController() {
}

void OclDpuController::run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
                        const std::vector<xir::vart::TensorBuffer*> &outputs) {
  OclDeviceBuffer* inbuf = alloc(inputs[0], CL_MEM_READ_ONLY);
  OclDeviceBuffer* outbuf = alloc(outputs[0], CL_MEM_READ_WRITE);
  upload(inbuf);
  execute(inbuf, outbuf);
  download(outbuf);
}

void OclDpuController::upload(OclDeviceBuffer *buf) const {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_.get_command_queue(), 
    1, &(buf->get_mem()), 
    0, // do migration from host
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: upload to device failed");
  clWaitForEvents(1, &event);
}

void OclDpuController::download(OclDeviceBuffer *buf) const {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_.get_command_queue(), 
    1, &(buf->get_mem()), 
    CL_MIGRATE_MEM_OBJECT_HOST, 
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: download from device failed");
  clWaitForEvents(1, &event);
}

void OclDpuController::execute(OclDeviceBuffer *in, OclDeviceBuffer *out) const {
  (void)in;
  (void)out;
  // TODO run kernel
}

OclDeviceBuffer*
OclDpuController::alloc(xir::vart::TensorBuffer *tbuf, cl_mem_flags flags) {
  static const std::vector<unsigned> ddrBankMap = {
    XCL_MEM_DDR_BANK0,
    XCL_MEM_DDR_BANK1,
    XCL_MEM_DDR_BANK2,
    XCL_MEM_DDR_BANK3
  };

  {
    std::unique_lock<std::mutex> lock(tbuf_mtx_);
    auto it = tbuf2dbuf_.find(tbuf);
    if (it != tbuf2dbuf_.end())
      return it->second.get();
  }

  void *host_ptr = (void*)tbuf->data().first;
  size_t size = tbuf->get_tensor()->get_element_num() * sizeof(int8_t);
  OclDeviceBuffer *dbuf = new OclDeviceBuffer(handle_, 
    host_ptr, size, ddrBankMap[handle_.get_device_info().ddr_bank], flags);

  {
    std::unique_lock<std::mutex> lock(tbuf_mtx_);
    tbuf2dbuf_.emplace(tbuf, std::unique_ptr<OclDeviceBuffer>(dbuf));
  }

  return dbuf;
}

std::vector<const xir::vart::Tensor*> OclDpuController::get_input_tensors() const {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 4, 224, 224, 3 };
  static xir::vart::Tensor tensor("input", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}
std::vector<const xir::vart::Tensor*> OclDpuController::get_output_tensors() const {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 4, 1, 1, 1000 };
  static xir::vart::Tensor tensor("output", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}

std::vector<xir::vart::TensorBuffer*> OclDpuController::get_inputs() {
  return create_tensor_buffers(get_input_tensors());
}

std::vector<xir::vart::TensorBuffer*> OclDpuController::get_outputs() {
  return create_tensor_buffers(get_output_tensors());
}

std::vector<xir::vart::TensorBuffer*> 
OclDpuController::create_tensor_buffers(const std::vector<const xir::vart::Tensor*> &tensors) {
  std::vector<xir::vart::TensorBuffer*> tbufs;
  for (unsigned ti=0; ti < tensors.size(); ti++)
  {
    void *data;
    size_t size = tensors[ti]->get_element_num() * sizeof(int8_t);
    if (posix_memalign(&data, getpagesize(), size))
      throw std::bad_alloc();

    auto bufptr = new xir::vart::CpuFlatTensorBuffer(data, tensors[ti]);
    tbufs.emplace_back(bufptr);
    {
      std::unique_lock<std::mutex> lock(tbuf_mtx_);
      tbufs_.emplace_back(std::unique_ptr<xir::vart::CpuFlatTensorBuffer>(bufptr));
    }
  }
  return tbufs;
}
