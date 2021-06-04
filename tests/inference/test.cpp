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
#include "Inference.hpp"

class InferenceTest : public testing::Test {
protected:
  void SetUp() override {
    // Grab our required environment variables
    std::vector<std::string> environment = {
      "XLNX_VART_FIRMWARE",
      "XLNX_XMODEL",
      "XLNX_IMAGE_DIR",
      "XLNX_SYNSET",
      "XLNX_GOLD",
      "XLNX_NUM_QUERIES",
      "XLNX_NUM_THREADS",
      "XLNX_NUM_RUNNERS",
      "XLNX_VERBOSE",
      "XLNX_CHECK_ACCURACY",
      "XLNX_CHECK_PERFORMANCE"
    };
    for (auto& var : environment)
    {
      if(std::getenv(var.c_str())!=NULL)
        env_[var] = std::string(std::getenv(var.c_str()));
      else
        std::cout<<var.c_str()<<" env var not set"<<std::endl;
    }

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


TEST_F(InferenceTest, classify) {

  Inference inference (
    env_["XLNX_XMODEL"], 
    static_cast<unsigned int>(std::stoul(env_["XLNX_NUM_QUERIES"])),
    static_cast<unsigned int>(std::stoul(env_["XLNX_NUM_THREADS"])),
    static_cast<unsigned int>(std::stoul(env_["XLNX_NUM_RUNNERS"])),
    env_["XLNX_IMAGE_DIR"],
    env_["XLNX_VERBOSE"] == "TRUE",
    env_["XLNX_SYNSET"],
    env_["XLNX_GOLD"],
    env_["XLNX_CHECK_ACCURACY"],
    env_["XLNX_CHECK_PERFORMANCE"]
  );
     
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);

}
