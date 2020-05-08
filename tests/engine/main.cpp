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

  return 0;
}
