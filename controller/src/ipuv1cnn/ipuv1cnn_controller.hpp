// Copyright 2022 Xilinx Inc.
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
#include <cstdint>
#include <string>
#include <iostream>
#include <iterator>
#include <memory>
#include <xir/graph/subgraph.hpp> // xir::Subgraph
#include "dpu_controller.hpp" // XclDpuController
#include "engine.hpp" // Engine

#include <xrt/xrt_uuid.h>
#include <xrt/xrt_device.h>
#include <xrt/xrt_kernel.h>
#include <xrt/xrt_bo.h>

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
  
  /**
   * get_input_tensors() - Retrieve metadata regarding model inputs. i.e. shapes.
   *
   *  Return: A vector of pointers to Tensors. The tensors can be queried for metadata.
   *
   */
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  
  /**
   * get_output_tensors() - Retrieve metadata regarding model outputs. i.e. shapes.
   *
   *  Return: A vector of pointers to Tensors. The tensors can be queried for metadata.
   *
   */
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  
  /**
   * get_inputs() - Retrieve input tensor buffers
   *
   *  Return: A vector of pointers to TensorBuffers. The tensor buffers can be filled with input data.
   *
   */
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override; 
  
  /**
   * get_outputs() - Retrieve output tensor buffers
   *
   *  Return: A vector of pointers to TensorBuffers. The tensor buffers can be read by the user application.
   *
   */
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override; 
  
  /**
   * get_input_scale() - Retrieve input scale factors
   *
   *  Return: A vector of floats. Each float represents the scaling factor used to convert from float to int.
   *
   */
  virtual std::vector<float> get_input_scale() override; 
  
  /**
   * get_output_scale() - Retrieve output scale factors
   *
   *  Return: A vector of floats. Each float represents the scaling factor used to convert from int to float.
   *
   */
  virtual std::vector<float> get_output_scale() override; 

protected:

  // Get Input/Output Tensors from subgraph
  const std::vector<const xir::Tensor *> inTensors_;
  const std::vector<const xir::Tensor *> outTensors_;

  // Get Input/Output Scale Factors
  std::vector<float> inputScales_;
  std::vector<float> outputScales_;

  // Get Padding Parameters and Shape Info
  std::vector<std::vector<std::int32_t>> padding_; // Left, Right, Top, Bottom
  std::vector<std::vector<std::int32_t>> origInputShape_, origOutputShape_; // N, H, W, C
  std::vector<std::vector<std::int32_t>> paddedInputShape_, paddedOutputShape_; // N, H, W, C
  std::vector<std::int32_t> origInputSize_, origOutputSize_;

  // Reference to the engine
  Engine& engine_;

  // All workers will share
  xrt::device device_;
  xrt::kernel kernel_;
  xrt::uuid uuid_;
  xrt::bo parameters_;
  xrt::bo instructions_;

  // Create per worker thread resources
  std::vector<xrt::run> runners_; 
  std::vector<std::vector<xrt::bo>> inputBuffers_;
  std::vector<std::vector<xrt::bo>> outputBuffers_;
  std::vector<xrt::bo> intermediateBuffers_;

  size_t numInstructions_;
  std::int32_t interSize_;
  std::int32_t inputSize_;
  std::int32_t outputSize_;

  void copyInputs(const unsigned int, const std::vector<vart::TensorBuffer*> &);
  void copyOutputs(const unsigned int, const std::vector<vart::TensorBuffer*> &);
};
