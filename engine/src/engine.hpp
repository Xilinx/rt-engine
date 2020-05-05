#pragma once

class Engine final {
  public:
    static const Engine &get_instance() {
      static Engine instance; // magic static is thread-safe in C++11
      return instance;
    }
    
    void submit(int id);
    void wait(int id);

  private:
    Engine();
    ~Engine();
    Engine(const Engine&) = delete;
    Engine& operator=(const Engine&) = delete;
    Engine(Engine&&) = delete;
    Engine& operator=(Engine&&) = delete;
};
