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

#include <vector>
#include <cstring>
#include <string>
#include <iostream>
#include <iterator>
#include <memory>
#include <ert.h> // ert_start_kernel_cmd
#include <xir/graph/subgraph.hpp> // xir::Subgraph
#include "dpu_controller.hpp" // XclDpuController
#include "engine.hpp" // Engine
#include "device_memory.hpp" // IpuDeviceBuffer

/*!
 * @class Ipuv1CnnController
 *
 * @brief
 * Ipuv1CnnController is an object used to initialize the DPU, and provides a run method to run inference.
 */
class Ipuv1CnnController : public XclDpuController<IpuDeviceHandle, IpuDeviceBuffer, IpuDeviceBuffer> {
public:
  /**
   * Ipuv1CnnController() - Construct controller object from an XIR subgraph object
   *
   * @param subgraph: Subgraph object representing the instructions to execute
   */
  Ipuv1CnnController(const xir::Subgraph *subgraph);
  // NOT IMPLEMENTED
  Ipuv1CnnController(std::string meta);

  /**
   * ~Ipuv1CnnController() - Destroy controller object
   *
   */
  ~Ipuv1CnnController() = default;
  
  /**
   * run() - Run inference on a given vector of inputs
   *
   * @param inputs
   *  Pointers to input buffers as std::vector<vart::TensorBuffer*>
   * @param outputs
   *  Pointers to output buffers as std::vector<vart::TensorBuffer*>
   *
   * This function is executed by a thread in the rt-engine thread pool.
   * The function defines the sequence of steps required to run inference.
   * The thread will process the inputs provided, and return the results to the outputs buffer.
   */
  virtual void run(const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs) override;

protected:

  // Get Input/Output Tensors from subgraph
  std::set<const xir::Tensor *> inTensors_;
  std::set<const xir::Tensor *> outTensors_;

  // Reference to the engine
  Engine& engine_;

  // Create a context for each worker thread
  std::vector<std::unique_ptr<IpuContext>> contexts_;

  // Create input and output buffers for each worker thread
  // These are 2D vectors, first dimension being worker_id, second dimension being input_id
  // This is to support M workers and N inputs/outputs
  // Note that each device buffer is mapped to its own host pointer
  std::vector<std::vector<IpuDeviceBuffer>> inputDeviceBuffers_;
  std::vector<std::vector<IpuDeviceBuffer>> outputDeviceBuffers_;

  // Create Device Buffers for instructions and model parameters
  std::unique_ptr<IpuDeviceBuffer> weights_;
  std::unique_ptr<IpuDeviceBuffer> biases_;

  //std::unique_ptr<IpuDeviceBuffer> instructions_;
  //std::unique_ptr<IpuDeviceBuffer> parameters_;


};
