#pragma once

class Test {
  virtual void run() = 0;
};

class SingleThreadTest : public Test {
  public:
    SingleThreadTest(unsigned num_queries);
    virtual void run();

  private:
    unsigned num_queries_;
};

class MultiThreadTest : public Test {
  public:
    MultiThreadTest(unsigned num_queries, unsigned num_threads);
    virtual void run();

  private:
    unsigned num_queries_;
    unsigned num_threads_;
};

class TimeoutTest : public Test {
  public:
    TimeoutTest(unsigned timeout_ms);
    virtual void run();

  private:
    unsigned timeout_ms_;
};
