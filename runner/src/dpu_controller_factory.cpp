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

#include "dpu_controller_factory.hpp"

template <typename T>
std::shared_ptr<DpuController> DpuControllerFactory::get(std::string kernel, T subgraph, xir::Attrs* attrs) {

  if ( kernel == "DPUCADF8H")
  {
    const bool DPUV3INT8_DEBUGMODE =
      std::getenv("DPUV3INT8_DEBUGMODE") ? atoi(std::getenv("DPUV3INT8_DEBUGMODE")) == 1 : false;

    if(DPUV3INT8_DEBUGMODE==1)
      return std::make_shared<Dpuv3Int8DebugController>(subgraph);
    else
      return std::make_shared<Dpuv3Int8Controller>(subgraph);
  }
  else if (kernel == "DPUCVDX8H")
  {
    return std::make_shared<DpuV4eController>(subgraph, attrs);
  }
  else if (kernel == "DPUCAHX8L")
  {
    return std::make_shared<DpuV3meController>(subgraph,attrs);
  }
  else if (kernel == "DPUCAHX8H")
  {
    return std::make_shared<DpuV3eController>(subgraph, attrs);
  }
  else if (kernel == "IPUV1CNN" || kernel == "AMD_AIE2_4x5_Overlay")
  {
    return std::make_shared<Ipuv1CnnController>(subgraph);
  }
  else
    throw std::runtime_error("Error: no DpuController found for " + kernel);
}

// Force the compiler to generate DpuControllerFactory::get for xir::Subgraph and std::string types
template
std::shared_ptr<DpuController> DpuControllerFactory::get<const xir::Subgraph*>(std::string kernel, const xir::Subgraph* subgraph, xir::Attrs* attrs);
template
std::shared_ptr<DpuController> DpuControllerFactory::get<std::string>(std::string kernel, std::string, xir::Attrs* attrs);
