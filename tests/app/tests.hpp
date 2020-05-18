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

class MultiThreadSingleRunnerTest : public Test {
  public:
    MultiThreadSingleRunnerTest(std::string runner_dir, unsigned num_queries, unsigned num_threads);
    virtual void run();

  private:
    unsigned num_queries_;
    unsigned num_threads_;
    std::unique_ptr<DpuRunner> runner_;
};

class MultiThreadMultiRunnerTest : public Test {
  public:
    MultiThreadMultiRunnerTest(std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners);
    virtual void run();

  private:
    unsigned num_queries_;
    unsigned num_threads_;
    unsigned num_runners_;
    std::vector<std::unique_ptr<DpuRunner>> runners_;
};
