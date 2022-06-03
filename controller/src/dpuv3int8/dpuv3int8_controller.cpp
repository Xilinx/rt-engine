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

#include <xrt.h>
#include "engine.hpp"
#include "dpuv3int8_controller.hpp"
#include <mutex>


#define BATCH_SIZE 4

using namespace std;
std::mutex globalMutex;

Dpuv3Int8Controller::Dpuv3Int8Controller(std::string meta, xir::Attrs* attrs) : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(meta, attrs) {

  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));
  inputsTBfs_.resize(engine.get_num_workers());
  outputsTBfs_.resize(engine.get_num_workers());
  xmodel_.reset(new Xmodel(meta, false));

  initializeTensors(); 
  initializeTaskDRUVariables();
  initCreateBuffers();
}

Dpuv3Int8Controller::Dpuv3Int8Controller(const xir::Subgraph *subgraph, xir::Attrs* attrs) : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(subgraph, attrs)
{

  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));
  inputsTBfs_.resize(engine.get_num_workers());
  outputsTBfs_.resize(engine.get_num_workers());
  xmodel_ = std::make_unique<Xmodel>(subgraph, attrs, false);
 
  initializeTensors();
  initializeTaskDRUVariables();
  initCreateBuffers();
}

void Dpuv3Int8Controller::initializeTensors()
{
    const std::vector<std::int32_t> indims = { BATCH_SIZE, int32_t(xmodel_->getInH()), int32_t(xmodel_->getInW()), int32_t(xmodel_->getInCh())};
    std::vector<std::int32_t> inHwDims = { int32_t(BATCH_SIZE*xmodel_->getInH()*xmodel_->getInW()*xmodel_->getInCh())};
    if(!xmodel_->getDruMode())
      inHwDims = { int32_t(xmodel_->getInH()*xmodel_->getInW()*BATCH_SIZE*ceil((float)xmodel_->getInCh()/16)*16)};
    const std::vector<std::int32_t> outHwDims = { BATCH_SIZE, 1, 1, int32_t(xmodel_->getOutDdrSize())};
   
    xir::Tensor *in_t = xir::Tensor::create(xmodel_->getInTensorsNames()[0], indims, xir::DataType{xir::DataType::XINT, 8}).release();
    xir::Tensor *in_hw = xir::Tensor::create("inputHw", inHwDims, xir::DataType{xir::DataType::XINT, 8}).release();
    xir::Tensor *op_hw = xir::Tensor::create("outputHw", outHwDims, xir::DataType{xir::DataType::XINT, 8}).release();
    
    in_tensor_.reset(in_t);
    in_tensor_->set_attr<std::int32_t>("fix_point", xmodel_->get_input_fix_point_values()[0]); 
    in_hw_tensor_.reset(in_hw);
    out_hw_tensor_.reset(op_hw);
    
    for(uint32_t k=0; k<xmodel_->getOutputNum(); k++)
    {
      std::vector<std::int32_t> outputdims = { BATCH_SIZE, xmodel_->getOutTensorsDims()[k][1], xmodel_->getOutTensorsDims()[k][0], xmodel_->getOutTensorsDims()[k][2]};
      xir::Tensor *outputOp = xir::Tensor::create(xmodel_->getOutTensorsNames()[k], outputdims, xir::DataType{xir::DataType::XINT, 8}).release();
      std::unique_ptr<xir::Tensor> outtensor;
      outtensor.reset(outputOp);
      outtensor->set_attr<std::int32_t>("fix_point", xmodel_->get_output_fix_point_values()[k]);
      out_tensors_.push_back(std::move(outtensor));
    }

}

Dpuv3Int8Controller::~Dpuv3Int8Controller() {}

void Dpuv3Int8Controller::runKernel(ert_start_kernel_cmd* ecmd, uint64_t* buf_addr, uint32_t* reg_val, xclDeviceHandle xcl_handle, xclBufferHandle bo_handle)
{
  ecmd->cu_mask = handle_->get_device_info().cu_mask;
  ecmd->extra_cu_masks = 0;
  ecmd->stat_enabled = 1;
  ecmd->state = ERT_CMD_STATE_NEW;
  ecmd->opcode = ERT_EXEC_WRITE;
  ecmd->type = ERT_CTRL;

  std::vector<std::pair<int, int> > regVals;
  regVals.push_back({CONTROL_ADDR_BLOCK_INSTR ,(buf_addr[BUF_IDX_INSTR]) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_INSTR + 0x4 ,((buf_addr[BUF_IDX_INSTR]) >> 32) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_PARAMS ,(buf_addr[BUF_IDX_PARAMS]) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_PARAMS + 0x4 ,((buf_addr[BUF_IDX_PARAMS]) >> 32) & 0xFFFFFFFF});
  
  regVals.push_back({CONTROL_ADDR_BLOCK_SWAP ,(buf_addr[BUF_IDX_SWAP]) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_SWAP + 0x4 ,((buf_addr[BUF_IDX_SWAP]) >> 32) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_RSLT ,(buf_addr[BUF_IDX_RESULT]) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_RSLT + 0x4 ,((buf_addr[BUF_IDX_RESULT]) >> 32) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_SRC ,(buf_addr[BUF_IDX_SRC]) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_SRC + 0x4 ,((buf_addr[BUF_IDX_SRC]) >> 32) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_DST ,(buf_addr[BUF_IDX_DST]) & 0xFFFFFFFF});
  regVals.push_back({CONTROL_ADDR_BLOCK_DST + 0x4 ,((buf_addr[BUF_IDX_DST]) >> 32) & 0xFFFFFFFF});

  regVals.push_back({CONTROL_ADDR_TASK_DRU_ADDR_STRD ,reg_val[REG_IDX_TASK_DRU_ADDR_STRD]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_KW ,reg_val[REG_IDX_TASK_DRU_KW]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_SW ,reg_val[REG_IDX_TASK_DRU_SW]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_IC ,reg_val[REG_IDX_TASK_DRU_IC]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_OW ,reg_val[REG_IDX_TASK_DRU_OW]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_OH ,reg_val[REG_IDX_TASK_DRU_OH]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_SRC_NTRANS ,reg_val[REG_IDX_TASK_DRU_SRC_NTRANS]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_DST_NTRANS ,reg_val[REG_IDX_TASK_DRU_DST_NTRANS]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_PL_CORR	,reg_val[REG_IDX_TASK_DRU_PL_CORR]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_PR_CORR	,reg_val[REG_IDX_TASK_DRU_PR_CORR]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_IW_CORR	,reg_val[REG_IDX_TASK_DRU_IW_CORR]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_SW_CORR	,reg_val[REG_IDX_TASK_DRU_SW_CORR]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_WCG_CORR ,reg_val[REG_IDX_TASK_DRU_WCG_CORR]});
  regVals.push_back({CONTROL_ADDR_TASK_DRU_READ_MODE ,reg_val[REG_IDX_TASK_DRU_READ_MODE]});
  regVals.push_back({CONTROL_ADDR_TASK_MODE ,reg_val[REG_IDX_TASK_MODE]});
  regVals.push_back({CONTROL_ADDR_REG_AXCACHE_AXOS	,reg_val[REG_IDX_REG_AXCACHE_AXOS]});

  int p = 6;
  for (unsigned i=0; i < regVals.size(); i++) {
    ecmd->data[p++] = (regVals[i].first);
    ecmd->data[p++] = (regVals[i].second);
  }
  ecmd->count = 1 + p; 

  
  const bool XLNX_EMIT_PROFILING_INFO = std::getenv("XLNX_EMIT_PROFILING_INFO") ? atoi(std::getenv("XLNX_EMIT_PROFILING_INFO")) == 1:false;
  
  
  auto t1 = std::chrono::high_resolution_clock::now();

    // exec kernel
  auto exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
  if (exec_buf_result)
    throw std::runtime_error("Error: xclExecBuf failed");

  // wait for kernel
  for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0 
          && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);
          
  if (ecmd->state != ERT_CMD_STATE_COMPLETED)
    std::cout << "Error: CU timeout " << std::endl;
  
  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;

  if(XLNX_EMIT_PROFILING_INFO==1)
  {
    std::cout<<"Kernel time(milliseconds): "<< elapsed.count()*1000 <<std::endl;
  }
}

void Dpuv3Int8Controller::readRegs(xclDeviceHandle xcl_handle)
{
  std::cout<<"--------------------------------------------------------"<<std::endl;
  std::cout<<"CU BASE ADDR: "<<handle_->get_device_info().cu_base_addr<<std::endl;
  std::cout << "VERSION: " << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x07C) << std::endl;
  std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x098) << std::endl;
  std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0A8) << std::endl;
  std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x09C) << std::endl;
  std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0AC) << std::endl;
  std::cout << "CONV START:" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0A0) << std::endl;
  std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0B0) << std::endl;
  std::cout << "MISC START:" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0A4) << std::endl;
  std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0B4) << std::endl;
  std::cout << "DPU STATUS :" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0B8) << std::endl;
  std::cout << "DRU STATUS :" << read32_dpu_reg(xcl_handle,  handle_->get_device_info().cu_base_addr+ 0x0BC) << std::endl;
  std::cout<<"----------------------------------------------------------"<<std::endl;

}

// xclRead is deprecated
// Not sure what the replacement will be
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
uint32_t Dpuv3Int8Controller::read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
  uint32_t val;
  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
  return val;
}
#pragma GCC diagnostic pop

void Dpuv3Int8Controller::initializeTaskDRUVariables()
{
    if(xmodel_->getDruMode())
    {
      uint32_t druAddr = xmodel_->getInDdrSize();
      uint32_t kW = xmodel_->getChannelAugmentationMode()?xmodel_->getInKernelW():1;
      uint32_t sW = xmodel_->getChannelAugmentationMode()?xmodel_->getInStrdW():1;
      uint32_t inCh = xmodel_->getInCh();
      uint32_t inH = xmodel_->getInH();
      uint32_t inW = xmodel_->getInW();
      uint32_t padL = xmodel_->getChannelAugmentationMode()?xmodel_->getPadLft():0;
      uint32_t padR = xmodel_->getChannelAugmentationMode()?xmodel_->getPadRgt():0;
      uint32_t outW = ((inW+padL+padR-kW)/sW)+1;
      uint32_t dru_read_mode = 0;
      if (kW==7 && inCh == 3)
        dru_read_mode = 2;
      else if (kW*inCh<=16)
        dru_read_mode = 1;
      else
        dru_read_mode = 0;

  
      if(kW<1 || kW>16)
        throw std::runtime_error("Error: 'inKernelW' supported range is 1-16, given value is not in this range");
      if(sW<1 || sW>16)
        throw std::runtime_error("Error: 'inStrdW' supported range is 1-16, given value is not in this range");
      if(inCh<1 || inCh>65536)
        throw std::runtime_error("Error: 'inCh' supported range is 1-2^16, given value is not in this range");
      if(inH<1 || inH>65536)
        throw std::runtime_error("Error: 'inH' supported range is 1-2^16, given value is not in this range");
  
      
      uint32_t wcgCorr = 0;
      if(dru_read_mode!=0)
        wcgCorr = outW*std::ceil((float)(inCh*kW)/(float)16);
      else
        wcgCorr = (int) std::nan("1");
      
      uint32_t druOw = 0;
      if(dru_read_mode!=0)
        druOw = inW+padL+padR-1;
      else
        druOw = outW-1;

      //Initialize register value
  
      reg_val[REG_IDX_TASK_DRU_ADDR_STRD]      = druAddr;
      reg_val[REG_IDX_TASK_DRU_KW]             = kW-1;
      reg_val[REG_IDX_TASK_DRU_SW]             = sW-1;
      reg_val[REG_IDX_TASK_DRU_IC]             = inCh-1;
      reg_val[REG_IDX_TASK_DRU_OW]             = druOw;
      reg_val[REG_IDX_TASK_DRU_OH]             = inH-1;
      reg_val[REG_IDX_TASK_DRU_SRC_NTRANS]     = std::ceil((inH*inW*inCh)/64.0)+1;
      reg_val[REG_IDX_TASK_DRU_DST_NTRANS]     = (4*inH*outW*16*(std::ceil(inCh*kW/16.0)))/64.0;
      reg_val[REG_IDX_TASK_DRU_PL_CORR]        = padL*inCh;
      reg_val[REG_IDX_TASK_DRU_PR_CORR]        = (padL+inW)*inCh;
      reg_val[REG_IDX_TASK_DRU_IW_CORR]        = inW*inCh;
      reg_val[REG_IDX_TASK_DRU_SW_CORR]        = sW*inCh;
      reg_val[REG_IDX_TASK_DRU_WCG_CORR]       = wcgCorr;
      reg_val[REG_IDX_TASK_DRU_READ_MODE]      = dru_read_mode;
      reg_val[REG_IDX_TASK_MODE]              = 0x0; //druMode on then 0x0
    }
    else
    {
      reg_val[REG_IDX_TASK_MODE]              = 0x1; //druMode off then 0x1
    }
    
    reg_val[REG_IDX_REG_AXCACHE_AXOS]       = REG_AXCACHE_AXOS;
    reg_val[REG_IDX_REG_DPU_PROF_ENABLE]    = 0x1;

}

void Dpuv3Int8Controller::initCreateBuffers()
{
    
    instr_=load(xmodel_->getInstr());
    params_=load(xmodel_->getParams());

    // ONEHACK TM
    // If we could not get any instructions directly from the xmodel
    // assume that we are in a meta.json flow where we must get parameters
    // from disk
    if (instr_.size() == 0) {
      instr_=load(xmodel_->getInstrFileName());
      params_=load(xmodel_->getParamsFileName());
    }

    const std::vector<std::int32_t> instrdims = { int32_t(instr_.size()*BATCH_SIZE) };

    if(params_.size()!=0)
    {
      const std::vector<std::int32_t> paramsdims = { int32_t(params_.size()*BATCH_SIZE) };
      xir::Tensor *params_t = xir::Tensor::create("params", paramsdims, xir::DataType{xir::DataType::XINT, 8}).release();
      params_tensor_.reset(params_t);

      paramsTbuf_.reset(new vart::CpuFlatTensorBuffer((void*)params_.data(),&(*params_tensor_)));
      params_buf_.reset(new XrtDeviceBuffer(handle_.get(), paramsTbuf_.get(), handle_->get_device_info().ddr_bank));
      params_buf_->upload();
    }
    
    const std::vector<std::int32_t> swapdims = { int32_t(xmodel_->getSwapBufSize()) };
    const std::vector<std::int32_t> druSrcdims = { int32_t(BATCH_SIZE*xmodel_->getInW()*xmodel_->getInH()*xmodel_->getInCh())};
    const std::vector<std::int32_t> druDstdims = { int32_t(xmodel_->getInW()*xmodel_->getInH()*BATCH_SIZE*ceil((float)xmodel_->getInCh()/16)*16)};

    xir::Tensor *instr_t = xir::Tensor::create("instr", instrdims, xir::DataType{xir::DataType::XINT, 8}).release();
    xir::Tensor *swap_t = xir::Tensor::create("swap", swapdims, xir::DataType{xir::DataType::XINT, 8}).release();
    xir::Tensor *drusrc_t = xir::Tensor::create("druSrc", druSrcdims, xir::DataType{xir::DataType::XINT, 8}).release();
    xir::Tensor *drudst_t = xir::Tensor::create("druDst", druDstdims, xir::DataType{xir::DataType::XINT, 8}).release();
    instr_tensor_.reset(instr_t);
    swap_tensor_.reset(swap_t);
    druSrc_tensor_.reset(drusrc_t);
    druDst_tensor_.reset(drudst_t);

    
    instrTbuf_.reset(new vart::CpuFlatTensorBuffer((void*)instr_.data(),&(*instr_tensor_)));
    
    instr_buf_.reset(new XrtDeviceBuffer(handle_.get(), instrTbuf_.get(), handle_->get_device_info().ddr_bank));
    instr_buf_->upload();
    
}

void Dpuv3Int8Controller::initRunBufs(uint64_t *buf_addr, XrtDeviceBuffer* swap_buf, XrtDeviceBuffer* druSrc_buf, XrtDeviceBuffer* druDst_buf)
{
    buf_addr[BUF_IDX_INSTR] = instr_buf_->get_phys_addr();
    buf_addr[BUF_IDX_PARAMS] = params_buf_->get_phys_addr();
    buf_addr[BUF_IDX_SWAP] = swap_buf->get_phys_addr();
    buf_addr[BUF_IDX_DRUSRC] = druSrc_buf->get_phys_addr();
    buf_addr[BUF_IDX_DRUDST] = druDst_buf->get_phys_addr();

    if(xmodel_->getDruMode()) // If DRU is used 
    {
        buf_addr[BUF_IDX_DST] = buf_addr[BUF_IDX_DRUDST];
    }                                                                 
    else            // If DRU is NOT used
    {                                                                 
        buf_addr[BUF_IDX_SRC] = buf_addr[BUF_IDX_NULL];
    }

}

void Dpuv3Int8Controller::output_reorg(std::vector<void*> stdData, void *result_data, int result_size)
{
     std::vector<std::vector<std::int32_t>> outTensorsDimensions = xmodel_->getOutTensorsDims();
    
    for(uint32_t i=0; i<stdData.size(); i++)
    {
      each_output_reorg(stdData[i], result_data, outTensorsDimensions[i][4], outTensorsDimensions[i][3], outTensorsDimensions[i][0]*outTensorsDimensions[i][1]*outTensorsDimensions[i][2], outTensorsDimensions[i][2], i);    
    }

}

void Dpuv3Int8Controller::each_output_reorg(void* std_data, void *result_data, long ddr_size, long startVal, int std_size, int stdOutCh, int outputNumber)
{
    long i, mbatch, segment, group;
    std::vector<int> count(BATCH_SIZE,0);

    long result_size = ddr_size*4;
    std::vector<int8_t> stdExtraZeroesData(result_size,0);

    for (i = startVal; i < result_size+startVal; i++)
    {
        mbatch = i / (64*16*ddr_size);
        segment = (i - mbatch * (64*16*ddr_size)) / 64;
        group = (i - mbatch * (64 * 16*ddr_size) - segment * 64) / 16;
        switch(mbatch*4+group)
        {
           case 0: stdExtraZeroesData[count[0]]=*(int8_t *)((long long)result_data+i);
                   count[0]++;
                   break;

           case 1: stdExtraZeroesData[ddr_size+count[1]]=*(int8_t *)((long long)result_data+i);
                   count[1]++;
                   break;
           case 2: stdExtraZeroesData[ddr_size*2+count[2]]=*(int8_t *)((long long)result_data+i);
                    count[2]++;
                    break;
           case 3: stdExtraZeroesData[ddr_size*3+count[3]]=*(int8_t *)((long long)result_data+i);
                   count[3]++;
        }
        
    }
   
    std::vector<int> stdDataVec(std_size*BATCH_SIZE,0);
    int ddrOutCh = std::ceil(stdOutCh/16.0)*16;
    int counter = 0;

    for(int k=0; k<result_size; k=k+ddrOutCh)
    {
        for(int j=k; j<k+stdOutCh; j++)
        {
          stdDataVec[counter]=stdExtraZeroesData[j];
          counter++;
        }
    }
    for(int o=0; o<std_size*4; o++)
    {
      *(int8_t *)((long long) std_data+o) = stdDataVec[o];

    }

}


std::vector<const xir::Tensor*> 
Dpuv3Int8Controller::get_input_tensors() const  {
  return std::vector<const xir::Tensor*>{ in_tensor_.get() };
}

std::vector<const xir::Tensor*> 
Dpuv3Int8Controller::get_output_tensors() const {
  std::vector<const xir::Tensor*> outtensors;
  for(uint32_t i=0; i<xmodel_->getOutputNum(); i++)
  {
    outtensors.push_back(out_tensors_[i].get());
  }
  return outtensors;
}

std::vector<vart::TensorBuffer*> 
Dpuv3Int8Controller::get_inputs(int batchsz) {
  if (batchsz != -1)
    throw std::runtime_error("Error: custom batch size not supported for this DPU");

  auto stdBufs = create_tensor_buffers(get_input_tensors(), /*isInput*/true, -1, true);
  auto hwBufs = create_hw_buffers(stdBufs, /*isInput*/true);
  return stdBufs;
 
}

std::vector<vart::TensorBuffer*> 
Dpuv3Int8Controller::get_outputs(int batchsz) {
  if (batchsz != -1)
    throw std::runtime_error("Error: custom batch size not supported for this DPU");

  auto stdBufs = create_tensor_buffers(get_output_tensors(), /*isInput*/false, -1, false);
  auto hwBufs = create_hw_buffers(stdBufs, /*isInput*/false);
  return stdBufs;

}

std::vector<vart::TensorBuffer*>
Dpuv3Int8Controller::create_hw_buffers(std::vector<vart::TensorBuffer*> stdBuf, bool isInput) {
  std::unique_lock<std::mutex> lock(globalMutex);
  std::vector<vart::TensorBuffer*> hwBuf;
  std::vector<vart::TensorBuffer*> swapBuf;
  std::vector<vart::TensorBuffer*> druSrcBuf;
  std::vector<vart::TensorBuffer*> druDstBuf;
  

  if(isInput)
    {
      hwBuf = create_tensor_buffers({in_hw_tensor_.get()}, isInput);
      swapBuf = create_tensor_buffers({swap_tensor_.get()}, isInput);
      druSrcBuf = create_tensor_buffers({druSrc_tensor_.get()}, isInput);
      druDstBuf = create_tensor_buffers({druDst_tensor_.get()}, isInput);
      
      stdbuf2swapbuf_[stdBuf[0]] = swapBuf[0];
      stdbuf2druSrcbuf_[stdBuf[0]] = druSrcBuf[0];
      stdbuf2druDstbuf_[stdBuf[0]] = druDstBuf[0];

    }
  else
    {
      hwBuf = create_tensor_buffers({out_hw_tensor_.get()}, isInput);
    }

  stdbuf2hwbuf_[stdBuf[0]] = hwBuf[0];

  return hwBuf;
}

vart::TensorBuffer* Dpuv3Int8Controller::get_hw_buffer(vart::TensorBuffer* stdBuffer) {
  return stdbuf2hwbuf_[stdBuffer];
}

void Dpuv3Int8Controller::channelAugmentation(std::vector<int8_t> &inputStdData, std::vector<int8_t> &channelAugmentedData, std::vector<int> &channelAugShape)
{

  int src_kw = xmodel_->getInKernelW();
  int src_pw = xmodel_->getPadLft();
  int src_sw = xmodel_->getInStrdW();
  int src_b = BATCH_SIZE;
  int src_h = xmodel_->getInH();
  int src_w = xmodel_->getInW();
  int src_c = xmodel_->getInCh();
  
  int dst_b = src_b;
  int dst_h = src_h;
  int dst_w = std::floor(src_w/src_sw);
  int dst_c = src_c*src_kw;
  
  int chAugH = dst_h;
  int chAugW = dst_w;
  int chAugCh = dst_c;
  
  channelAugShape[0] = chAugH;
  channelAugShape[1] = chAugW;
  channelAugShape[2] = chAugCh;
 
  int src_w_idx = 0;
  int src_c_idx = 0;
   
  channelAugmentedData.resize(dst_b*dst_h*dst_w*dst_c, 0);
  
  for(int bch_idx=0; bch_idx<dst_b; bch_idx++)
  {
    for(int h_idx=0; h_idx<dst_h; h_idx++)
    {
      for(int w_idx=0; w_idx<dst_w; w_idx++)
      {
        for(int ch_idx=0; ch_idx<dst_c; ch_idx++)
        {
          src_w_idx = (src_sw*w_idx)-src_pw+(std::floor(ch_idx/src_c));
          src_c_idx = ch_idx%src_c;
          
          if(src_w_idx<0 || src_w_idx>=src_w)
          {
            channelAugmentedData[(bch_idx*dst_h*dst_w*dst_c)+(h_idx*dst_w*dst_c)+(w_idx*dst_c)+(ch_idx)]=0;
          }
          else
          {
            channelAugmentedData[(bch_idx*dst_h*dst_w*dst_c)+(h_idx*dst_w*dst_c)+(w_idx*dst_c)+(ch_idx)] = inputStdData[(bch_idx*src_h*src_w*src_c)+(h_idx*src_w*src_c)+(src_w_idx*src_c)+(src_c_idx)];
          }

        }
      }
    }
  }
  
}

void Dpuv3Int8Controller::batchInterleave(std::vector<int8_t> &inputData, std::vector<int8_t> &batchInterleavedData, std::vector<int> &channelAugShape)
{

  /////////////batch interleave//////////
  int dpuCfgPrllIch = 16;
  int dpuCfgDummy = 0;
  int layerCfgIbMode = 8;
  
  int src_b = BATCH_SIZE;
  
  int src_h = xmodel_->getInH();
  if(xmodel_->getChannelAugmentationMode())
    src_h = channelAugShape[0];
  
  int src_w = xmodel_->getInW();
  if(xmodel_->getChannelAugmentationMode())
    src_w = channelAugShape[1];
  
  int src_c = xmodel_->getInCh();
  if(xmodel_->getChannelAugmentationMode())
    src_c = channelAugShape[2];

  int prllIch = dpuCfgPrllIch;
  int dummyMode = dpuCfgDummy;
  int dst_c = 0;
  int dst_c_grp = 0;
  int dst_c_idx = 0;
  int8_t data = 0;

  if(src_c % prllIch == 0)
    dst_c = src_c;
  else
    dst_c = (std::floor(src_c/prllIch)+1)*prllIch;

  dst_c_grp = std::floor(dst_c/prllIch);
//  int ddr_size = src_b*dst_c*src_w*src_h;
  for(int h_idx=0; h_idx<src_h; h_idx++)
  {
    for(int w_idx=0; w_idx<src_w; w_idx++)
    {
      for(int ch_grp_idx=0; ch_grp_idx<dst_c_grp; ch_grp_idx++)
      {
        for(int bch_idx=0; bch_idx<src_b; bch_idx++)
        {
          if(layerCfgIbMode==8)
          {
            for(int ch_idx=0; ch_idx<prllIch; ch_idx++)
            {
              dst_c_idx = (ch_grp_idx*prllIch)+ch_idx;
              if(dst_c_idx<src_c)
              {
                //data = img_data_src[bch_idx][h_idx][w_idx][dst_c_idx] & 0xff
                if(xmodel_->getChannelAugmentationMode())
                  data = inputData[(bch_idx*channelAugShape[0]*channelAugShape[1]*channelAugShape[2])+(h_idx*channelAugShape[1]*channelAugShape[2])+(w_idx*channelAugShape[2])+(dst_c_idx)]&0xff;
               else
                  data = inputData[(bch_idx*xmodel_->getInH()*xmodel_->getInW()*xmodel_->getInCh())+(h_idx*xmodel_->getInW()*xmodel_->getInCh())+(w_idx*xmodel_->getInCh())+(dst_c_idx)]&0xff;
              }
              else
              {
                if(dummyMode==0)
                  data=0;
                else if(dummyMode==1)
                  data=0xff;
                else
                  data=std::rand()%(256);///randomInt(0,255);/////
              }
              batchInterleavedData.push_back(data);////
            }
          }
          else
          {
            for(int ch_idx=0; ch_idx<prllIch; ch_idx=ch_idx+4)
            {
              data=0;
              for(int b2_ch_idx=0; b2_ch_idx<4; b2_ch_idx++)
              {
                dst_c_idx = (ch_grp_idx*prllIch)+ch_idx+b2_ch_idx;
                if(dst_c_idx<src_c)
                {
                  //data |= (img_data_src[bch_idx][h_idx][w_idx][dst_c_idx] & 0x03) << (b2_ch_idx * 2)
                  if(xmodel_->getChannelAugmentationMode())
                    data |= (inputData[(bch_idx*channelAugShape[0]*channelAugShape[1]*channelAugShape[2])+(h_idx*channelAugShape[1]*channelAugShape[2])+(w_idx*channelAugShape[2])+(dst_c_idx)] & 0x03) << (b2_ch_idx*2); /////;
                  else
                    data |= (inputData[(bch_idx*xmodel_->getInH()*xmodel_->getInW()*xmodel_->getInCh())+(h_idx*xmodel_->getInW()*xmodel_->getInCh())+(w_idx*xmodel_->getInCh())+(dst_c_idx)] & 0x03) << (b2_ch_idx*2); /////;
                }
                else
                {
                  if(dummyMode==0)
                    data |= 0;
                  else if(dummyMode==1)
                    data = (0x03 << (b2_ch_idx*2));
                  else
                    data=(std::rand()%(4))<<(b2_ch_idx*2);///randomInt;/////
                }
              }
              batchInterleavedData.push_back(data);//////
            }
          }
        }
      }
    }
  }


}


void Dpuv3Int8Controller::preprocess(vart::TensorBuffer* stdbuf, vart::TensorBuffer* hwbuf)
{
    if (!xmodel_->getDruMode())
    {
      void* std_data = (void*)stdbuf->data().first;
      std::vector<int8_t> inputStdData(xmodel_->getInW()*xmodel_->getInH()*xmodel_->getInCh()*BATCH_SIZE,0);
      for(uint32_t i=0; i<inputStdData.size(); i++)
      {
        inputStdData[i]=*(int8_t *)((long long) std_data+i);
      }
      
      std::vector<int8_t> channelAugmentedData;
      std::vector<int> channelAugShape(3,0);
      std::vector<int8_t> batchInterleavedData;
  
      if(xmodel_->getChannelAugmentationMode())
      {
        channelAugmentation(inputStdData, channelAugmentedData, channelAugShape);
        batchInterleave(channelAugmentedData, batchInterleavedData, channelAugShape);
      }
      else
        batchInterleave(inputStdData, batchInterleavedData, channelAugShape);
  
      memcpy((void*)hwbuf->data().first, (void*)batchInterleavedData.data(), (batchInterleavedData.size()));
    }
    else
    {

      void* std_data = (void*)stdbuf->data().first;
      std::vector<uint8_t> flattenedData(xmodel_->getInW()*xmodel_->getInH()*xmodel_->getInCh()*BATCH_SIZE,0);
      for(uint32_t i=0; i<flattenedData.size(); i++)
      {
        flattenedData[i]=*(int8_t *)((long long) std_data+i);
      }
  
      std::vector<int,rte::AlignedAllocator<int>> hwDinVector(flattenedData.size()/4,0);
  
      int j=0;
      
      for(uint32_t i=0; i<flattenedData.size(); i=i+BATCH_SIZE)
      {
        uint8_t *ptr = (uint8_t*)&(hwDinVector[j]);
        for(int o=0; o<BATCH_SIZE; o++)
        {
          ptr[o] = flattenedData[i+o];
  
        }
        j++;
      }
      
      memcpy((void*)hwbuf->data().first, (void*)hwDinVector.data(), hwDinVector.size()*BATCH_SIZE);

    }
}

void Dpuv3Int8Controller::postprocess(std::vector<vart::TensorBuffer*> stdbuf, vart::TensorBuffer* hwbuf)
{
   
   std::vector<void*> vecs;
   for(uint32_t i=0; i<stdbuf.size(); i++)
   {
     vecs.push_back((void*)stdbuf[i]->data().first);
   }

   output_reorg(vecs, (void*)hwbuf->data().first, xmodel_->getOutDdrSize()*BATCH_SIZE);
 
}

void Dpuv3Int8Controller::data_fix2float(float* dataDst, int8_t* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (float)(dataSrc[i]*scale);
}

void Dpuv3Int8Controller::data_float2fix(int8_t* dataDst, float* dataSrc, int size, float scale) {
  for (int i = 0; i < size; i++)
    dataDst[i] = (int8_t)(dataSrc[i]*scale);
}

void Dpuv3Int8Controller::run(const std::vector<vart::TensorBuffer*> &inputs,
                        const std::vector<vart::TensorBuffer*> &outputs) {

  Engine& engine = Engine::get_instance();
  const unsigned worker_id = engine.get_my_worker_id();
  if (worker_id >= contexts_.size())
    throw std::runtime_error("Error: worker_id too large; update controller code");

  auto &context = *(contexts_[worker_id]);
  auto xcl_handle = context.get_dev_handle();
  auto bo_handle = context.get_bo_handle();
  auto bo_addr = context.get_bo_addr();

  std::vector<vart::TensorBuffer*> input_tensor_buffers;
  std::vector<vart::TensorBuffer*> output_tensor_buffers;

  // False if get_inputs() / get_outputs() was used
  // True if the user is providing us the tensor buffers
  bool create_tb_outside=false;

  // Does this need to be protected by a mutex for mt
  
  auto it = stdbuf2hwbuf_.find(outputs[0]);
  if (it == stdbuf2hwbuf_.end())
  {
    create_tb_outside=true;
  }

  // If the user has provided us TB
  if(create_tb_outside) {
   if(inputsTBfs_[worker_id].size()==0)
   {
       inputsTBfs_[worker_id] = get_inputs();
       outputsTBfs_[worker_id] = get_outputs();
   }
    input_tensor_buffers = inputsTBfs_[worker_id];
    output_tensor_buffers = outputsTBfs_[worker_id];
    
    // Must copy input data from user's tensor buffers
    // Iterate over both vectors simultaneously
    auto i = inputs.begin();
    auto itb = input_tensor_buffers.begin();
    for (; i != inputs.end() && itb != input_tensor_buffers.end(); ++i, ++itb) {
      // If input is float, we must scale to int8
      auto num_src = (*i)->get_tensor()->get_element_num();
      auto num_dst = (*itb)->get_tensor()->get_element_num();
      auto num = std::min(num_src,num_dst);
      if ((*i)->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
      {
        auto scale = pow(2,(*itb)->get_tensor()->get_attr<std::int32_t>("fix_point"));
        data_float2fix((int8_t*)(*itb)->data().first, (float*)(*i)->data().first, num, scale);
      }
      else if ((*i)->get_tensor()->get_data_type().type == xir::DataType::XINT)
        memcpy((int8_t*)(*itb)->data().first, (float*)(*i)->data().first, num);
      else
        throw std::runtime_error("Error: Input Tensor Buffer Data Type is unsupported.");
    }
  }
  else { // Only pointers will be copied
    input_tensor_buffers = inputs;
    output_tensor_buffers = outputs;
  }

  vart::TensorBuffer* inHwTbuf = get_hw_buffer(input_tensor_buffers[0]);
  vart::TensorBuffer* outHwTbuf = get_hw_buffer(output_tensor_buffers[0]);
  vart::TensorBuffer* swapTbuf = stdbuf2swapbuf_[input_tensor_buffers[0]];
  vart::TensorBuffer* druSrcTbuf = stdbuf2druSrcbuf_[input_tensor_buffers[0]];
  vart::TensorBuffer* druDstTbuf = stdbuf2druDstbuf_[input_tensor_buffers[0]];

  auto *inHwBuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(inHwTbuf));
  auto *outHwBuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(outHwTbuf));
  auto *swapBuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(swapTbuf));
  auto *druSrcBuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(druSrcTbuf));
  auto *druDstBuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(druDstTbuf));

  if(xmodel_->get_zero_copy())
  { 
    uint64_t data;
    size_t size;

    std::tie(data, size) = input_tensor_buffers[0]->data();
    auto *hwbuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(input_tensor_buffers[0]));
    if (xclUnmgdPread(xcl_handle, 0, reinterpret_cast<void*>(data), size, hwbuf->get_phys_addr()))
      throw std::runtime_error("Error: dump failed!");

  }

  preprocess(input_tensor_buffers[0], inHwTbuf);

  uint64_t buf_addr[BUF_IDX_NUM];

  initRunBufs(buf_addr, swapBuf, druSrcBuf, druDstBuf);
  
  buf_addr[BUF_IDX_DIN] = inHwBuf->get_phys_addr();
  buf_addr[BUF_IDX_RESULT] = outHwBuf->get_phys_addr();


  if(xmodel_->getDruMode()) // If DRU is used 
  {
      buf_addr[BUF_IDX_SRC] = buf_addr[BUF_IDX_DIN];
  }
  else            // If DRU is NOT used
  {                                                                 
      buf_addr[BUF_IDX_DST] = buf_addr[BUF_IDX_DIN];
  }
  
  uint64_t data;
  size_t size;

  std::tie(data, size) = inHwTbuf->data();

  if (xclUnmgdPwrite(xcl_handle, 0, reinterpret_cast<void*>(data), size, inHwBuf->get_phys_addr()))
    throw std::runtime_error("Error: upload failed");
  
  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);
 
  runKernel(ecmd, buf_addr, reg_val, xcl_handle, bo_handle);

  uint64_t outdata;
  size_t outsize;

  std::tie(outdata, outsize) = outHwTbuf->data();

  if (xclUnmgdPread(xcl_handle, 0, reinterpret_cast<void*>(outdata), outsize, outHwBuf->get_phys_addr()))
    throw std::runtime_error("Error: dump failed!");
  
  postprocess(output_tensor_buffers, outHwTbuf);

  // If the user has provided us TB
  if(create_tb_outside) {

    // Must copy output data to user's tensor buffers
    // Iterate over both vectors simultaneously
    auto o = outputs.begin();
    auto otb = output_tensor_buffers.begin();
    for (; o != outputs.end() && otb != output_tensor_buffers.end(); ++o, ++otb) {
      // If output is float, we must scale to int8
      auto num_src = (*otb)->get_tensor()->get_element_num();
      auto num_dst = (*o)->get_tensor()->get_element_num();
      auto num = std::min(num_src,num_dst);
      if ((*o)->get_tensor()->get_data_type().type == xir::DataType::FLOAT)
      {
        auto scale = pow(2,(-1)*(*otb)->get_tensor()->get_attr<std::int32_t>("fix_point"));
        data_fix2float((float*) (*o)->data().first, (int8_t*) (*otb)->data().first, num, scale);
      }
      else if ((*o)->get_tensor()->get_data_type().type == xir::DataType::XINT)
        memcpy((int8_t*)(*o)->data().first, (int8_t*)(*otb)->data().first, num);
      else
        throw std::runtime_error("Error: Output Tensor Buffer Data Type is unsupported.");
    }
  }
}

std::vector<int32_t, rte::AlignedAllocator<int32_t>> Dpuv3Int8Controller::load(std::string filename)
{

    std::vector<int32_t, rte::AlignedAllocator<int32_t>> tmp;
    std::ifstream   ifile;
    std::string     line;
    
    ifile.open(filename);
    while(std::getline(ifile, line))
    {
      tmp.push_back((int32_t)std::strtol(line.c_str(), nullptr, 16));
    }
    ifile.close();
    return tmp;
}

std::vector<int32_t, rte::AlignedAllocator<int32_t>> Dpuv3Int8Controller::load(std::vector<string> svals)
{
  std::vector<int32_t, rte::AlignedAllocator<int32_t>> tmp;

  for (auto& val : svals) {
    tmp.push_back((int32_t)std::strtol(val.c_str(), nullptr, 16));
  }
  return tmp;
}

