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

#include <algorithm>

typedef unsigned int uint;

Ipuv1CnnController::Ipuv1CnnController(const xir::Subgraph *subgraph)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(subgraph),
    inTensors_(subgraph->get_input_tensors()),
    outTensors_(subgraph->get_output_tensors()),
    engine_(Engine::get_instance()),
    inputDeviceBuffers_(engine_.get_num_workers()),
    outputDeviceBuffers_(engine_.get_num_workers())
    {

  // For each worker
  for (unsigned i=0; i < engine_.get_num_workers(); i++) {

    // Create a context
    contexts_.emplace_back(std::make_unique<IpuContext>(*handle_));

    // Create input device buffers
    for (auto& inTensor : inTensors_)
      inputDeviceBuffers_[i].emplace_back(handle_.get(), inTensor->get_data_size(), XCL_BO_FLAGS_HOST_ONLY);

    // Create output device buffers
    for (auto& outTensor : outTensors_)
      outputDeviceBuffers_[i].emplace_back(handle_.get(), outTensor->get_data_size(), XCL_BO_FLAGS_HOST_ONLY);
  }

  // Load Parameters
  std::vector<int> paramsVec;
  auto params = subgraph->get_attr<std::vector<std::string>>("params");
  std::for_each(params.begin(), params.end(), [&](std::string& s){paramsVec.emplace_back(std::stol(s, nullptr, 16));});
  parameters_ = std::make_unique<IpuDeviceBuffer>(handle_.get(), 4*paramsVec.size(), XCL_BO_FLAGS_HOST_ONLY);
  std::memcpy(parameters_->get_data(), paramsVec.data(), 4*paramsVec.size());
  parameters_->upload();

  //std::ofstream params_output_file("params.txt");
  //std::ostream_iterator<int> p_output_iterator(params_output_file, "\n");
  //std::copy(paramsVec.begin(), paramsVec.end(), p_output_iterator);

  // Load Instructions
  std::vector<int> instrVec;
  auto instrs = subgraph->get_attr<std::vector<std::string>>("mc_code");
  std::for_each(instrs.begin(), instrs.end(), [&](std::string& s){instrVec.emplace_back(std::stol(s, nullptr, 16));});
  instructions_ = std::make_unique<IpuDeviceBuffer>(handle_.get(), 4*instrVec.size(), XCL_BO_FLAGS_HOST_ONLY);
  std::memcpy(instructions_->get_data(), instrVec.data(), 4*instrVec.size());
  instructions_->upload();
  numInstructions_ = instrVec.size();
  
  //std::ofstream instr_output_file("instr.txt");
  //std::ostream_iterator<int> i_output_iterator(instr_output_file, "\n");
  //std::copy(instrVec.begin(), instrVec.end(), i_output_iterator);

  // Initialize DDR Buffer for activation spill
  auto interSize = subgraph->get_attr<std::int32_t>("inter_size");
  intermediate_ = std::make_unique<IpuDeviceBuffer>(handle_.get(), interSize, XCL_BO_FLAGS_HOST_ONLY);
}

void Ipuv1CnnController::run(const std::vector<vart::TensorBuffer*> &inputs,
                        const std::vector<vart::TensorBuffer*> &outputs) {

  const unsigned worker_id = engine_.get_my_worker_id();
  auto handle = contexts_[worker_id]->get_dev_handle();
  auto execBufBO = contexts_[worker_id]->get_bo_handle();
  auto execBufBOMap = contexts_[worker_id]->get_bo_addr();

  // Copy inputs to Device
  for (unsigned i = 0; i < inputs.size(); i++) {
    std::memcpy(inputDeviceBuffers_[worker_id][i].get_data(), reinterpret_cast<void *>(inputs[i]->data().first), inputs[i]->data().second);
    inputDeviceBuffers_[worker_id][i].upload();
  }

  // Send convolution params via ERT command queue
  auto inputPaddr = inputDeviceBuffers_[worker_id][0].get_phys_addr();   // Hardcoded to input 0, only single input supported
  auto outputPaddr = outputDeviceBuffers_[worker_id][0].get_phys_addr(); // Hardcoded to output 0, only single output supported
  auto parametersPaddr = parameters_->get_phys_addr();
  auto instructionsPaddr = instructions_->get_phys_addr();
  auto intermediatePaddr = intermediate_->get_phys_addr();

  {
    auto cmdp = reinterpret_cast<ert_start_kernel_cmd *>(execBufBOMap);
    memset(cmdp, 0, 4096);
    cmdp->state = ERT_CMD_STATE_NEW;
    cmdp->opcode = ERT_START_CU;
    cmdp->count = 12; // +1 for cu_mask, +10 for addresses, +1 for instr size
    cmdp->cu_mask = 1;
    int idx_p = 0;
    cmdp->data[idx_p++] = inputPaddr & 0xFFFFFFFF;   // ifm_lo
    cmdp->data[idx_p++] = inputPaddr >> 32;   // ifm_hi
    cmdp->data[idx_p++] = parametersPaddr & 0xFFFFFFFF;   // param_lo
    cmdp->data[idx_p++] = parametersPaddr >> 32;   // param_hi
    cmdp->data[idx_p++] = outputPaddr & 0xFFFFFFFF;   // ofm_lo
    cmdp->data[idx_p++] = outputPaddr >> 32;   // ofm_hi
    cmdp->data[idx_p++] = intermediatePaddr & 0xFFFFFFFF;   // inter_lo
    cmdp->data[idx_p++] = intermediatePaddr >> 32;   // inter_hi
    cmdp->data[idx_p++] = instructionsPaddr & 0xFFFFFFFF;   // instr_lo
    cmdp->data[idx_p++] = instructionsPaddr >> 32;   // instr_hi
    cmdp->data[idx_p++] = numInstructions_;

    printf("In %s sending ERT_START_CU command\n", __func__);
    xclExecBuf(handle, execBufBO);
    // wait for command to complete
    while (cmdp->state < ERT_CMD_STATE_COMPLETED)
      while (xclExecWait(handle,1000)==0) ;
    printf("In %s START_CU command done\n", __func__);
  }

  // Copy outputs from Device
  for (unsigned i = 0; i < outputs.size(); i++) {
    outputDeviceBuffers_[worker_id][i].download();
    std::memcpy(reinterpret_cast<void *>(outputs[i]->data().first), outputDeviceBuffers_[worker_id][i].get_data(), outputs[i]->data().second);
  }

}

Ipuv1CnnController::Ipuv1CnnController(std::string meta)
  : XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer>(meta),
      engine_(Engine::get_instance()) {
  throw std::runtime_error("Error: Meta json file flow not supported by this DPU.");
}
