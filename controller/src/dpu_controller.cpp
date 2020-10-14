#include <iostream>
#include <fstream>
#include <sstream>
#include <unistd.h>
#include <unordered_map>
#include <cstdlib>
//#include <cmath>
#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "CL/cl_ext_xilinx.h"
#pragma GCC diagnostic pop 
#include "xir/tensor/tensor.hpp"
#include <xir/graph/graph.hpp>
#include <xir/graph/subgraph.hpp>
#include "vart/tensor_buffer.hpp"
#include "dpu_controller.hpp"
#include "dpu_runner.hpp"
#include "json-c/json.h"


template <class Dhandle, class DbufIn, class DbufOut>
XclDpuController<Dhandle, DbufIn, DbufOut>::XclDpuController(std::string meta) 
: DpuController(meta) {
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
  handle_.reset(new Dhandle(kernelName, xclbinPath));
  std::cout << "done loading xclbin" << std::endl;
}

template <class Dhandle, class DbufIn, class DbufOut>
XclDpuController<Dhandle, DbufIn, DbufOut>::XclDpuController(const xir::Subgraph *subgraph) 
: DpuController(subgraph) {
  
  std::string kernelName = subgraph->get_attr<std::string>("kernel");
  // get xclbin path and acquire handle
  const char* xclbinPath = std::getenv("XLNX_VART_FIRMWARE");
  
  std::cout << "loading xclbin: " << xclbinPath << std::endl;
  handle_.reset(new Dhandle(kernelName, xclbinPath));
  std::cout << "done loading xclbin" << std::endl;
}


template <class Dhandle, class DbufIn, class DbufOut>
XclDpuController<Dhandle, DbufIn, DbufOut>::~XclDpuController() {
}

template <class Dhandle, class DbufIn, class DbufOut>
void XclDpuController<Dhandle, DbufIn, DbufOut>::run(
  const std::vector<vart::TensorBuffer*> &inputs, 
  const std::vector<vart::TensorBuffer*> &outputs) {
  (void)inputs;
  (void)outputs;
}

template <class Dhandle, class DbufIn, class DbufOut>
DeviceBuffer* XclDpuController<Dhandle, DbufIn, DbufOut>::get_device_buffer(vart::TensorBuffer *tbuf) {
  std::unique_lock<std::mutex> lock(tbuf_mtx_);
  auto it = tbuf2dbuf_.find(tbuf);
  if (it == tbuf2dbuf_.end())
    throw std::runtime_error("Error: DeviceBuffer not found for TensorBuffer");
  return it->second.get();
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<const xir::Tensor*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_input_tensors() const {
  // TODO get from compiler 
  static const std::vector<std::int32_t> dims = { 4, 224, 224, 3 };
  static const xir::Tensor *t = xir::Tensor::create("input", dims, xir::DataType{xir::DataType::INT, 8}).release();
  return std::vector<const xir::Tensor*>{ t };
  //static xir::Tensor tensor("input", dims, xir::Tensor::DataType::INT); 
  //return std::vector<const xir::Tensor*>{ &tensor };
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<const xir::Tensor*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_output_tensors() const {
  // TODO get from compiler
  static const std::vector<std::int32_t> dims = { 4, 1, 1, 1000 };
  static const xir::Tensor *t = xir::Tensor::create("output", dims, xir::DataType{xir::DataType::INT, 8}).release();
  return std::vector<const xir::Tensor*>{ t };
//  static xir::Tensor tensor("output", dims, xir::Tensor::DataType::INT); 
//  return std::vector<const xir::Tensor*>{ &tensor };
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_inputs() {
  return create_tensor_buffers(get_input_tensors(), /*isInput*/true);
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_outputs() {
  return create_tensor_buffers(get_output_tensors(), /*isInput*/false);
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::create_tensor_buffers(
  const std::vector<const xir::Tensor*> &tensors, bool isInput) {
  std::vector<vart::TensorBuffer*> tbufs;
  for (unsigned ti=0; ti < tensors.size(); ti++)
  {
    // allocate aligned host memory
    const size_t dataSize = std::ceil(tensors[ti]->get_data_type().bit_width / 8.f);
    size_t size = tensors[ti]->get_element_num() * dataSize;
    void *data;
    if (posix_memalign(&data, getpagesize(), size))
      throw std::bad_alloc();

    // make TensorBuffer to hold host memory
    std::unique_ptr<vart::CpuFlatTensorBuffer> tbuf(
      new vart::CpuFlatTensorBuffer(data, tensors[ti]));
    tbufs.emplace_back(tbuf.get());

    // make corresponding DeviceBuffer for the TensorBuffer
    std::unique_ptr<DeviceBuffer> dbuf;
    if (isInput)
      dbuf.reset(
        new DbufIn(handle_.get(), tbuf.get(), handle_->get_device_info().ddr_bank));
    else
      dbuf.reset(
        new DbufOut(handle_.get(), tbuf.get(), handle_->get_device_info().ddr_bank));

    // register this TensorBuffer->DeviceBuffer pair
    {
      std::unique_lock<std::mutex> lock(tbuf_mtx_);
      tbuf2dbuf_.emplace(tbuf.get(), std::move(dbuf));
      tbufs_.emplace_back(std::move(tbuf));
    }
  }
  return tbufs;
}

/*
 * Sample Dpu Controller
 */

SampleDpuController::SampleDpuController(std::string meta) 
: XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>(meta) {
}

SampleDpuController::~SampleDpuController() {
}

void SampleDpuController::run(
  const std::vector<vart::TensorBuffer*> &inputs, 
  const std::vector<vart::TensorBuffer*> &outputs) {
  XclDeviceBuffer* inbuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(inputs[0]));
  XclDeviceBuffer* outbuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(outputs[0]));
  inbuf->upload();
  execute(inbuf, outbuf);
  outbuf->download();
}

void SampleDpuController::execute(XclDeviceBuffer *in, XclDeviceBuffer *out) const {
  (void)in;
  (void)out;
  // TODO run kernel
}

/*
 * template instantiations
 */
template XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>::XclDpuController(std::string meta);
template XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>::XclDpuController(std::string meta);
template XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>::XclDpuController(const xir::Subgraph *subgraph);
template XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>::XclDpuController(const xir::Subgraph *subgraph);
template DeviceBuffer* XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>::get_device_buffer(vart::TensorBuffer *tb);
template DeviceBuffer* XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>::get_device_buffer(vart::TensorBuffer *tb);
