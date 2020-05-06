// Engine performance test

#include <iostream>
#include <chrono>
#include <vector>
#include <vart/runner.hpp> 
#include "engine.hpp"

int main() {
  Engine& engine = Engine::get_instance();
  int numQueries = 100000;
  auto t1 = std::chrono::high_resolution_clock::now();
  EngineTask t;

  std::vector<uint32_t> ids;
  unsigned doneIdx = 0;

  for (int i=0; i < numQueries; i++)
  {
    ids.emplace_back(engine.submit(&t));
    if (ids.size() >= 500)
      engine.wait(ids[doneIdx++]);
  }
  for (; doneIdx < ids.size(); doneIdx++)
    engine.wait(ids[doneIdx]);

  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  return 0;
}
