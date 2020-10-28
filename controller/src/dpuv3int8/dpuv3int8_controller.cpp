#include "dpuv3int8_controller.hpp"

#define BATCH_SIZE 4

using namespace std;

Dpuv3Int8Controller::Dpuv3Int8Controller(std::string meta) : XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>(meta) {
  
  xmodel_.reset(new Xmodel(meta, false));
  
  initializeTensors(); 
  initializeTaskDRUVariables();
  initCreateBuffers();
}

Dpuv3Int8Controller::Dpuv3Int8Controller(const xir::Subgraph *subgraph) : XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>(subgraph)
{

  xmodel_.reset(new Xmodel(subgraph, false));
  
  initializeTensors();
  initializeTaskDRUVariables();
  initCreateBuffers();
}

void Dpuv3Int8Controller::initializeTensors()
{
    const std::vector<std::int32_t> indims = { BATCH_SIZE, int32_t(xmodel_->getInW()), int32_t(xmodel_->getInH()), int32_t(xmodel_->getInCh())};
    std::vector<std::int32_t> inHwDims = { int32_t(BATCH_SIZE*xmodel_->getInW()*xmodel_->getInH()*xmodel_->getInCh())};
    if(not xmodel_->getDruMode())
      inHwDims = { int32_t(xmodel_->getInW()*xmodel_->getInH()*BATCH_SIZE*ceil((float)xmodel_->getInCh()/16)*16)};
    const std::vector<std::int32_t> outdims = { BATCH_SIZE, 1, 1, int32_t(xmodel_->getOutSize())};
    
    xir::Tensor *in_t = xir::Tensor::create("input", indims, xir::DataType{xir::DataType::INT, 8}).release();
    xir::Tensor *in_hw = xir::Tensor::create("inputHw", inHwDims, xir::DataType{xir::DataType::INT, 8}).release();
    xir::Tensor *op = xir::Tensor::create("output", outdims, xir::DataType{xir::DataType::INT, 8}).release();
    xir::Tensor *op_hw = xir::Tensor::create("outputHw", outdims, xir::DataType{xir::DataType::INT, 8}).release();
    
    in_tensor_.reset(in_t);
    in_hw_tensor_.reset(in_hw);
    out_tensor_.reset(op);
    out_hw_tensor_.reset(op_hw);

}

Dpuv3Int8Controller::~Dpuv3Int8Controller() {}

void Dpuv3Int8Controller::runKernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* reg_val)
{

    cmd.add(CONTROL_ADDR_BLOCK_INSTR ,(buf_addr[BUF_IDX_INSTR]) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_INSTR + 0x4 ,((buf_addr[BUF_IDX_INSTR]) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_PARAMS ,(buf_addr[BUF_IDX_PARAMS]) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_PARAMS + 0x4 ,((buf_addr[BUF_IDX_PARAMS]) >> 32) & 0xFFFFFFFF);
    
    cmd.add(CONTROL_ADDR_BLOCK_SWAP ,(buf_addr[BUF_IDX_SWAP]) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SWAP + 0x4 ,((buf_addr[BUF_IDX_SWAP]) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_RSLT ,(buf_addr[BUF_IDX_RESULT]) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_RSLT + 0x4 ,((buf_addr[BUF_IDX_RESULT]) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SRC ,(buf_addr[BUF_IDX_SRC]) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SRC + 0x4 ,((buf_addr[BUF_IDX_SRC]) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_DST ,(buf_addr[BUF_IDX_DST]) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_DST + 0x4 ,((buf_addr[BUF_IDX_DST]) >> 32) & 0xFFFFFFFF);

    cmd.add(CONTROL_ADDR_TASK_DRU_ADDR_STRD ,reg_val[REG_IDX_TASK_DRU_ADDR_STRD]);
    cmd.add(CONTROL_ADDR_TASK_DRU_KW ,reg_val[REG_IDX_TASK_DRU_KW]);
    cmd.add(CONTROL_ADDR_TASK_DRU_SW ,reg_val[REG_IDX_TASK_DRU_SW]);
    cmd.add(CONTROL_ADDR_TASK_DRU_IC ,reg_val[REG_IDX_TASK_DRU_IC]);
    cmd.add(CONTROL_ADDR_TASK_DRU_OW ,reg_val[REG_IDX_TASK_DRU_OW]);
    cmd.add(CONTROL_ADDR_TASK_DRU_OH ,reg_val[REG_IDX_TASK_DRU_OH]);
    cmd.add(CONTROL_ADDR_TASK_DRU_SRC_NTRANS ,reg_val[REG_IDX_TASK_DRU_SRC_NTRANS]);
    cmd.add(CONTROL_ADDR_TASK_DRU_DST_NTRANS ,reg_val[REG_IDX_TASK_DRU_DST_NTRANS]);
    cmd.add(CONTROL_ADDR_TASK_DRU_PL_CORR	,reg_val[REG_IDX_TASK_DRU_PL_CORR]);
    cmd.add(CONTROL_ADDR_TASK_DRU_PR_CORR	,reg_val[REG_IDX_TASK_DRU_PR_CORR]);
    cmd.add(CONTROL_ADDR_TASK_DRU_IW_CORR	,reg_val[REG_IDX_TASK_DRU_IW_CORR]);
    cmd.add(CONTROL_ADDR_TASK_DRU_SW_CORR	,reg_val[REG_IDX_TASK_DRU_SW_CORR]);
    cmd.add(CONTROL_ADDR_TASK_DRU_WCG_CORR ,reg_val[REG_IDX_TASK_DRU_WCG_CORR]);
    cmd.add(CONTROL_ADDR_TASK_DRU_READ_MODE ,reg_val[REG_IDX_TASK_DRU_READ_MODE]);
    cmd.add(CONTROL_ADDR_TASK_MODE ,reg_val[REG_IDX_TASK_MODE]);
    cmd.add(CONTROL_ADDR_REG_AXCACHE_AXOS	,reg_val[REG_IDX_REG_AXCACHE_AXOS]);
   
    cmd.execute();
    cmd.wait();

}

void Dpuv3Int8Controller::initializeTaskDRUVariables()
{
    std::cout<<"-----------------------------------------------"<<std::endl;

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
      reg_val[REG_IDX_TASK_DRU_OW]             = druOw-1;
      reg_val[REG_IDX_TASK_DRU_OH]             = inH-1;
      reg_val[REG_IDX_TASK_DRU_SRC_NTRANS]     = std::ceil((inH*inW*inCh)/64)+1;
      reg_val[REG_IDX_TASK_DRU_DST_NTRANS]     = (4*inH*outW*16*(std::ceil(inCh*kW/16)))/64;
      reg_val[REG_IDX_TASK_DRU_PL_CORR]        = padL*inCh;
      reg_val[REG_IDX_TASK_DRU_PR_CORR]        = (padR+inW)*inCh;
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
    
    instr_=load(xmodel_->getInstrFileName());
    params_=load(xmodel_->getParamsFileName());

    const std::vector<std::int32_t> instrdims = { int32_t(instr_.size()*BATCH_SIZE) };

    if(params_.size()!=0)
    {
      const std::vector<std::int32_t> paramsdims = { int32_t(params_.size()*BATCH_SIZE) };
      xir::Tensor *params_t = xir::Tensor::create("params", paramsdims, xir::DataType{xir::DataType::INT, 8}).release();
      params_tensor_.reset(params_t);

      paramsTbuf_.reset(new vart::CpuFlatTensorBuffer((void*)params_.data(),&(*params_tensor_)));
      params_buf_.reset(new XclDeviceBuffer(handle_.get(), paramsTbuf_.get(), handle_->get_device_info().ddr_bank));
    }
    
    const std::vector<std::int32_t> swapdims = { int32_t(xmodel_->getSwapBufSize()) };
    const std::vector<std::int32_t> druSrcdims = { int32_t(BATCH_SIZE*xmodel_->getInW()*xmodel_->getInH()*xmodel_->getInCh())};
    const std::vector<std::int32_t> druDstdims = swapdims;

    xir::Tensor *instr_t = xir::Tensor::create("instr", instrdims, xir::DataType{xir::DataType::INT, 8}).release();
    xir::Tensor *swap_t = xir::Tensor::create("swap", swapdims, xir::DataType{xir::DataType::INT, 8}).release();
    xir::Tensor *drusrc_t = xir::Tensor::create("druSrc", druSrcdims, xir::DataType{xir::DataType::INT, 8}).release();
    xir::Tensor *drudst_t = xir::Tensor::create("druDst", druDstdims, xir::DataType{xir::DataType::INT, 8}).release();
    instr_tensor_.reset(instr_t);
    swap_tensor_.reset(swap_t);
    druSrc_tensor_.reset(drusrc_t);
    druDst_tensor_.reset(drudst_t);

    
    instrTbuf_.reset(new vart::CpuFlatTensorBuffer((void*)instr_.data(),&(*instr_tensor_)));
    
    instr_buf_.reset(new XclDeviceBuffer(handle_.get(), instrTbuf_.get(), handle_->get_device_info().ddr_bank));
    
}

void Dpuv3Int8Controller::initRunBufs(uint64_t *buf_addr, XclDeviceBuffer* swap_buf, XclDeviceBuffer* druSrc_buf, XclDeviceBuffer* druDst_buf)
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


void Dpuv3Int8Controller::execute(uint64_t *buf_addr)
{
    xrt_device* xdev = handle_->get_device_info().xdev;
    xrtcpp::exec::exec_write_command cmd(xdev);
    cmd.add_cu(handle_->get_device_info().cu_index);
    runKernel( cmd, buf_addr, reg_val);

}


void Dpuv3Int8Controller::output_reorg(void *std_data, void *result_data, int result_size)
{
    int i, mbatch, segment, group;
    std::vector<int> count(BATCH_SIZE,0); 

    for (i = 0; i < result_size; i++)
    {
        mbatch = i / (64*16*xmodel_->getOutSize());
        segment = (i - mbatch * (64*16*xmodel_->getOutSize())) / 64;
        group = (i - mbatch * (64 * 16*xmodel_->getOutSize()) - segment * 64) / 16;
        switch(mbatch*4+group)
        {
           case 0: *(int8_t *)((long long) std_data+count[0])=*(int8_t *)((long long)result_data+i);
                   count[0]++;
                   break;

           case 1: *(int8_t *)((long long) std_data+(xmodel_->getOutSize()+count[1]))=*(int8_t *)((long long)result_data+i);
                   count[1]++;
                   break;
           case 2: *(int8_t *)((long long) std_data+(xmodel_->getOutSize()*2+count[2]))=*(int8_t *)((long long)result_data+i);
                    count[2]++;
                    break;
           case 3: *(int8_t *)((long long) std_data+(xmodel_->getOutSize()*3+count[3]))=*(int8_t *)((long long)result_data+i);
                   count[3]++;
        }
        
    }
}

std::vector<const xir::Tensor*> 
Dpuv3Int8Controller::get_input_tensors() const  {
  return std::vector<const xir::Tensor*>{ in_tensor_.get() };
}

std::vector<const xir::Tensor*> 
Dpuv3Int8Controller::get_output_tensors() const {
  return std::vector<const xir::Tensor*>{ out_tensor_.get() };
}

std::vector<vart::TensorBuffer*> 
Dpuv3Int8Controller::get_inputs() {
  auto stdBufs = create_tensor_buffers(get_input_tensors(), /*isInput*/true);
  auto hwBufs = create_hw_buffers(stdBufs, /*isInput*/true);
  return stdBufs;
}

std::vector<vart::TensorBuffer*> 
Dpuv3Int8Controller::get_outputs() {
  auto stdBufs = create_tensor_buffers(get_output_tensors(), /*isInput*/false);
  auto hwBufs = create_hw_buffers(stdBufs, /*isInput*/false);
  return stdBufs;

}

std::vector<vart::TensorBuffer*>
Dpuv3Int8Controller::create_hw_buffers(std::vector<vart::TensorBuffer*> stdBuf, bool isInput) {
  
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

void Dpuv3Int8Controller::preprocess(vart::TensorBuffer* stdbuf, vart::TensorBuffer* hwbuf)
{
  
    void* std_data = (void*)stdbuf->data().first;
    std::vector<uint8_t> flattenedData(xmodel_->getInW()*xmodel_->getInH()*xmodel_->getInCh()*BATCH_SIZE,0);
    for(uint32_t i=0; i<flattenedData.size(); i++)
    {
      flattenedData[i]=*(int8_t *)((long long) std_data+i);
    }

    std::vector<int,aligned_allocator<int>> hwDinVector(flattenedData.size()/4,0);

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

void Dpuv3Int8Controller::postprocess(vart::TensorBuffer* stdbuf, vart::TensorBuffer* hwbuf)
{
   
   output_reorg((void*)stdbuf->data().first, (void*)hwbuf->data().first, xmodel_->getOutSize()*BATCH_SIZE);
 
}

void Dpuv3Int8Controller::run(const std::vector<vart::TensorBuffer*> &inputs, 
                        const std::vector<vart::TensorBuffer*> &outputs) {
  
//  XclDeviceBuffer* inbuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(inputs[0]));
//  XclDeviceBuffer* outbuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(outputs[0]));

  vart::TensorBuffer* inHwTbuf = get_hw_buffer(inputs[0]);
  vart::TensorBuffer* outHwTbuf = get_hw_buffer(outputs[0]);
  vart::TensorBuffer* swapTbuf = stdbuf2swapbuf_[inputs[0]];
  vart::TensorBuffer* druSrcTbuf = stdbuf2druSrcbuf_[inputs[0]];
  vart::TensorBuffer* druDstTbuf = stdbuf2druDstbuf_[inputs[0]];

  XclDeviceBuffer *inHwBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(inHwTbuf));
  XclDeviceBuffer *outHwBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(outHwTbuf));
  XclDeviceBuffer *swapBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(swapTbuf));
  XclDeviceBuffer *druSrcBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(druSrcTbuf));
  XclDeviceBuffer *druDstBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(druDstTbuf));

  preprocess(inputs[0], inHwTbuf);

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
  
  inHwBuf->upload();
  execute(buf_addr);
  outHwBuf->download();

  postprocess(outputs[0], outHwTbuf);
}

std::vector<int32_t, aligned_allocator<int32_t>> Dpuv3Int8Controller::load(std::string filename)
{

    std::vector<int32_t, aligned_allocator<int32_t>> tmp;
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

