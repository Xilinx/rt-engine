#include "dpu_controller_factory.hpp"

template <typename T>
std::shared_ptr<DpuController> DpuControllerFactory::get(std::string kernel, T subgraph) {

  if ( kernel == "DPUCADF8H" || kernel == "dpdpuv3_wrapper")
    // TODO/FIXME replace kernel name with standard name for dpuv3int8
    // e.g., DPUABC123XYZ
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
    return std::make_shared<DpuV4eController>(subgraph);
  }
  else if (kernel == "DPUCAHX8L")
  {
    return std::make_shared<DpuV3meController>(subgraph);
  }
  else if (kernel == "kernelSxdnn_0")
  {
    return std::make_shared<SampleDpuController>(subgraph);
  }
  else if (kernel == "DPUCAHX8H")
  {
    return std::make_shared<DpuV3eController>(subgraph);
  }
  else
    throw std::runtime_error("Error: no DpuController found for " + kernel);
}

template std::shared_ptr<DpuController>
DpuControllerFactory::get<const xir::Subgraph*>(std::string kernel, const xir::Subgraph* subgraph);
template std::shared_ptr<DpuController> 
DpuControllerFactory::get<std::string>(std::string kernel, std::string);
