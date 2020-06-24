// Vitis API execute_async example
#include <algorithm>
#include <chrono>
#include <iostream>
#include "cxxopts.hpp"
#include "tests.hpp"

int main(int argc, char** argv) {
  cxxopts::Options options("AppTests", "Vitis application-level tests");
  options.add_options()
    ("r,runnermeta", "Path to DpuRunner meta.json", cxxopts::value<std::string>())
    ("t,tests", "Tests to run", cxxopts::value<std::vector<std::string>>()->default_value("st,mtsr,mtmr"))
    ;
  auto result = options.parse(argc, argv);
  if (!result.count("runnermeta"))
    throw std::runtime_error("Usage: app.exe -r path_to_runner_meta.json");

  const std::vector<std::string> tests = result["tests"].as<std::vector<std::string>>();
  const auto runnerMeta = result["runnermeta"].as<std::string>();

  if (std::find(tests.begin(), tests.end(), "st") != tests.end())
  {
    const unsigned numQueries = 10000;
    std::cout << std::endl << "Testing single thread..." << std::endl;
    SingleThreadTest singleThreadTest(runnerMeta, numQueries);
    auto t1 = std::chrono::high_resolution_clock::now();
    singleThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  if (std::find(tests.begin(), tests.end(), "mtsr") != tests.end())
  {
    const unsigned numQueries = 10000;
    const unsigned numThreads = 100;
    std::cout << std::endl << "Testing multi thread (single runner)..." << std::endl;
    MultiThreadTest multiThreadTest(runnerMeta, numQueries, numThreads, /*numRunners*/1);
    auto t1 = std::chrono::high_resolution_clock::now();
    multiThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  if (std::find(tests.begin(), tests.end(), "mtmr") != tests.end())
  {
    const unsigned numQueries = 10000;
    const unsigned numThreads = 100; 
    const unsigned numRunners = 2; 
    std::cout << std::endl << "Testing multi thread (multi runner)..." << std::endl;
    MultiThreadTest multiThreadTest(runnerMeta, numQueries, numThreads, numRunners);
    auto t1 = std::chrono::high_resolution_clock::now();
    multiThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  if (std::find(tests.begin(), tests.end(), "tc") != tests.end())
  {
    const unsigned numQueries = 4;
    std::cout << std::endl << "Test CLassify..." << std::endl;
    TestClassify testClassify(runnerMeta, numQueries);
    auto t1 = std::chrono::high_resolution_clock::now();
    testClassify.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }



  return 0;
}
