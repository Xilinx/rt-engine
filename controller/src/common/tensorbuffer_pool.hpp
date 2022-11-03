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

#pragma once
#include "tensor_buffer_imp_host.hpp"
#include "tensor_buffer_imp_view.hpp"
#include "tensor_buffer_imp_host_phy.hpp"
#include <queue>
#include "blockingconcurrentqueue.hpp"
 class tensorbufferPool {
 public:
  std::pair<std::vector<vart::TensorBuffer*>, std::vector<vart::TensorBuffer*>> get_buffer(uint32_t id) {
    return queues[id];
  }
  uint32_t get() {
    uint32_t id;
    task_ids.wait_dequeue(id);
    return id;
  }

  explicit tensorbufferPool()  {
    size_=0;
  }
  void init_pool() {
    for (unsigned int i=0; i<size_; i++)
      task_ids.enqueue(i);
  }
  ~tensorbufferPool() {

  }
  void set_pool_size(size_t size) {
    size_ = size;
  }
  size_t get_pool_size() {
    return size_;
  }
  void extend (std::pair<std::vector<vart::TensorBuffer*>, std::vector<vart::TensorBuffer*>> buf) {
      queues.emplace_back(buf);
  }
  void free_id(uint32_t id) {
  
    task_ids.enqueue(id);
  
  }

  private:
    std::vector<std::pair<std::vector<vart::TensorBuffer*>, std::vector<vart::TensorBuffer*>>> queues;
    moodycamel::BlockingConcurrentQueue<uint32_t>  task_ids;
    size_t size_;
};
