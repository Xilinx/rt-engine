#include <iostream>
#include "engine.hpp"

/*
 * Engine Thread Pool
 */

EngineThreadPool::EngineThreadPool() : terminate_(false) {
  for (int i=0; i < 128; i++)
    threads_.emplace_back(std::thread([this]{run();}));
}

EngineThreadPool::~EngineThreadPool() {
  {
    std::unique_lock<std::mutex> lock(mtx_);
    terminate_ = true;
    cvar_.notify_all();
  }
   
  for (unsigned i=0; i < threads_.size(); i++)
    threads_[i].join();
}

void EngineThreadPool::enqueue(uint32_t id, std::function<void()> func) {
  std::unique_lock<std::mutex> lock(mtx_);

  if (tasks_.find(id) != tasks_.end())
    throw; // this ID is already in use

  taskq_.push(std::make_pair(id, func));
  tasks_[id] = EngineThreadPool::NEW;
  cvar_.notify_all();
}

void EngineThreadPool::wait(uint32_t id) {
  std::unique_lock<std::mutex> lock(mtx_);
  if (tasks_.find(id) == tasks_.end())
    throw; // unknown ID

  while (tasks_[id] != EngineThreadPool::DONE)
    cvar_.wait(lock);

  tasks_.erase(id);
}

void EngineThreadPool::run() {
  while (1) {
    // get new task
    std::pair<int, std::function<void()> > task;
    {
      std::unique_lock<std::mutex> lock(mtx_);
      while (taskq_.empty() && !terminate_)
        cvar_.wait(lock);

      if (terminate_)
        break;

      task = taskq_.front();
      taskq_.pop();
      tasks_[task.first] = EngineThreadPool::RUNNING;
    }

    // run task
    task.second();

    // report task done
    {
      std::unique_lock<std::mutex> lock(mtx_);
      tasks_[task.first] = EngineThreadPool::DONE;
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

void Engine::submit(uint32_t id, std::function<void()> func) {
  tpool_.enqueue(id, func);      
}

void Engine::wait(uint32_t id) {
  tpool_.wait(id);
}

