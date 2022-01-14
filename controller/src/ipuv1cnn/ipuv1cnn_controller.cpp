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
#include <iostream>
#include <algorithm>

typedef unsigned int uint;

Ipuv1CnnController::Ipuv1CnnController(const xir::Subgraph *subgraph)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(subgraph),
    inTensors_(subgraph->get_input_tensors()),
    outTensors_(subgraph->get_output_tensors()),
    engine_(Engine::get_instance()),
    inputBuffers_(engine_.get_num_workers()),
    outputBuffers_(engine_.get_num_workers())
    {

  // Do our own resource allocation
  std::string xclbinPath(std::getenv("XLNX_VART_FIRMWARE"));
  device_ = xrt::device(0);
  uuid_ = device_.load_xclbin(xclbinPath);
  kernel_ = xrt::kernel(device_, uuid_, "DPU"); // Kernel Name is DPU, this could change

  std::cout << "Loading Model Instructions from XMODEL" << std::endl;
  auto instrs = subgraph->get_attr<std::vector<char>>("mc_code");
  instructions_ = xrt::bo(device_, instrs.size(), kernel_.group_id(4));
  std::memcpy(instructions_.map<int*>(), instrs.data(), instrs.size());
  instructions_.sync(XCL_BO_SYNC_BO_TO_DEVICE);
  numInstructions_ = instrs.size()/sizeof(int);

  std::cout << "Loading Model Parameters from XMODEL" << std::endl;
  auto paramsMap = subgraph->get_attr<std::map<std::string, std::vector<char>>>("reg_id_to_parameter_value");
  auto &params = paramsMap["REG_0"];
  std::cout << "B: " << params[0] << std::endl;
  parameters_ = xrt::bo(device_, params.size(), XRT_BO_FLAGS_HOST_ONLY, kernel_.group_id(1));
  std::memcpy(parameters_.map<int*>(), params.data(), params.size());
  parameters_.sync(XCL_BO_SYNC_BO_TO_DEVICE);

  // Define Intermediate Buffer for DDR spill
  auto interSizeMap = subgraph->get_attr<std::map<std::string, int32_t>>("reg_id_to_size");
  auto &interSize = interSizeMap["REG_1"];
  intermediateBuffer_ = xrt::bo(device_, interSize, XRT_BO_FLAGS_HOST_ONLY, kernel_.group_id(3));

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
  
  }
}

void Ipuv1CnnController::run(const std::vector<vart::TensorBuffer*> &inputs,
                        const std::vector<vart::TensorBuffer*> &outputs) {

  const auto wIdx = engine_.get_my_worker_id();

  // Copy inputs to Device
  for (unsigned i = 0; i < inputs.size(); i++) {
    std::memcpy(inputBuffers_[wIdx][i].map<void*>(), reinterpret_cast<void *>(inputs[i]->data().first), inputs[i]->data().second);
    inputBuffers_[wIdx][i].sync(XCL_BO_SYNC_BO_TO_DEVICE);
  }

  // Execute Kernel
  runners_[wIdx](
      inputBuffers_[wIdx].back(), // Actually only supporting one input
      parameters_,
      outputBuffers_[wIdx].back(), // Actually only supporting one output
      intermediateBuffer_,
      instructions_,
      numInstructions_
  );
  runners_[wIdx].wait();

  // Copy outputs from Device
  for (unsigned i = 0; i < outputs.size(); i++) {
    outputBuffers_[wIdx][i].sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    std::memcpy(reinterpret_cast<void *>(outputs[i]->data().first), outputBuffers_[wIdx][i].map<void*>(), outputs[i]->data().second);
  }

}

Ipuv1CnnController::Ipuv1CnnController(std::string meta)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(meta),
      engine_(Engine::get_instance()) {
  throw std::runtime_error("Error: Meta json file flow not supported by this DPU.");
}
