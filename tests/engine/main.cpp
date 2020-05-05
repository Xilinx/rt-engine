// Engine performance test

#include <iostream>
#include <chrono>
#include <vart/runner.hpp> 
#include "engine.hpp"

int main() {
  Engine& engine = Engine::get_instance();
  int numQueries = 100000;
  auto t1 = std::chrono::high_resolution_clock::now();
  for (int i=0; i < numQueries; i++)
  {
    //const std::vector<vart::TensorBuffer*> inputs;
    //const std::vector<vart::TensorBuffer*> outputs;

    //engine.submit(i, [&inputs, &outputs]{ 
    //  inputs.size();
    //  outputs.size();
    //});
    
    engine.submit(i, []{});
  }
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::cout << "Elapsed: " << elapsed.count() << std::endl;
  std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  return 0;
}
