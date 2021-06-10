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

#include <condition_variable>
#include <functional>
#include <unordered_map>
#include <mutex>
#include <thread>
#include <vector>
#include "blockingconcurrentqueue.hpp"

class EngineThreadPool {
  public: 
    enum TaskState { NEW, RUNNING, DONE };

    EngineThreadPool();
    ~EngineThreadPool();

    uint32_t enqueue(std::function<void()> task);
    void wait(uint32_t id, int timeout_ms=-1);
    unsigned get_num_workers() const { return threads_.size(); }
    unsigned get_worker_id(std::thread::id); // get a thread's 0-indexed worker id

  private:
    void run();
    std::mutex status_mtx_;
    std::condition_variable status_cvar_;
    moodycamel::BlockingConcurrentQueue<std::pair<int, std::function<void()> > > taskq_;
    moodycamel::BlockingConcurrentQueue<uint32_t> task_ids_;
    std::vector<int> task_status_; // ID -> status
    std::atomic<bool> terminate_;
    std::vector<std::thread> threads_;
    std::unordered_map<std::thread::id, unsigned> thread_worker_ids_;
};

class Engine {
  public:
    static Engine &get_instance() {
      static Engine instance; // magic static is thread-safe in C++11
      return instance;
    }
    
    uint32_t submit(std::function<void()> task);
    void wait(uint32_t id, int timeout_ms=-1);
    unsigned get_num_workers() const { return tpool_.get_num_workers(); }
    unsigned get_my_worker_id(); // for task to get its 0-indexed worker id

  private:
    Engine();
    ~Engine();
    Engine(const Engine&) = delete;
    Engine& operator=(const Engine&) = delete;
    Engine(Engine&&) = delete;
    Engine& operator=(Engine&&) = delete;

    EngineThreadPool tpool_;
};
