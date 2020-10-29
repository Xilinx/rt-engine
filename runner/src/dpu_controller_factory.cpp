#include "dpu_controller_factory.hpp"

template <typename T>
std::shared_ptr<DpuController> DpuControllerFactory::get(std::string kernel, T subgraph) {
  DpuController *newController = NULL;

  // first, try to allocate a new DpuController (acquire a new CU)
  // CUs will keep coming from our FPGA resource manager 
  //  as long as they are available
  // (this means if we have 8 FPGAs, if we keep instantiating DpuRunners, 
  //  we will automatically use all the FPGAs)
  try {
    if (kernel == "dpdpuv3_wrapper") 
    // TODO/FIXME replace kernel name with standard name for dpuv3int8 
    // e.g., DPUABC123XYZ
    {
      const bool DPUV3INT8_DEBUGMODE =
          std::getenv("DPUV3INT8_DEBUGMODE") ? atoi(std::getenv("DPUV3INT8_DEBUGMODE")) == 1 : false;
 
      if(DPUV3INT8_DEBUGMODE==1) 
          newController = new Dpuv3Int8DebugController(subgraph);
      else 
          newController = new Dpuv3Int8Controller(subgraph);
    }
    else if (kernel == "DPUCVDX8H") 
    {
      newController = new DpuV4eController(subgraph);
    }
    else if (kernel == "DPUCAHX8L")
    {
      newController = new DpuV3meController(subgraph);
    }
    else if (kernel == "kernelSxdnn_0")
    {
      newController = new SampleDpuController(subgraph);
    }
  }
  catch(...) {
    // failed to allocate new CU
    // FALLTHROUGH
  }

  if (newController)
  {
    // acquired new CU and created new DpuController
    // -- add it to our registry for this kernel
    // Note that we currently only support identical subgraph for all DpuControllers of this kernel
    /*  
     * This DpuControllerFactory stores a weak_ptr to the DpuController.
     * The shared_ptr of the DpuController is returned to the DpuRunners.
     * The last DpuRunner will release the DpuController when it gets destroyed.
     * The destroyed DpuController will show up as 'released' in the weak_ptrs here.
     */
    std::unique_lock<std::mutex> lock(mtx_);
    std::shared_ptr<DpuController> sp(newController);
    controllers_[kernel].emplace_back(sp);
    if (controller_share_idx_.find(kernel) == controller_share_idx_.end())
      controller_share_idx_[kernel] = 0;
    return controllers_[kernel].back().lock();
  }
  else
  {      
    // reuse existing controller, if any
    std::unique_lock<std::mutex> lock(mtx_);
    if (controller_share_idx_.find(kernel) != controller_share_idx_.end())
      for (unsigned i=0; i < controllers_[kernel].size(); i++)
      {
        const unsigned cidx = controller_share_idx_[kernel]++ % controllers_[kernel].size();
        if (auto sp = controllers_[kernel][cidx].lock())
          return sp;
      }
  }

  throw std::runtime_error("Error: no DpuController found for " + kernel);
}

template std::shared_ptr<DpuController> 
DpuControllerFactory::get<const xir::Subgraph*>(std::string kernel, const xir::Subgraph* subgraph);
template std::shared_ptr<DpuController> 
DpuControllerFactory::get<std::string>(std::string kernel, std::string);