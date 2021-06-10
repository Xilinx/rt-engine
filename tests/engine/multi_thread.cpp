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

#include <iostream>
#include <thread>
#include <vector>
//#include "runner.hpp"
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
