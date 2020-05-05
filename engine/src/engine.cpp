#include "engine.hpp"

Engine::Engine() {
}

Engine::~Engine() {
}

void Engine::submit(int id, std::function<void()> func) const {
  (void)id;
  func();
}

void Engine::wait(int id) const {
  (void)id;
}
