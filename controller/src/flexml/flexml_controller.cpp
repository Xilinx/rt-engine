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

#include "flexml_controller.hpp"
#include "vitis/ai/env_config.hpp" // For DEF_ENV_PARAM
#include <iostream>
#include <algorithm>
#include <numeric>
#include <cmath>
#include <cmath>
#include <limits>
#include <fstream>
typedef unsigned int uint;
DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")

namespace {
  // Convert Set to Vector
  std::vector<const xir::Tensor *> initTensorVec(const std::set<const xir::Tensor *> &tensorSet) {
    return {tensorSet.cbegin(), tensorSet.cend()};
  }
}
xrt::uuid load_xclbin(xrt::device device){
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "FLEXML Controller: Loading XCLBIN";
  std::string xclbinPath(std::getenv("XLNX_VART_FIRMWARE"));
  auto xclbin = xrt::xclbin(xclbinPath);

  xrt::uuid uuid = device.load_xclbin(xclbin);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "FLEXML Controller: Finished Loading XCLBIN";
  return uuid;
}



FlexmlController::FlexmlController(const xir::Subgraph *subgraph, unsigned int device_index)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(subgraph),
    inTensors_(initTensorVec(subgraph->get_input_tensors())),
    outTensors_(initTensorVec(subgraph->get_output_tensors())),
    engine_(Engine::get_instance()),
    device_(xrt::device(0)),
    uuid_(load_xclbin(device_)),
    pl_ctrl_sw_(device_, uuid_),
    inputBuffers_(engine_.get_num_workers()),
    outputBuffers_(engine_.get_num_workers())
    {



    // FIXME use TinyYolo data
    int group_id = pl_ctrl_sw_.getGroupId();
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << "group_id=" << group_id ;


  // Extract key XMODEL info
  for (auto& inTensor : inTensors_) {
    paddedInputShape_.emplace_back(inTensor->get_shape());
    auto data_op = inTensor->get_producer();
    if(data_op->has_attr("origin_input_pad") && data_op->has_attr("origin_input_shape")) {
      padding_.emplace_back(data_op->get_attr<std::vector<std::int32_t>>("origin_input_pad"));
      origInputShape_.emplace_back(data_op->get_attr<std::vector<std::int32_t>>("origin_input_shape"));
    }
    else {
      padding_.emplace_back(std::vector<std::int32_t>{0, 0, 0, 0});
      origInputShape_.emplace_back(inTensor->get_shape());
    }

    origInputSize_.push_back(std::accumulate(origInputShape_.back().cbegin(), origInputShape_.back().cend(), 1, std::multiplies<>()));

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Input: " << inTensor->get_name();

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Shape: ";
    for (auto& el : origInputShape_.back())
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << " " << el;

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Padded Shape: ";
    for (auto& el : paddedInputShape_.back())
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << " " << el;

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Padding: ";
    for (auto& el : padding_.back())
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << " " << el;

  }
  for (auto& outTensor : outTensors_) {
    paddedOutputShape_.emplace_back(outTensor->get_shape());
    auto download_op = outTensor->get_producer();
    auto data_op = download_op->get_input_op("input");
    if(data_op->has_attr("actual_output_shape")) {
      origOutputShape_.emplace_back(data_op->get_attr<std::vector<std::int32_t>>("actual_output_shape"));
    }
    else {
      origOutputShape_.emplace_back(outTensor->get_shape());
    }

    origOutputSize_.push_back(std::accumulate(origOutputShape_.back().cbegin(), origOutputShape_.back().cend(), 1, std::multiplies<>()));

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Output: " << outTensor->get_name();

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Shape: ";
    for (auto& el : origOutputShape_.back())
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << " " << el;

    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Padded Shape: ";
    for (auto& el : paddedOutputShape_.back())
      LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << " " << el;

  }

  // Load instructions from xmodel
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Loading Model Instructions from XMODEL";
  auto mc_code = subgraph->get_attr<std::vector<char>>("mc_code");
  std::vector<uint8_t> xmodel_ucode;
  for(char byte:mc_code){
      xmodel_ucode.push_back((uint8_t)byte);
  }

  pl_ctrl_sw_.loadMicroCode(xmodel_ucode);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Finished Loading Model Instructions from XMODEL";
  
  // Load weights and weight offsets from xmodel 
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Loading Model Weights from XMODEL";
  auto weights_vec = subgraph->get_attr<std::vector<char>>("params");
  auto network = subgraph->get_attr<std::string>("network");
  weights_ = xrt::bo(device_, weights_vec.size(),group_id);
  auto weights_bo_map = weights_.map<uint32_t*>();
  std::vector<uint32_t> wts_ddr_offset = subgraph->get_attr<std::vector<uint32_t>>("wts_ddr_offset");
  for (uint32_t i = 0; i < wts_ddr_offset.size(); i++) {
        std::string name = "compute_graph."+ network +"_layers[" + std::to_string(i) + "].wts_ddr";
        pl_ctrl_sw_.setAddress(name, weights_.address() + wts_ddr_offset[i] * sizeof(uint32_t));
  }
  std::memcpy(weights_.map<char*>(), weights_vec.data(), weights_vec.size());
  // Debug 
     std::ofstream debugwtsFile("weights_dump.txt");
 
     for (unsigned int index=0;index< weights_vec.size()/4 ;index++){
         debugwtsFile << std::hex << weights_bo_map[index] << std::endl;
     }
     debugwtsFile.close();
  

  weights_.sync(XCL_BO_SYNC_BO_TO_DEVICE, weights_vec.size(), 0);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Finished Loading Weights from XMODEL";

  // Determine buffer sizes

  // For each worker
  for (unsigned i=0; i < engine_.get_num_workers(); i++) {


    // Create input buffers
    for (auto& inTensor : inTensors_){
      int inTensorCount = 0;
      inputBuffers_[i].emplace_back(
        device_, inTensor->get_data_size(),group_id
      );
      pl_ctrl_sw_.setAddress("compute_graph.ifm_ddr",inputBuffers_[i][inTensorCount].address());
      inTensorCount++;
    }

    // Create output buffers
    for (auto& outTensor : outTensors_){
      int outTensorCount = 0;
      outputBuffers_[i].emplace_back(
        device_, outTensor->get_data_size(), group_id
      );
      pl_ctrl_sw_.setAddress("compute_graph.ofm_ddr",outputBuffers_[i][outTensorCount].address());
      outTensorCount++;
    }
  }
}

void FlexmlController::copyInputs(const unsigned int wIdx, const std::vector<vart::TensorBuffer*> &inputs) {
  for (unsigned i = 0; i < inputs.size(); i++) {
  // TODO: Don't map XRT BO iteratively, do this statically in constructor
    std::memcpy(inputBuffers_[wIdx][i].map<void*>(), reinterpret_cast<void *>(inputs[i]->data().first), inputs[i]->data().second);
    // Sync To Device.
    inputBuffers_[wIdx][i].sync(XCL_BO_SYNC_BO_TO_DEVICE);
  }
}

void FlexmlController::copyOutputs(const unsigned int wIdx, const std::vector<vart::TensorBuffer*> &outputs) {
  
  for (unsigned i = 0; i < outputs.size(); i++) {

    // Sync From Device
    outputBuffers_[wIdx][i].sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    std::memcpy(reinterpret_cast<void *>(outputs[i]->data().first), outputBuffers_[wIdx][i].map<void*>(), outputs[i]->data().second);

  }
}

void FlexmlController::run(const std::vector<vart::TensorBuffer*> &inputs,
                             const std::vector<vart::TensorBuffer*> &outputs) {

  const auto wIdx = engine_.get_my_worker_id();
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << "Copy inputs.." ;
  // Copy inputs to Device
  copyInputs(wIdx, inputs);

  // Execute Kernel
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << "graph run...";
  pl_ctrl_sw_.enqueueGraphRun(1);
  pl_ctrl_sw_.enqueueRuntimeControl();
  pl_ctrl_sw_.enqueueGraphEnd();

  const uint64_t aieBase = 0x20000000000;
  pl_ctrl_sw_.run(aieBase);
  // Blocking call
  pl_ctrl_sw_.wait(0);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER)) << "Graph wait done" ;

  // Copy outputs from Device
  copyOutputs(wIdx, outputs);

}

std::vector<const xir::Tensor*> FlexmlController::get_input_tensors() const {return inTensors_;}
std::vector<const xir::Tensor*> FlexmlController::get_output_tensors() const {return outTensors_;}
std::vector<vart::TensorBuffer*> FlexmlController::get_inputs(int batchsz) {/*throw std::runtime_error("Error: get_inputs() is not yet supported by this DPU.");*/ return {};}
std::vector<vart::TensorBuffer*> FlexmlController::get_outputs(int batchsz) {/*throw std::runtime_error("Error: get_outputs() is not yet supported by this DPU.");*/ return {};}
std::vector<float> FlexmlController::get_input_scale() {return inputScales_;}
std::vector<float> FlexmlController::get_output_scale() {return outputScales_;}

FlexmlController::FlexmlController(std::string meta,unsigned int device_index)
: XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(meta),
engine_(Engine::get_instance()),
device_(xrt::device(0)),
uuid_(load_xclbin(device_)),
pl_ctrl_sw_(device_, uuid_) {
        throw std::runtime_error("Error: Meta json file flow not supported by this DPU.");
}
