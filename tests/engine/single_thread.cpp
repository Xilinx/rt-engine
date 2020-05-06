#include <iostream>
#include <vector>
#include <vart/runner.hpp> 
#include "engine.hpp"
#include "tests.hpp"

SingleThreadTest::SingleThreadTest(unsigned num_queries) 
 : num_queries_(num_queries)
{
}

void SingleThreadTest::run() {
  Engine& engine = Engine::get_instance();

  std::vector<uint32_t> ids;
  unsigned doneIdx = 0;

  for (unsigned i=0; i < num_queries_; i++)
  {
    // fill the pipe
    const std::vector<vart::TensorBuffer*> inputs;
    const std::vector<vart::TensorBuffer*> outputs;
    ids.emplace_back(engine.submit([&inputs, &outputs]{ 
      inputs.size();
      outputs.size();
    }));

    // drain the pipe
    if (ids.size() >= 10)
      engine.wait(ids[doneIdx++]);
  }

  // drain what's left
  for (; doneIdx < ids.size(); doneIdx++)
    engine.wait(ids[doneIdx]);
}
