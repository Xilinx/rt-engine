#include <unistd.h>
#include <thread>
#include "tests.hpp"
#include "vart/tensor_buffer.hpp"

MultiThreadTest::MultiThreadTest(
  std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners) 
 : num_queries_(nqueries), num_threads_(nthreads), num_runners_(nrunners), 
   runner_dir_(runner_dir), runners_(nrunners)
{
  std::vector<std::thread> threads(num_runners_);
  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti] = std::thread([this,ti]{init_thread(ti);});

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}

void MultiThreadTest::run() {
  std::vector<std::thread> threads(num_threads_);
  for (unsigned ti=0; ti < threads.size(); ti++)
  {
    auto ri = ti % runners_.size();
    threads[ti] = std::thread([this,ri]{run_thread(ri, num_queries_/num_threads_);});
  }

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}

void MultiThreadTest::init_thread(unsigned ridx) {
  runners_[ridx].reset(new vart::DpuRunner(runner_dir_));
}

void MultiThreadTest::run_thread(unsigned ridx, unsigned n) {
  auto runner = runners_[ridx].get();
  auto inputs = runner->get_inputs();
  auto outputs = runner->get_outputs();

  for (unsigned i=0; i < n; i++)
  {
    auto ret = runner->execute_async(inputs, outputs);
    runner->wait(uint32_t(ret.first), -1);
  }
}

