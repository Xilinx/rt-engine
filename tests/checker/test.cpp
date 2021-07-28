/*
 * Copyright 2021 Xilinx Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <gtest/gtest.h>
#include <string>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <vart/runner.hpp>
#include <xir/graph/graph.hpp>
#include "dpu_runner.hpp"

// This test verifies that a provided golden input will produce an output
//   that matches a provided golden output
//   please see the required environment variables below

class CheckerTest : public testing::Test {
protected:
  void SetUp() override {
    // Grab our required environment variables
    std::vector<std::string> environment = {
      "XLNX_VART_FIRMWARE",
      "XLNX_XMODEL",
      "XLNX_GOLDEN_INPUT",
      "XLNX_GOLDEN_OUTPUT"
    };
    for (auto& var : environment)
      env_[var] = std::string(std::getenv(var.c_str()));

    start_time_ = time(nullptr);
  }

  void TearDown() override {
    end_time_ = time(nullptr);
    EXPECT_TRUE(end_time_ - start_time_ <= 10000) << "The test took too long.";
  }

  time_t start_time_;
  time_t end_time_;
  std::map<std::string, std::string> env_;
};

int checker(const std::string& xmodel, const std::string& input_raw, const std::string& output_raw) {

  // Read in XMODEL
  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel);
  std::cout << "Loaded Graph: " << graph->get_name() << std::endl;

  // Get the First FPGA Subgraph
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = *std::find_if(subgraphs.begin(), subgraphs.end(), [](xir::Subgraph *sg) {
    return sg->get_attr<std::string>("device") == "DPU";
  });
  std::cout << "Running Subgraph: " << subgraph->get_name() << std::endl;

  // Create Runner
  auto vart_runner = vart::Runner::create_runner(subgraph, "run");
  auto runner = (vart::RunnerExt*)vart_runner.get();

  // Get TensorBuffer Vectors
  auto inputs = runner->get_inputs();
  auto outputs = runner->get_outputs();

  // Get Raw Data Pointers and sizes
  auto fpgaInput = (void*)inputs[0]->data().first;
  auto fpgaOutput = (void*)outputs[0]->data().first;
  auto inSize = inputs[0]->data().second;
  auto outSize = outputs[0]->data().second;

  // Load Golden Input into a vector
  std::ifstream ifs0(input_raw, std::ios::in | std::ios::binary);
  std::istreambuf_iterator<char> ibegin0(ifs0), iend0;
  std::vector<char> raw_input(ibegin0, iend0);

  // Load Golden Output into a vector
  std::ifstream ifs1(output_raw, std::ios::in | std::ios::binary);
  std::istreambuf_iterator<char> ibegin1(ifs1), iend1;
  std::vector<char> raw_output(ibegin1, iend1);

  // Copy Golden input bytes to input TensorBuffer
  std::memcpy(fpgaInput, raw_input.data(), inSize);

  // Run the FPGA
  auto ret = runner->execute_async(inputs, outputs);
  runner->wait(uint32_t(ret.first), 20000);

  // Load the FPGA output into a vector
  std::vector<char> fpga_output((char*)fpgaOutput,(char*)fpgaOutput+outSize);

  // Compare
  return fpga_output != raw_output;

}

TEST_F(CheckerTest, checker0) {
  EXPECT_TRUE(checker(env_["XLNX_XMODEL"], env_["XLNX_GOLDEN_INPUT"], env_["XLNX_GOLDEN_OUTPUT"]) == EXIT_SUCCESS);
}
