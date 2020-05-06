#include <iostream>
#include <thread>
#include <vector>
#include <vart/runner.hpp> 
#include "engine.hpp"
#include "tests.hpp"

MultiThreadTest::MultiThreadTest(unsigned num_queries, unsigned num_threads) 
  : num_queries_(num_queries), num_threads_(num_threads) {
}

static void run_thread(unsigned n) {
  SingleThreadTest(n).run();
}

void MultiThreadTest::run() {
  std::vector<std::thread> threads(num_threads_);

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti] = std::thread(run_thread, num_queries_/num_threads_);

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();
}
