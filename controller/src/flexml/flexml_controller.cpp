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

#include "ipuv1cnn_controller.hpp"
#include "vitis/ai/env_config.hpp" // For DEF_ENV_PARAM
#include <iostream>
#include <algorithm>
#include <numeric>
#include <cmath>
#include <cmath>
#include <limits>
typedef unsigned int uint;

DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")

namespace {
  // Convert Set to Vector
  std::vector<const xir::Tensor *> initTensorVec(const std::set<const xir::Tensor *> &tensorSet) {
    return {tensorSet.cbegin(), tensorSet.cend()};
  }

  // Convert float to int8 with rounding
  inline std::int8_t float2fix(float data) {
    static const int data_max = std::numeric_limits<std::int8_t>::max();
    static const int data_min = std::numeric_limits<std::int8_t>::min();
    float rlt;
    if (data > data_max) {
      rlt = data_max;
    } else if (data < data_min) {
      rlt = data_min;
    } else if (data < 0 && (data - floor(data)) == 0.5f) {
      rlt = std::ceil(data);
    } else {
      rlt = std::round(data);
    }
    return rlt;
  }

}

FlexmlController::FlexmlController(const xir::Subgraph *subgraph)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(subgraph),
    inTensors_(initTensorVec(subgraph->get_input_tensors())),
    outTensors_(initTensorVec(subgraph->get_output_tensors())),
    engine_(Engine::get_instance()),
    inputBuffers_(engine_.get_num_workers()),
    outputBuffers_(engine_.get_num_workers())
    {

  // Do our own resource allocation
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "FLEXML Controller: Loading XCLBIN";
  std::string xclbinPath(std::getenv("XLNX_VART_FIRMWARE"));
  device_ = xrt::device(0);
  auto xclbin = xrt::xclbin(xclbinPath);

  uuid_ = device_.load_xclbin(xclbin);
  pl_controller::pl_controller_sw_xrt pl_ctrl_sw(device_, uuid_);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "FLEXML Controller: Finished Loading XCLBIN";
 
 // TODO: Need an API to read buffer instead of filename
 // load ucode
 std::string ucodeFile = "./ucode.bin" ;
 int rc = pl_ctrl_sw.loadMicroCode(ucodeFile);
 
 std::string wtsFile = "./wts32.txt";
 std::ifstream wts_strm(wtsFile, std::ios::in);

 std::cout << "graph init...\n";
 ghdl_ = xrt::graph(device_, uuid_, "compute_graph");

  // Extract key XMODEL info
  for (auto& inTensor : inTensors_) {
    inputScales_.emplace_back(pow(2,inTensor->get_attr<std::int32_t>("fix_point")));
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
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Scale Factor: " << inputScales_.back();

  }
  for (auto& outTensor : outTensors_) {
    outputScales_.emplace_back(pow(2,-1*outTensor->get_attr<std::int32_t>("fix_point")));
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
    
    LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
      << "Scale Factor: " << outputScales_.back();
  }

  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Loading Model Instructions from XMODEL";
  auto instrs = subgraph->get_attr<std::vector<char>>("mc_code");
  instructions_ = xrt::bo(device_, instrs.size(), kernel_.group_id(5));
  std::memcpy(instructions_.map<int*>(), instrs.data(), instrs.size());
  instructions_.sync(XCL_BO_SYNC_BO_TO_DEVICE);
  numInstructions_ = instrs.size()/sizeof(int);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Finished Loading Model Instructions from XMODEL";

  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Loading Model Weights from XMODEL";
  //auto weights_vec = subgraph->get_attr<std::vector<char>>("weights");
  const int wts_size = 78848;
  weights_ = xrt::bo(device_, wts_size,0);
  auto weights_bo_map = weights_.map<uint32_t*>();
  for (int i = 0; i < wts_size / 4; i++) wts_strm >> std::hex >> weights_bo_map[i];
  pl_ctrl_sw.setAddress("compute_graph.wts_ddr", weights_.address());
  //std::memcpy(weights_.map<char*>(), weights_vec.data(), wts_size);
  weights_.sync(XCL_BO_SYNC_BO_TO_DEVICE, wts_size, 0);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Finished Loading Weights from XMODEL";

  // Determine buffer sizes


  // For each worker
  for (unsigned i=0; i < engine_.get_num_workers(); i++) {


    // Create input buffers
    for (auto& inTensor : inTensors_)
      inputBuffers_[i].emplace_back(
        device_, inTensor->get_data_size(),0
      );

    // Create output buffers
    for (auto& outTensor : outTensors_)
      outputBuffers_[i].emplace_back(
        device_, outTensor->get_data_size(), 0
      );
    
  }
}

void FlexmlController::copyInputs(const unsigned int wIdx, const std::vector<vart::TensorBuffer*> &inputs) {

  for (unsigned i = 0; i < inputs.size(); i++) {
  // TODO: Don't map XRT BO iteratively, do this statically in constructor 
    std::memcpy(inputBuffers_[wIdx][i].map<void*>(), reinterpret_cast<void *>(inputs[i]->data().first), inputs[i]->data().second);


    // Sync To Device
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

  // Copy inputs to Device
  copyInputs(wIdx, inputs);

  // Execute Kernel
 std::cout << "graph run...\n";
 ghdl_.run(1);
 rc = pl_ctrl_sw.run(aieBase);
    // wait done;
 rc = pl_ctrl_sw.wait(0);

 ghdl_.wait();
 ghdl_.end();
 std::cout << "Graph wait done" << std::endl;

  // Copy outputs from Device
  copyOutputs(wIdx, outputs);

}

std::vector<const xir::Tensor*> FlexmlController::get_input_tensors() const {return inTensors_;}
std::vector<const xir::Tensor*> FlexmlController::get_output_tensors() const {return outTensors_;}
std::vector<vart::TensorBuffer*> FlexmlController::get_inputs(int batchsz) {/*throw std::runtime_error("Error: get_inputs() is not yet supported by this DPU.");*/ return {};}
std::vector<vart::TensorBuffer*> FlexmlController::get_outputs(int batchsz) {/*throw std::runtime_error("Error: get_outputs() is not yet supported by this DPU.");*/ return {};}
std::vector<float> FlexmlController::get_input_scale() {return inputScales_;}
std::vector<float> FlexmlController::get_output_scale() {return outputScales_;}

FlexmlController::FlexmlController(std::string meta)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(meta),
      engine_(Engine::get_instance()) {
  throw std::runtime_error("Error: Meta json file flow not supported by this DPU.");
}
