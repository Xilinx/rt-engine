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

namespace fs = std::experimental::filesystem;

/*
 * This Testcase will verify that a number of runners can be created in parallel
 */


std::string
configure() {
  std::string var_name("XLNX_VART_FIRMWARE=");
  std::vector<std::pair<std::string, std::string>> configs;

  // dpuv3int8 xclbin, xmodel pair
  configs.emplace_back(
    "/opt/xilinx/overlaybins/dpuv3int8",
    "../../tests/models/dpuv3int8/resnet50_handwritten.xmodel"
  );

  // TODO fix below, and add more configs
  // dpuv4e xclbin, xmodel pair
  configs.emplace_back(
    "/opt/xilinx/overlaybins/dpuv4e",
    "../../tests/models/dpuv4e/resnet50_handwritten.xmodel"
  );

  for (auto& config : configs) {
    if (fs::exists(config.first)) {
      auto env = var_name + config.first;
      char* envp = (char*)malloc(env.size());
      memcpy(envp,env.c_str(),env.size());
      putenv(envp);
      return config.second;
    }
  }

  throw std::runtime_error("Can't find any installed xclbins");
}

int
create_runners(unsigned int numRunners) {
  try {
  
    std::string xmodel = configure();

    std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel);
    std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
    auto subgraph = subgraphs[1];

    std::vector<std::unique_ptr<vart::Runner>> runners;
    std::vector<std::thread> threads(numRunners);

    for (auto& thread : threads)
      thread = std::thread([&] { runners.push_back(vart::Runner::create_runner(subgraph, "run")); });
    for (auto& thread : threads)
      thread.join();
  }
  catch (...) {
    return EXIT_FAILURE;
  }
  return EXIT_SUCCESS;
}

// TODO: How to avoid hardcoding for dpuv3int8?
TEST(UnitTests, create_one_runner) {
  ASSERT_TRUE( create_runners(1) == EXIT_SUCCESS );
}

TEST(UnitTests, create_four_runners) {
  EXPECT_TRUE( create_runners(4) == EXIT_SUCCESS );
}

TEST(UnitTests, create_five_runners) {
  EXPECT_TRUE( create_runners(5) == EXIT_SUCCESS );
}
