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
#include <string>
#include <iostream>
#include <xir/graph/subgraph.hpp> // xir::Subgraph
#include "dpu_controller.hpp" // XclDpuController
#include "engine.hpp" // Engine

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
  std::vector<std::unique_ptr<IpuContext>> contexts_;
  const xir::Subgraph *subgraph_; 
};