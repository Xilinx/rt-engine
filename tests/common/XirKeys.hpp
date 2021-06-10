// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
