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
#include <vector>
//#include "vart/runner.hpp"
#include "vart/tensor_buffer.hpp"
//#include "runner.hpp"
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
    ids.emplace_back(engine.submit([this, &inputs, &outputs]{ 
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
