#pragma once

#include <functional>

class Engine final {
  public:
    static const Engine &get_instance() {
      static Engine instance; // magic static is thread-safe in C++11
      return instance;
    }
    
    void submit(int id, std::function<void()> func) const;
    void wait(int id) const;

  private:
    Engine();
    ~Engine();
    Engine(const Engine&) = delete;
    Engine& operator=(const Engine&) = delete;
    Engine(Engine&&) = delete;
    Engine& operator=(Engine&&) = delete;
};
