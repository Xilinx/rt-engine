#include <chrono>
#include <thread>
#include "engine.hpp"
#include "tests.hpp"

TimeoutTest::TimeoutTest(unsigned timeout_ms) : timeout_ms_(timeout_ms) {
}

void TimeoutTest::run() {
  Engine& engine = Engine::get_instance();
  auto id = engine.submit([this]{ 
    std::this_thread::sleep_for(
      std::chrono::milliseconds(timeout_ms_ + 100));
  });
  engine.wait(id, timeout_ms_);
}
