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


template <class TDhandle, class TDbuf>
XclDpuController<TDhandle, TDbuf>::XclDpuController(std::string meta) : DpuController(meta) {
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
  handle_.reset(new TDhandle(kernelName, xclbinPath));
}

template <class TDhandle, class TDbuf>
XclDpuController<TDhandle, TDbuf>::~XclDpuController() {
}

template <class TDhandle, class TDbuf>
void XclDpuController<TDhandle, TDbuf>::run(
  const std::vector<xir::vart::TensorBuffer*> &inputs, 
  const std::vector<xir::vart::TensorBuffer*> &outputs) {
  (void)inputs;
  (void)outputs;
}

template <class TDhandle, class TDbuf>
TDbuf* XclDpuController<TDhandle, TDbuf>::alloc(
  xir::vart::TensorBuffer *tbuf, cl_mem_flags flags) {
  static const std::vector<unsigned> ddrBankMap = {
    XCL_MEM_DDR_BANK0,
    XCL_MEM_DDR_BANK1,
    XCL_MEM_DDR_BANK2,
    XCL_MEM_DDR_BANK3
  };
  static const std::unordered_map<xir::vart::Tensor::DataType, size_t> dataSizeMap = {
    { xir::vart::Tensor::DataType::INT8, sizeof(int8_t) },
    { xir::vart::Tensor::DataType::UINT8, sizeof(uint8_t) },
    { xir::vart::Tensor::DataType::INT16, sizeof(int16_t) },
    { xir::vart::Tensor::DataType::UINT16, sizeof(uint16_t) },
    { xir::vart::Tensor::DataType::INT32, sizeof(int32_t) },
    { xir::vart::Tensor::DataType::UINT32, sizeof(uint32_t) },
    { xir::vart::Tensor::DataType::FLOAT, sizeof(float) },
    { xir::vart::Tensor::DataType::DOUBLE, sizeof(double) }
  };

  {
    std::unique_lock<std::mutex> lock(tbuf_mtx_);
    // TODO: enforce that tbuf is a buffer we created from get_inputs of get_outputs
    auto it = tbuf2dbuf_.find(tbuf);
    if (it != tbuf2dbuf_.end())
      return it->second.get();
  }

  if (dataSizeMap.find(tbuf->get_tensor()->get_data_type()) == dataSizeMap.end())
    throw std::runtime_error("Error: cannot alloc device buffer -- unknown datatype");

  void *host_ptr = (void*)tbuf->data().first;
  size_t size = tbuf->get_tensor()->get_element_num() 
    * dataSizeMap.at(tbuf->get_tensor()->get_data_type());
  TDbuf *dbuf = new TDbuf(*handle_, host_ptr, size, 
    ddrBankMap[handle_->get_device_info().ddr_bank], flags);

  {
    std::unique_lock<std::mutex> lock(tbuf_mtx_);
    tbuf2dbuf_.emplace(tbuf, std::unique_ptr<TDbuf>(dbuf));
  }

  return dbuf;
}

template <class TDhandle, class TDbuf>
std::vector<const xir::vart::Tensor*> 
XclDpuController<TDhandle, TDbuf>::get_input_tensors() const {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 4, 224, 224, 3 };
  static xir::vart::Tensor tensor("input", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}

template <class TDhandle, class TDbuf>
std::vector<const xir::vart::Tensor*> 
XclDpuController<TDhandle, TDbuf>::get_output_tensors() const {
  // TODO get from compiler.json
  static const std::vector<std::int32_t> dims = { 4, 1, 1, 1000 };
  static xir::vart::Tensor tensor("output", dims, xir::vart::Tensor::DataType::INT8); 
  return std::vector<const xir::vart::Tensor*>{ &tensor };
}

template <class TDhandle, class TDbuf>
std::vector<xir::vart::TensorBuffer*> 
XclDpuController<TDhandle, TDbuf>::get_inputs() {
  return create_tensor_buffers(get_input_tensors());
}

template <class TDhandle, class TDbuf>
std::vector<xir::vart::TensorBuffer*> 
XclDpuController<TDhandle, TDbuf>::get_outputs() {
  return create_tensor_buffers(get_output_tensors());
}

template <class TDhandle, class TDbuf>
std::vector<xir::vart::TensorBuffer*> 
XclDpuController<TDhandle, TDbuf>::create_tensor_buffers(
  const std::vector<const xir::vart::Tensor*> &tensors) {
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

/*
 * Sample Dpu Controller
 */

SampleDpuController::SampleDpuController(std::string meta) 
  : XclDpuController<XclDeviceHandle, XclDeviceBuffer>(meta) {
}

SampleDpuController::~SampleDpuController() {
}

void SampleDpuController::run(
  const std::vector<xir::vart::TensorBuffer*> &inputs, 
  const std::vector<xir::vart::TensorBuffer*> &outputs) {
  XclDeviceBuffer* inbuf = alloc(inputs[0], CL_MEM_READ_ONLY);
  XclDeviceBuffer* outbuf = alloc(outputs[0], CL_MEM_READ_WRITE);
  upload(inbuf);
  execute(inbuf, outbuf);
  download(outbuf);
}

void SampleDpuController::upload(XclDeviceBuffer *buf) const {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_->get_command_queue(), 
    1, &(buf->get_mem()), 
    0, // do migration from host
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: upload to device failed");
  clWaitForEvents(1, &event);
}

void SampleDpuController::download(XclDeviceBuffer *buf) const {
  cl_event event;
  int err = clEnqueueMigrateMemObjects(handle_->get_command_queue(), 
    1, &(buf->get_mem()), 
    CL_MIGRATE_MEM_OBJECT_HOST, 
    0, NULL, &event);
  if (err != CL_SUCCESS)
    throw std::runtime_error("Error: download from device failed");
  clWaitForEvents(1, &event);
}

void SampleDpuController::execute(XclDeviceBuffer *in, XclDeviceBuffer *out) const {
  (void)in;
  (void)out;
  // TODO run kernel
}

/*
 * template instantiations
 */

template XclDpuController<XclDeviceHandle, XclDeviceBuffer>::XclDpuController(std::string meta);
template XclDpuController<XrtDeviceHandle, XrtDeviceBuffer>::XclDpuController(std::string meta);
