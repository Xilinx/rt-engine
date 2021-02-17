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
#include <thread>
#include <vart/runner.hpp>
#include <xir/graph/graph.hpp>
#include <cstdlib>
#include <experimental/filesystem>
#include <algorithm>

namespace fs = std::experimental::filesystem;

void set_xlnx_vart_firmware() {
  if (fs::exists("/usr/lib/dpu.xclbin"))
    putenv("XLNX_VART_FIRMWARE=/usr/lib/dpu.xclbin");
  else if (fs::exists("/opt/xilinx/overlaybins/dpuv3int8"))
    putenv("XLNX_VART_FIRMWARE=/opt/xilinx/overlaybins/dpuv3int8");
  else
    throw std::runtime_error("Can't find any installed xclbins");
}

int create_runners(string xmodel, unsigned int numRunners) {

  set_xlnx_vart_firmware();

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];

  std::vector<std::unique_ptr<vart::Runner>> runners;
  std::vector<std::thread> threads(numRunners);

  try {
    for (unsigned ti = 0; ti < threads.size(); ti++)
      threads[ti] = std::thread([&] { runners.push_back(vart::Runner::create_runner(subgraph, "run")); });
    for (unsigned ti = 0; ti < threads.size(); ti++)
      threads[ti].join();
  }
  catch (...) {
    return EXIT_FAILURE;
  }
  return EXIT_SUCCESS;
}

// TODO: How to avoid hardcoding for dpuv3int8?
TEST(UnitTests, create_one_runner) {
  ASSERT_TRUE( create_runners("../../tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel", 1) == EXIT_SUCCESS );
}

TEST(UnitTests, create_four_runners) {
  EXPECT_TRUE( create_runners("../../tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel", 4) == EXIT_SUCCESS );
}

TEST(UnitTests, create_five_runners) {
  EXPECT_TRUE( create_runners("../../tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel", 5) == EXIT_SUCCESS );
}
