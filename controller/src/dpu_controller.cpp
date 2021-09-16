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

#include <iostream>
#include <fstream>
#include <sstream>
#include <unordered_map>
#include <cstdlib>
#include "xir/tensor/tensor.hpp"
#include <xir/graph/graph.hpp>
#include <xir/graph/subgraph.hpp>
#include "vart/tensor_buffer.hpp"
#include "dpu_controller.hpp"
#include "dpu_runner.hpp"
#include "json-c/json.h"
#include "vitis/ai/target_factory.hpp"
#include "vitis/ai/env_config.hpp"
#include "tensor_buffer_imp_host_phy.hpp"

DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")

template <class Dhandle, class DbufIn, class DbufOut>
XclDpuController<Dhandle, DbufIn, DbufOut>::XclDpuController(std::string meta, xir::Attrs* attrs) 
: DpuController(meta, attrs),  default_attrs_{xir::Attrs::create()}  {

  if (attrs == nullptr) {
    attrs = default_attrs_.get();
  } 
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
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "loading xclbin: "  //
    << xclbinPath      //
    ;

  //handle_.reset(new Dhandle(kernelName, xclbinPath));
  handle_.reset(new Dhandle(kernelName, xclbinPath, attrs));
  if (!attrs->has_attr("__device_core_id__")) {
    attrs->set_attr<size_t>("__device_core_id__", handle_->get_device_info().cu_index);
  }
  if (!attrs->has_attr("__device_id__")) {
    attrs->set_attr<size_t>("__device_id__", handle_->get_device_info().device_index);
  }

  
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "alloc cu index: " << handle_->get_device_info().cu_index 
    << " device index: " << handle_->get_device_info().device_index;

  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "done loading xclbin"  //
    ;
}

template <class Dhandle, class DbufIn, class DbufOut>
XclDpuController<Dhandle, DbufIn, DbufOut>::XclDpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs)
: DpuController(subgraph, attrs),  default_attrs_{xir::Attrs::create()} {

  if (attrs == nullptr) {
    attrs = default_attrs_.get();
  } 
  std::string kernelName;
  if (subgraph->has_attr("dpu_fingerprint")) {
    const uint64_t fingerprint = subgraph->get_attr<std::uint64_t>("dpu_fingerprint");
    kernelName = vitis::ai::target_factory()->create(fingerprint).type();
  } else {
    kernelName = subgraph->get_attr<std::string>("kernel");
  }
  // get xclbin path and acquire handle
  const char* xclbinPath = std::getenv("XLNX_VART_FIRMWARE");

  if (xclbinPath == nullptr)
    throw std::runtime_error("Error: xclbinPath is not set, please consider setting XLNX_VART_FIRMWARE.");

  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "loading xclbin: "  //
    << xclbinPath      //
    ;
  handle_.reset(new Dhandle(kernelName, xclbinPath, attrs));
  if (!attrs->has_attr("__device_core_id__")) {
    attrs->set_attr<size_t>("__device_core_id__", handle_->get_device_info().cu_index);
  }
  if (!attrs->has_attr("__device_id__")) {
    attrs->set_attr<size_t>("__device_id__", handle_->get_device_info().device_index);
  }
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "alloc cu index: " << handle_->get_device_info().cu_index 
    << " device index: " << handle_->get_device_info().device_index;
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "done loading xclbin"  //
    ;
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
  auto dbufs = get_device_buffers(tbuf);
  if(dbufs.empty())
    return NULL;
  return dbufs[0];
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<DeviceBuffer *>XclDpuController<Dhandle, DbufIn, DbufOut>::get_device_buffers(vart::TensorBuffer *tbuf) {
  std::unique_lock<std::mutex> lock(tbuf_mtx_);
  auto it = tbufs2dbufs_.find(tbuf);
  if (it == tbufs2dbufs_.end()) {
    std::vector<DeviceBuffer *> null_dbuf;
    return null_dbuf;
  }
  return it->second;
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<float> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_input_scale() {
  // TODO 
  static const std::vector<float> in = { 1.0};
  return in;
}
template <class Dhandle, class DbufIn, class DbufOut>
std::vector<float> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_output_scale() {
  // TODO 
  static const std::vector<float> out = { 1.0};
  return out;
}
template <class Dhandle, class DbufIn, class DbufOut>
std::vector<const xir::Tensor*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_input_tensors() const {
  // TODO get from compiler 
  static const std::vector<std::int32_t> dims = { 4, 224, 224, 3 };
  static const xir::Tensor *t = xir::Tensor::create("input", dims, xir::DataType{xir::DataType::XINT, 8}).release();
  return std::vector<const xir::Tensor*>{ t };
  //static xir::Tensor tensor("input", dims, xir::Tensor::DataType::INT); 
  //return std::vector<const xir::Tensor*>{ &tensor };
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<const xir::Tensor*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_output_tensors() const {
  // TODO get from compiler
  static const std::vector<std::int32_t> dims = { 4, 1, 1, 1000 };
  static const xir::Tensor *t = xir::Tensor::create("output", dims, xir::DataType{xir::DataType::XINT, 8}).release();
  return std::vector<const xir::Tensor*>{ t };
//  static xir::Tensor tensor("output", dims, xir::Tensor::DataType::INT); 
//  return std::vector<const xir::Tensor*>{ &tensor };
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_inputs(int batchsz) {
  // TODO if batchsz > 0, create_tensor_buffers for user-requested batchsz
  if (batchsz != -1)
    throw std::runtime_error("Error: custom batch size not supported for this DPU");
  return create_tensor_buffers(get_input_tensors(), /*isInput*/true);
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::get_outputs(int batchsz) {
  // TODO if batchsz > 0, create_tensor_buffers for user-requested batchsz
  if (batchsz != -1)
    throw std::runtime_error("Error: custom batch size not supported for this DPU");
  return create_tensor_buffers(get_output_tensors(), /*isInput*/false);
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*> 
XclDpuController<Dhandle, DbufIn, DbufOut>::create_tensor_buffers(
  const std::vector<const xir::Tensor*> &tensors, bool isInput, int ddrBank) {
  return create_tensor_buffers(tensors, isInput, std::vector<int>(1,ddrBank));
}

template <class Dhandle, class DbufIn, class DbufOut>
std::vector<vart::TensorBuffer*>
XclDpuController<Dhandle, DbufIn, DbufOut>::create_tensor_buffers(
  const std::vector<const xir::Tensor*> &tensors, bool isInput, std::vector<int> ddrBanks) {
  std::vector<vart::TensorBuffer*> tbufs;
  for (unsigned ti=0; ti < tensors.size(); ti++)
  {
    // allocate aligned host memory
    const size_t dataSize = std::ceil(tensors[ti]->get_data_type().bit_width / 8.f);
    size_t size = tensors[ti]->get_element_num() * dataSize;
    void *data;
    if (rte::posix_memalign(&data, rte::getpagesize(), size))
      throw std::bad_alloc();
    std::memset(data, 0, size);
    // make TensorBuffer to hold host memory
    std::unique_ptr<vart::rt_engine::TensorBufferExtImpHostPhy> tbuf(
      new vart::rt_engine::TensorBufferExtImpHostPhy(data, tensors[ti]));
    tbufs.emplace_back(tbuf.get());

    // make corresponding DeviceBuffer for the TensorBuffer
    std::vector<DeviceBuffer *> dbufs;
    if (ddrBanks.size() == 1) {
      int ddrBank = ddrBanks[0];
      if (ddrBank < 0) ddrBank = handle_->get_device_info().ddr_bank;
      std::unique_ptr<DeviceBuffer> dbuf;
      try {
        if (isInput)
          dbuf.reset(new DbufIn(handle_.get(), data, size, ddrBank));
        else
          dbuf.reset(new DbufOut(handle_.get(), data, size, ddrBank));
      } catch(...) {
        tbufs.clear();
        return tbufs;
      }
      dbufs.emplace_back(dbuf.get());
      tbuf->set_device_buffer(std::move(dbuf));

    } else {
      throw std::runtime_error("Error: ddrBanks not support");
    }

    // register this TensorBuffer->DeviceBuffer pair
    {
      std::unique_lock<std::mutex> lock(tbuf_mtx_);
      tbufs2dbufs_.emplace(tbuf.get(), std::move(dbufs));
      tbufs_.emplace_back(std::move(tbuf));
    }
  }

  return tbufs;
}

template <class Dhandle, class DbufIn, class DbufOut>
void
XclDpuController<Dhandle, DbufIn, DbufOut>::free_tensor_buffers(std::vector<vart::TensorBuffer*> &tbufs) {
  std::unique_lock<std::mutex> lock(tbuf_mtx_);
  for (unsigned ti=0; ti < tbufs.size(); ti++)
  {
    tbufs2dbufs_.erase(tbufs[ti]);

    for (auto it=tbufs_.begin(); it != tbufs_.end(); it++)
      if (it->get() == tbufs[ti])
      {
        free(reinterpret_cast<void*>(it->get()->data().first));
        tbufs_.erase(it);
        break;
      }
  }
}

/*
 * template instantiations
 */
template XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>::XclDpuController(std::string meta, xir::Attrs* attrs);
template XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>::XclDpuController(std::string meta, xir::Attrs* attrs);
template XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>::XclDpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
template XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>::XclDpuController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
template DeviceBuffer* XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>::get_device_buffer(vart::TensorBuffer *tb);
