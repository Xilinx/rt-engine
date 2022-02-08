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

Ipuv1CnnController::Ipuv1CnnController(const xir::Subgraph *subgraph)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(subgraph),
    inTensors_(initTensorVec(subgraph->get_input_tensors())),
    outTensors_(initTensorVec(subgraph->get_output_tensors())),
    engine_(Engine::get_instance()),
    inputBuffers_(engine_.get_num_workers()),
    outputBuffers_(engine_.get_num_workers())
    {

  // Do our own resource allocation
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "IPU Controller: Loading XCLBIN";
  std::string xclbinPath(std::getenv("XLNX_VART_FIRMWARE"));
  device_ = xrt::device(0);
  uuid_ = device_.load_xclbin(xclbinPath);
  kernel_ = xrt::kernel(device_, uuid_, "DPU"); // Kernel Name is DPU, this could change
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "IPU Controller: Finished Loading XCLBIN";

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
  instructions_ = xrt::bo(device_, instrs.size(), kernel_.group_id(4));
  std::memcpy(instructions_.map<int*>(), instrs.data(), instrs.size());
  instructions_.sync(XCL_BO_SYNC_BO_TO_DEVICE);
  numInstructions_ = instrs.size()/sizeof(int);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Finished Loading Model Instructions from XMODEL";

  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Loading Model Parameters from XMODEL";
  auto paramsMap = subgraph->get_attr<std::map<std::string, std::vector<char>>>("reg_id_to_parameter_value");
  auto &params = paramsMap["REG_0"];
  parameters_ = xrt::bo(device_, params.size(), XRT_BO_FLAGS_HOST_ONLY, kernel_.group_id(1));
  std::memcpy(parameters_.map<int*>(), params.data(), params.size());
  parameters_.sync(XCL_BO_SYNC_BO_TO_DEVICE);
  LOG_IF(INFO, ENV_PARAM(DEBUG_DPU_CONTROLLER))
    << "Finished Loading Parameters from XMODEL";

  // Determine buffer sizes
  auto sizeMap = subgraph->get_attr<std::map<std::string, std::int32_t>>("reg_id_to_size");
  interSize_ = sizeMap["REG_1"];
  inputSize_ = sizeMap["REG_2"];
  outputSize_ = sizeMap["REG_3"];

  // For each worker
  for (unsigned i=0; i < engine_.get_num_workers(); i++) {

    // Create a runner
    runners_.emplace_back(kernel_);

    // Create input buffers
    for (auto& inTensor : inTensors_)
      inputBuffers_[i].emplace_back(
        device_, inTensor->get_data_size(), XRT_BO_FLAGS_HOST_ONLY, kernel_.group_id(0)
      );

    // Create output buffers
    for (auto& outTensor : outTensors_)
      outputBuffers_[i].emplace_back(
        device_, outTensor->get_data_size(), XRT_BO_FLAGS_HOST_ONLY, kernel_.group_id(2)
      );
    
    // Create intermediate buffers
    intermediateBuffers_.emplace_back(
      device_, interSize_, XRT_BO_FLAGS_HOST_ONLY, kernel_.group_id(3)
    );
  }
}

void Ipuv1CnnController::copyInputs(const unsigned int wIdx, const std::vector<vart::TensorBuffer*> &inputs) {

  for (unsigned i = 0; i < inputs.size(); i++) {
    
    #ifdef TEST_MODE
    std::memcpy(inputBuffers_[wIdx][i].map<void*>(), reinterpret_cast<void *>(inputs[i]->data().first), inputs[i]->data().second);
    #else // Do Padding // Quantize
    
    auto &padLeft = padding_[i][0];
    //auto &padRight = padding_[i][1];
    auto &padTop = padding_[i][2];
    //auto &padBottom = padding_[i][3];

    //auto &src_in = origInputShape_[i][0];
    auto &src_ih = origInputShape_[i][1];
    auto &src_iw = origInputShape_[i][2];
    auto &src_ic = origInputShape_[i][3];
  
    auto &dst_in = paddedInputShape_[i][0];
    auto &dst_ih = paddedInputShape_[i][1];
    auto &dst_iw = paddedInputShape_[i][2];
    auto &dst_ic = paddedInputShape_[i][3];

    auto inputIsFloat = inputs[i]->get_tensor()->get_data_type().type == xir::DataType::FLOAT;
    auto &scaleFactor = inputScales_[i];

    // Need to opimize this code to do work in one pass
    auto dst_array = inputBuffers_[wIdx][i].map<std::int8_t*>();
    memset((void*)dst_array, 0, dst_in*dst_ih*dst_iw*dst_ic); 

    auto src_array = reinterpret_cast<void*>(inputs[i]->data().first);
    
    auto src_idx = 0;
    for (auto h = 0; h < src_ih; ++h) {
      for (auto w = 0; w < src_iw; ++w) {
        for (auto c = 0; c < src_ic; ++c, ++src_idx) {
          auto dst_idx = (h + padLeft) * dst_iw * dst_ic + (w + padTop) * dst_ic + c;
          dst_array[dst_idx] = (inputIsFloat) ? float2fix(scaleFactor * ((float*)src_array)[src_idx]) : ((std::int8_t*)src_array)[src_idx];
        }
      }
    }
    #endif

    // Sync To Device
    inputBuffers_[wIdx][i].sync(XCL_BO_SYNC_BO_TO_DEVICE);
  }
}

void Ipuv1CnnController::copyOutputs(const unsigned int wIdx, const std::vector<vart::TensorBuffer*> &outputs) {

  for (unsigned i = 0; i < outputs.size(); i++) {

    // Sync From Device
    outputBuffers_[wIdx][i].sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    
    #ifdef TEST_MODE
    std::memcpy(reinterpret_cast<void *>(outputs[i]->data().first), outputBuffers_[wIdx][i].map<void*>(), outputs[i]->data().second);
    #else // Do Output Formatting

    auto outputIsFloat = outputs[i]->get_tensor()->get_data_type().type == xir::DataType::FLOAT;
    auto &scaleFactor = outputScales_[i];
    
    auto src_array = outputBuffers_[wIdx][i].map<std::int8_t*>();
    auto dst_array = reinterpret_cast<void*>(outputs[i]->data().first);

    for (std::int32_t j = 0; j < origOutputSize_[i]; ++j) {
      if (outputIsFloat)
        ((float*)dst_array)[j] = scaleFactor * src_array[j];
      else
        ((std::int8_t*)dst_array)[j] = src_array[j];
    }

    #endif
  }
}

void Ipuv1CnnController::run(const std::vector<vart::TensorBuffer*> &inputs,
                             const std::vector<vart::TensorBuffer*> &outputs) {

  const auto wIdx = engine_.get_my_worker_id();

  // Copy inputs to Device
  copyInputs(wIdx, inputs);

  // Execute Kernel
  runners_[wIdx](
      inputBuffers_[wIdx].back(), // Actually only supporting one input
      parameters_,
      outputBuffers_[wIdx].back(), // Actually only supporting one output
      intermediateBuffers_[wIdx],
      instructions_,
      numInstructions_
  );
  runners_[wIdx].wait();

  // Copy outputs from Device
  copyOutputs(wIdx, outputs);

}

Ipuv1CnnController::Ipuv1CnnController(std::string meta)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(meta),
      engine_(Engine::get_instance()) {
  throw std::runtime_error("Error: Meta json file flow not supported by this DPU.");
}
