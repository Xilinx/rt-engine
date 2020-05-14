#pragma once 
#include <string>
#include <memory>
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
    std::unique_ptr<DpuRunner> runner_;
};
