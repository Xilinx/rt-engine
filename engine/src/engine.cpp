#include <iostream>
#include "engine.hpp"

/*
 * Engine Thread Pool
 */

EngineThreadPool::EngineThreadPool() : terminate_(false) {
  const unsigned maxConcurrentTasks = 10000;
  const unsigned numWorkerThreads = 128;

  // init task ids and task status
  task_status_.resize(maxConcurrentTasks, EngineThreadPool::DONE);
  for (uint32_t i=0; i < maxConcurrentTasks; i++)
    task_ids_.enqueue(i);
  
  // spawn threads
  for (unsigned i=0; i < numWorkerThreads; i++)
    threads_.emplace_back(std::thread([this]{run();}));
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

void EngineThreadPool::wait(uint32_t id) {
  // wait for task to be done
  {
    std::unique_lock<std::mutex> lock(status_mtx_);
    while (task_status_[id] != EngineThreadPool::DONE)
      status_cvar_.wait(lock);
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

void Engine::wait(uint32_t id) {
  tpool_.wait(id);
}
