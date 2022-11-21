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

#include <memory>
#include <mutex>
#include <vector>

#include "dpu_controller.hpp"
#include "dpuv3int8_controller.hpp"
#include "dpuv3me_controller.hpp"
#include "dpuv4e_controller.hpp"
#include "xvdpu_controller.hpp"
#include "dpuv3e_controller.hpp"
#include "ipuv1cnn_controller.hpp"

class DpuControllerFactory {
  public:
    static DpuControllerFactory &get_instance() {
      static DpuControllerFactory instance;
      return instance;
    }

    /*
     * Get or create a DpuController for the selected kernel
     * First try to make a new DpuController (acquire a new CU) on each request
     * If no new CUs available, return existing DpuController
     * Note: currently only supports the same subgraph loaded on all CUs (TODO FIXME)
     */
    template <typename T>
    std::shared_ptr<DpuController> get(std::string kernel, T subgraph, xir::Attrs* attrs=nullptr);

  private:
    DpuControllerFactory() {}
    ~DpuControllerFactory() {}
};
