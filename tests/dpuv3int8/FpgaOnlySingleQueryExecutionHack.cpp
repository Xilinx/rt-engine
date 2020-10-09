#include "tests.hpp"

FpgaOnlySingleQueryExecutionHack::FpgaOnlySingleQueryExecutionHack(std::string runner_dir) 
{


  runner_.reset(new vart::DpuRunner(runner_dir));
  
  std::cout<<"********************************"<<std::endl;
  std::cout<<"Loading 4 Images ..."<<std::endl;
  std::cout<<"Loading meta file from "<<runner_dir<<std::endl;

}

void FpgaOnlySingleQueryExecutionHack::run() {
  
  auto inputs = runner_->get_inputs();
  auto outputs = runner_->get_outputs();
  auto ret = runner_->execute_async(inputs, outputs);
  runner_->wait(uint32_t(ret.first), -1);

}

