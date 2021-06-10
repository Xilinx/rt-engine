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

// Engine performance test
#include <chrono>
#include <iostream>
#include "tests.hpp"

int main() {
  const unsigned numQueries = 500000;
  const unsigned numThreads = 100;

  std::cout << std::endl << "Testing single thread..." << std::endl;
  auto t1 = std::chrono::high_resolution_clock::now();
  SingleThreadTest(numQueries).run();
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;

  std::cout << std::endl << "Testing multi thread..." << std::endl;
  t1 = std::chrono::high_resolution_clock::now();
  MultiThreadTest(numQueries, numThreads).run();
  t2 = std::chrono::high_resolution_clock::now();
  elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;

  const unsigned timeoutMs = 500;
  std::cout << std::endl << "Testing " << timeoutMs << "ms timeout..." << std::endl;
  t1 = std::chrono::high_resolution_clock::now();
  try {
    TimeoutTest(timeoutMs).run();
  } catch(std::runtime_error& e) {
    std::cout << "Exception caught: '" << e.what() << "'" << std::endl;
  }
  t2 = std::chrono::high_resolution_clock::now();
  elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;

  return 0;
}
