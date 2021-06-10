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

#pragma once 
#include <string>
#include <memory>
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>
#include "dpu_runner.hpp"

class Test {
  virtual void run() = 0;
};

class SingleThreadTest : public Test {
  public:
    SingleThreadTest(std::string runner_dir, unsigned num_queries);
    virtual void run();

  private:
    unsigned num_queries_;
    std::unique_ptr<vart::DpuRunner> runner_;
};

class MultiThreadTest : public Test {
  public:
    MultiThreadTest(std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners);
    virtual void run();

  private:
    void init_thread(unsigned ridx);
    void run_thread(unsigned ridx, unsigned n);

    unsigned num_queries_;
    unsigned num_threads_;
    unsigned num_runners_;
    std::string runner_dir_;
    std::vector<std::unique_ptr<vart::DpuRunner>> runners_;
};

class TestClassify : public Test {
  public:
    TestClassify(std::string runner_dir, unsigned num_queries);
    virtual void run();
    void loadImages(); //TO-DO MNDBG
    void copy(std::vector<float>, std::vector<vart::TensorBuffer*>); //TO-DO MNDBG
  private:
    unsigned num_queries_;
    std::vector<std::vector<float>>images_; //TO-DO MNDBG
    std::unique_ptr<vart::DpuRunner> runner_;
};


