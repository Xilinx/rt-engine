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

  // Load Params
  std::vector<int> paramsVec;
  auto params = subgraph->get_attr<std::vector<std::string>>("params");
  std::for_each(params.begin(), params.end(), [&](std::string& s){paramsVec.emplace_back(std::stol(s, nullptr, 16));});

  // TODO: Stop using weights_ and biases_
  // Load Weights
  weights_ = std::make_unique<IpuDeviceBuffer>(handle_.get(), 147456, XCL_BO_FLAGS_HOST_ONLY);
  std::memcpy(weights_->get_data(), paramsVec.data(), 147456);

  // Load Biases
  biases_ = std::make_unique<IpuDeviceBuffer>(handle_.get(), 256, XCL_BO_FLAGS_HOST_ONLY);
  std::memcpy(biases_->get_data(), paramsVec.data()+(147456/sizeof(int)), 256);
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
  auto weightsPaddr = weights_->get_phys_addr();
  auto biasesPaddr = biases_->get_phys_addr();

#define LAYER_PARAM_WORD_SIZE 16
#define TILE_PARAM_WORD_SIZE 7
#define LAYER_NUM_BE_LOAD 2
  uint inst[LAYER_NUM_BE_LOAD][LAYER_PARAM_WORD_SIZE] = {
      {114, 10, 128, 112, 8, 128, 3, 3, 1, 1, 0, 0, (uint)inputDeviceBuffers_[worker_id][0].get_phys_addr(), (uint)weightsPaddr, (uint)biasesPaddr,
          (uint)outputDeviceBuffers_[worker_id][0].get_phys_addr()},
      {10, 10, 128, 8, 8, 32, 3, 3, 1, 1, 0, 0, 0x10000, 0x20000, 0x30000,
          0x00000}};
  uint tile[LAYER_NUM_BE_LOAD][TILE_PARAM_WORD_SIZE] = {{2, 2, 2, 1, 1, 1, 4},
                                                        {2, 2, 2, 1, 1, 1, 4}};

  uint layer_num = 1U; // must <= LAYER_NUM_BE_LOAD;
  int inst_word_size = layer_num * (LAYER_PARAM_WORD_SIZE + TILE_PARAM_WORD_SIZE);

  {
    auto cmdp = reinterpret_cast<ert_start_kernel_cmd *>(execBufBOMap);
    memset(cmdp, 0, 4096);
    cmdp->state = ERT_CMD_STATE_NEW;
    cmdp->opcode = ERT_START_CU;
    cmdp->count = inst_word_size +2; // +1 for cu_mask, +1 for header
    cmdp->cu_mask = 1;
    int idx_p = 0;
    cmdp->data[idx_p++] = inst_word_size;   // total amount of data sent
    for (uint i = 0; i < layer_num; i++) {
      for (uint j = 0; j < LAYER_PARAM_WORD_SIZE; j++) {
        cmdp->data[idx_p++] = inst[i][j];
      }
      for (uint j = 0; j < TILE_PARAM_WORD_SIZE; j++) {
        cmdp->data[idx_p++] = tile[i][j];
      }
      printf("At the end idx_p = %d inst_word_size = %d \n", idx_p, inst_word_size);
    }

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
