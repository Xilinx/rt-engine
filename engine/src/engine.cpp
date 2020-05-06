#include <iostream>
#include "engine.hpp"

/*
 * Engine Thread Pool
 */

EngineThreadPool::EngineThreadPool() : terminate_(false) {
  const unsigned maxConcurrentTasks = 1000;
  task_status_.resize(maxConcurrentTasks, EngineThreadPool::DONE);
  for (uint32_t i=0; i < maxConcurrentTasks; i++)
    task_ids_.enqueue(i);
  
  for (int i=0; i < 128; i++)
    threads_.emplace_back(std::thread([this]{run();}));
}

EngineThreadPool::~EngineThreadPool() {
  terminate_ = true;
  for (unsigned i=0; i < threads_.size(); i++)
    threads_[i].join();
}

uint32_t EngineThreadPool::enqueue(EngineTask *task) {
  uint32_t id;
  task_ids_.wait_dequeue(id);
  task_status_[id] = EngineThreadPool::NEW;
  taskq_.enqueue(std::make_pair(id, task));
  return id;
}

void EngineThreadPool::wait(uint32_t id) {
  {
    std::unique_lock<std::mutex> lock(status_mtx_);
    while (task_status_[id] != EngineThreadPool::DONE)
      cvar_.wait(lock);
  }
  task_ids_.enqueue(id);
}

void EngineThreadPool::run() {
  while (1) {
    // get new task
    std::pair<int, EngineTask*> task;
    bool found = taskq_.wait_dequeue_timed(task, std::chrono::milliseconds(5));
    if (!found)
    {
      if (terminate_)
        break;
      else
        continue;
    }

    task_status_[task.first] = EngineThreadPool::RUNNING;

    // run task
    (*task.second)();

    // report task done
    {
      std::unique_lock<std::mutex> lock(status_mtx_);
      task_status_[task.first] = EngineThreadPool::DONE;
      cvar_.notify_all();
    }
  }
}

/*
 * Engine
 */

Engine::Engine() {
    
}

Engine::~Engine() {
}

uint32_t Engine::submit(EngineTask *task) {
  return tpool_.enqueue(task);
}

void Engine::wait(uint32_t id) {
  tpool_.wait(id);
}
