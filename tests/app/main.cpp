// Vitis API execute_async example
#include <chrono>
#include <iostream>
#include "tests.hpp"

int main(int argc, char** argv) {
  if (argc < 2) 
    throw std::runtime_error("Usage: app.exe path_to_meta.json");

  {
    const unsigned numQueries = 10000;
    std::cout << std::endl << "Testing single thread..." << std::endl;
    auto singleThreadTest = SingleThreadTest(argv[1], numQueries);
    auto t1 = std::chrono::high_resolution_clock::now();
    singleThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  {
    const unsigned numQueries = 50000;
    const unsigned numThreads = 100;
    std::cout << std::endl << "Testing multi thread (single runner)..." << std::endl;
    auto multiThreadSingleRunnerTest 
      = MultiThreadSingleRunnerTest(argv[1], numQueries, numThreads);
    auto t1 = std::chrono::high_resolution_clock::now();
    multiThreadSingleRunnerTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  {
    const unsigned numQueries = 50000;
    const unsigned numThreads = 2; /* numThreads == numRunners == numCUs */
    std::cout << std::endl << "Testing multi thread (multi runner)..." << std::endl;
    auto multiThreadMultiRunnerTest 
      = MultiThreadMultiRunnerTest(argv[1], numQueries, numThreads);
    auto t1 = std::chrono::high_resolution_clock::now();
    multiThreadMultiRunnerTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  return 0;
}
