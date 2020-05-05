#pragma once

#include <condition_variable>
#include <functional>
#include <unordered_map>
#include <mutex>
#include <thread>
#include <vector>
#include <queue>

class EngineThreadPool final {
  public: 
    enum TaskState { NEW, RUNNING, DONE };

    EngineThreadPool();
    ~EngineThreadPool();

    void enqueue(uint32_t id, std::function<void()> func);
    void wait(uint32_t id);

  private:
    void run();
    std::mutex mtx_;
    std::condition_variable cvar_;
    std::queue<std::pair<int, std::function<void()> > > taskq_;
    std::unordered_map<uint32_t, int> tasks_; // { ID -> status }
    bool terminate_;

    std::vector<std::thread> threads_;
};

class Engine final {
  public:
    static Engine &get_instance() {
      static Engine instance; // magic static is thread-safe in C++11
      return instance;
    }
    
    void submit(uint32_t id, std::function<void()> func);
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

