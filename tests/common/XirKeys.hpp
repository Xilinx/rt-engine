#pragma once

#include <string>
#include <memory>
#include "dpu_runner.hpp"
#include <opencv2/opencv.hpp>
#include "json-c/json.h"
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>

class XirKeys {
public:
  explicit XirKeys(std::string xmodel);
  uint32_t getOutW() const;
  uint32_t getOutH() const;
  uint32_t getOutCh() const;
  uint32_t getInW() const;
  uint32_t getInH() const;
  uint32_t getInCh() const;
private:
  uint32_t inW_;
  uint32_t inH_;
  uint32_t inCh_;
  uint32_t outW_;
  uint32_t outH_;
  uint32_t outCh_;
};
