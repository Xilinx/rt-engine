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

#include <chrono>
#include <iostream>
#include "engine.hpp"

/*
 * Engine Thread Pool
 * General purpose pool that can execute any std::function
 */

EngineThreadPool::EngineThreadPool() : terminate_(false) {
  const unsigned maxConcurrentTasks = 10000;
  const unsigned numWorkerThreads = 64;

  // init task ids and task status
  task_status_.resize(maxConcurrentTasks, EngineThreadPool::DONE);
  for (uint32_t i=0; i < maxConcurrentTasks; i++)
    task_ids_.enqueue(i);
  
  // spawn threads
  for (unsigned i=0; i < numWorkerThreads; i++)
  {
    threads_.emplace_back(std::thread([this]{run();}));
    thread_worker_ids_[threads_.back().get_id()] = i;
  }
}

EngineThreadPool::~EngineThreadPool() {
  // collect threads
  terminate_ = true;
  for (unsigned i=0; i < threads_.size(); i++)
    threads_[i].join();
}

uint32_t EngineThreadPool::enqueue(std::function<void()> task) {
  uint32_t id;
  task_ids_.wait_dequeue(id); // block until we get a free ID from the pool
  task_status_[id] = EngineThreadPool::NEW; // mark task "new"
  taskq_.enqueue(std::make_pair(id, task)); // send task for thread to execute
  return id;
}

void EngineThreadPool::wait(uint32_t id, int timeoutMs) {
  // wait for task to be done
  const auto waitInterval = (timeoutMs > 0) ? 
    std::chrono::milliseconds(timeoutMs) : std::chrono::seconds(5);
  const auto startTime = std::chrono::high_resolution_clock::now();

  {
    std::unique_lock<std::mutex> lock(status_mtx_);
    while (task_status_[id] != EngineThreadPool::DONE)
    {
      (void)status_cvar_.wait_for(lock, waitInterval);

      if (timeoutMs <= 0)
        continue; // no timeout requested, keep waiting

      auto currTime = std::chrono::high_resolution_clock::now();
      std::chrono::duration<double> elapsedTime
        = std::chrono::duration_cast<std::chrono::duration<double>>(
            currTime - startTime);

      if (elapsedTime.count()*1000 > timeoutMs)
        throw std::runtime_error("Error: task timeout: " + std::to_string(id));
    }
  }

  // return task id to id pool
  task_ids_.enqueue(id); 
}

void EngineThreadPool::run() {
  while (1) {
    // get new task from queue
    std::pair<int, std::function<void()> > task;
    bool found = taskq_.wait_dequeue_timed(task, std::chrono::milliseconds(5));
    if (!found)
    {
      // queue was empty
      if (terminate_)
        break;
      else
        continue;
    }

    // run task
    task_status_[task.first] = EngineThreadPool::RUNNING;
    task.second();

    // report task done
    {
      task_status_[task.first] = EngineThreadPool::DONE;
      std::unique_lock<std::mutex> lock(status_mtx_);
      status_cvar_.notify_all();
    }
  }
}

unsigned EngineThreadPool::get_worker_id(std::thread::id id) {
  auto it = thread_worker_ids_.find(id);
  if (it == thread_worker_ids_.end())
    throw std::runtime_error("Error: unknown worker thread id");
  return it->second;
}

/*
 * Engine
 */

Engine::Engine() {
}

Engine::~Engine() {
}

uint32_t Engine::submit(std::function<void()> task) {
  return tpool_.enqueue(task);
}

void Engine::wait(uint32_t id, int timeout_ms) {
  tpool_.wait(id, timeout_ms);
}

unsigned Engine::get_my_worker_id() {
  return tpool_.get_worker_id(std::this_thread::get_id());
}
