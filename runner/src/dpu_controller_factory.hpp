#pragma once

#include <memory>
#include <mutex>
#include <vector>

#include "dpu_controller.hpp"
#include "dpuv3int8_controller.hpp"
#include "dpuv3me_controller.hpp"
#include "dpuv4e_controller.hpp"
#include "dpuv3e_controller.hpp"

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
    std::shared_ptr<DpuController> get(std::string kernel, T subgraph);

  private:
    DpuControllerFactory() {}
    ~DpuControllerFactory() {}
};
