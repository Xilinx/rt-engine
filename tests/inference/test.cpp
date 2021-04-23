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
      "XLNX_GOLD"
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


TEST_F(InferenceTest, classify_1_1) {
  unsigned num_queries = 1, num_threads = 1, num_runners = 1;
  bool verbose = true;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}

TEST_F(InferenceTest, classify_4_4) {
  unsigned num_queries = 4, num_threads = 4, num_runners = 4;
  bool verbose = true;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}

TEST_F(InferenceTest, res50_druOn_1cu_st_100img) {
  unsigned num_queries = 25, num_threads = 1, num_runners = 1;
  bool verbose = false;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}

TEST_F(InferenceTest, res50_druOn_1cu_st_1000img) {
  unsigned num_queries = 250, num_threads = 1, num_runners = 1;
  bool verbose = false;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}

TEST_F(InferenceTest, res50_druOn_1cu_st_10000img) {
  unsigned num_queries = 2500, num_threads = 1, num_runners = 1;
  bool verbose = false;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}

TEST_F(InferenceTest, res50_druOn_2cu_st_100img) {
  unsigned num_queries = 25, num_threads = 1, num_runners = 2;
  bool verbose = false;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}
TEST_F(InferenceTest, res50_druOn_2cu_st_1000img) {
  unsigned num_queries = 250, num_threads = 1, num_runners = 2;
  bool verbose = false;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}
TEST_F(InferenceTest, res50_druOn_2cu_st_10000img) {
  unsigned num_queries = 2500, num_threads = 1, num_runners = 2;
  bool verbose = false;
  Inference inference(env_["XLNX_XMODEL"], num_queries, num_threads, num_runners, env_["XLNX_IMAGE_DIR"], verbose,
                      env_["XLNX_SYNSET"], env_["XLNX_GOLD"]);
  EXPECT_TRUE(inference.run() == EXIT_SUCCESS);
}

