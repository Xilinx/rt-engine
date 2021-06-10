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

class Test {
  virtual void run() = 0;
};

class SingleThreadTest : public Test {
  public:
    SingleThreadTest(unsigned num_queries);
    virtual void run();

  private:
    unsigned num_queries_;
};

class MultiThreadTest : public Test {
  public:
    MultiThreadTest(unsigned num_queries, unsigned num_threads);
    virtual void run();

  private:
    unsigned num_queries_;
    unsigned num_threads_;
};

class TimeoutTest : public Test {
  public:
    TimeoutTest(unsigned timeout_ms);
    virtual void run();

  private:
    unsigned timeout_ms_;
};
