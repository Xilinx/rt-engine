#include "tests.hpp"

TestClassify::TestClassify(std::string runner_dir, unsigned num_queries, std::string img_dir, const bool goldenAvailable, const bool verbose) 
 : num_queries_(num_queries)
{

  cpuUtilobj_.reset(new cpuUtil(runner_dir, goldenAvailable, verbose, img_dir, num_queries_));

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runner_.reset(new vart::DpuRunner(subgraph));
  
  std::cout<<"********************************"<<std::endl;
 
  if(not cpuUtilobj_->getDebugMode())
    std::cout<<"Loading "<<num_queries_*4<<" Images ..."<<std::endl;
  else
  {
    std::cout<<"Debug Mode ON"<<std::endl;
    std::cout<<"Loading meta file from "<<runner_dir<<std::endl;
  }

}

void TestClassify::run() {

  /*Notes: get_inputs() creates a tensorbuffer and a corresponding
   *devicebuffer. Tensorbuffer holds memory on host with size specified.
   *Devicebuffer is created for the corresponding tensorbuffer, a 1-1 map
   *is established between tensorbuffer and devicebuffer. get_inputs()
   *would create tensorbuffer, corresponding devicebuffer. Actual data may
   *or may not be filled at this stage. The main purpose of get_inputs()
   *is to allocate host memory and device memory and keep it reserved, so
   *that this memory can be reused for several images.
   */

  auto inputs = runner_->get_inputs();
  
  /*Notes: get_outputs() creates tensorbuffer and corresponding
   *devicebuffer for output size.
   */


  auto outputs = runner_->get_outputs();

  for (unsigned i=0; i < num_queries_; i++)
  {
    
    /*TO-DO MNDBG: copy data from images_[i] to inputs tensorbuffer,
     *this inputs tensorbuffer can be used to store standard tensors.
     *Later, when wo go to dpuv3int8 specific controller file, there
     *we can convert the standard tensorbuffer to ddr 32bit space
     *aligned tensorbuffer.
     */

    /*Notes: tensorbuffer basically holds a block of memory of a
     *certain size. We can keep reusing the same block fo memory
     *as we loop through all images. each tensorbuffer has a 1-1
     *mapping to devicebuffer. So, using get_inputs(), we would
     *allocate a given size of tensorbuffer on host side and
     *equivalent device buffer and store this as 1-1 map. We keep
     *reusing this tensorbuffer to process images.
     */

    
    cpuUtilobj_->fillInData(i, inputs);
    auto ret = runner_->execute_async(inputs, outputs);
    runner_->wait(uint32_t(ret.first), -1);
    cpuUtilobj_->postProcess(outputs, i);
  }
  
  cpuUtilobj_->printtop1top5(num_queries_);

}

