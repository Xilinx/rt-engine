#include <unistd.h>
#include <thread>
#include "tests.hpp"

MultiThreadSingleRunnerTest::MultiThreadSingleRunnerTest(
  std::string runner_dir, unsigned num_queries, unsigned num_threads) 
 : num_queries_(num_queries), num_threads_(num_threads)
{
  runner_.reset(new DpuRunner(runner_dir));
}

static void run_thread(DpuRunner *runner, unsigned n) {
  auto inputs = runner->get_inputs();
  auto outputs = runner->get_outputs();

  for (unsigned i=0; i < n; i++)
  {
    auto ret = runner->execute_async(inputs, outputs);
    runner->wait(uint32_t(ret.first), -1);
  }
}

void MultiThreadSingleRunnerTest::run() {
  std::vector<std::thread> threads(num_threads_);

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti] = std::thread(run_thread, runner_.get(), num_queries_/num_threads_);

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}

MultiThreadMultiRunnerTest::MultiThreadMultiRunnerTest(
  std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners) 
 : num_queries_(nqueries), num_threads_(nthreads), num_runners_(nrunners)
{
  for (unsigned ti=0; ti < num_runners_; ti++)
    runners_.emplace_back(new DpuRunner(runner_dir));
}

void MultiThreadMultiRunnerTest::run() {
  std::vector<std::thread> threads(num_threads_);
  for (unsigned ti=0; ti < threads.size(); ti++)
  {
    auto ri = ti % runners_.size();
    threads[ti] = std::thread(run_thread, runners_[ri].get(), num_queries_/num_threads_);
  }

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}
