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
    void wait(uint32_t id);

  private:
    void run();
    std::mutex status_mtx_;
    std::condition_variable status_cvar_;
    moodycamel::BlockingConcurrentQueue<std::pair<int, std::function<void()> > > taskq_;
    moodycamel::BlockingConcurrentQueue<uint32_t> task_ids_;
    std::vector<int> task_status_; // ID -> status
    std::atomic<bool> terminate_;
    std::vector<std::thread> threads_;
};

class Engine {
  public:
    static Engine &get_instance() {
      static Engine instance; // magic static is thread-safe in C++11
      return instance;
    }
    
    uint32_t submit(std::function<void()> task);
    void wait(uint32_t id);

  private:
    Engine();
    ~Engine();
    Engine(const Engine&) = delete;
    Engine& operator=(const Engine&) = delete;
    Engine(Engine&&) = delete;
    Engine& operator=(Engine&&) = delete;

    EngineThreadPool tpool_;
};
