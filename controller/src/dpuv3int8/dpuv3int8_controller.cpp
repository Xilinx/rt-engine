#include "dpuv3int8_controller.hpp"

#include "utils.hpp"

#include "experimental/xrt++.hpp"

#include <typeinfo>

#include <cstring>
#include <thread>
#include <vector>
#include <algorithm>
#include <list>
#include <iostream>
#include <unistd.h>
#include <sys/time.h>
#include <ctime>
#include <iomanip>
#include <math.h>
#include <cstdio>
#include <mutex>


#include <fstream>
#include <sstream>
#include <unistd.h>
#include <unordered_map>

#pragma GCC diagnostic push 
#pragma GCC diagnostic ignored "-Wignored-qualifiers"
#include "CL/cl_ext_xilinx.h"
#pragma GCC diagnostic pop 
#include "dpu_controller.hpp"

#include "device_handle.hpp"

#define BUF_IDX_NUM                     12

#define CONTROL_ADDR_AP_CTRL                            0x00
#define CONTROL_ADDR_GIE                                0x04
#define CONTROL_ADDR_IER                                0x08
#define CONTROL_ADDR_ISR                                0x0c
#define CONTROL_ADDR_BLOCK_INSTR                        0x10
#define CONTROL_ADDR_BLOCK_PARAMS                       0x18
#define CONTROL_ADDR_BLOCK_SWAP                         0x20
#define CONTROL_ADDR_BLOCK_RSLT                         0x28
#define CONTROL_ADDR_BLOCK_SRC                          0x30
#define CONTROL_ADDR_BLOCK_DST                          0x38
#define CONTROL_ADDR_TASK_FU_ADDR_STRD                  0x40 
#define CONTROL_ADDR_TASK_FU_KW                         0x44
#define CONTROL_ADDR_TASK_FU_SW                         0x48
#define CONTROL_ADDR_TASK_FU_IC                         0x4c
#define CONTROL_ADDR_TASK_FU_OW                         0x50
#define CONTROL_ADDR_TASK_FU_OH                         0x54
#define CONTROL_ADDR_TASK_FU_SRC_NTRANS                 0x58
#define CONTROL_ADDR_TASK_FU_DST_NTRANS                 0x5c
#define CONTROL_ADDR_TASK_FU_PL_CORR                    0x60
#define CONTROL_ADDR_TASK_FU_PR_CORR                    0x64
#define CONTROL_ADDR_TASK_FU_IW_CORR                    0x68
#define CONTROL_ADDR_TASK_FU_SW_CORR                    0x6c
#define CONTROL_ADDR_TASK_FU_WCG_CORR                   0x70
#define CONTROL_ADDR_TASK_FU_READ_MODE                  0x74
#define CONTROL_ADDR_TASK_MODE                          0x78
#define CONTROL_ADDR_REG_VERSION                        0x7c
#define CONTROL_ADDR_REG_AXCACHE_AXOS                   0x80
#define CONTROL_ADDR_REG_DPU_PROF_ENABLE                0x84
#define CONTROL_ADDR_REG_DPU_PROF_FLAG                  0x90
#define CONTROL_ADDR_REG_DPU_PROF_TSTAMP                0x94
#define CONTROL_ADDR_REG_DPU_PROF_LSNUM                 0x98
#define CONTROL_ADDR_REG_DPU_PROF_SSNUM                 0x9c
#define CONTROL_ADDR_REG_DPU_PROF_CSNUM                 0xa0
#define CONTROL_ADDR_REG_DPU_PROF_MSNUM                 0xa4
#define CONTROL_ADDR_REG_DPU_PROF_LFNUM                 0xa8
#define CONTROL_ADDR_REG_DPU_PROF_SFNUM                 0xac
#define CONTROL_ADDR_REG_DPU_PROF_CFNUM                 0xb0
#define CONTROL_ADDR_REG_DPU_PROF_MFNUM                 0xb4
#define CONTROL_ADDR_REG_DPU_STATUS                     0xb8
#define CONTROL_ADDR_REG_FU_STATUS                      0xbc
#define CONTROL_ADDR_DONE_CNT                           0xc0
#define CONTROL_ADDR_REG_FU_PROF_ENABLE                 0xc4
#define CONTROL_ADDR_REG_FU_PROF_WORK_CYC               0xc8
#define CONTROL_ADDR_REG_FU_PROF_WAIT_DPU_CYC           0xcc
#define CONTROL_ADDR_REG_FU_PROF_DPU_ACK_CYC            0xd0
#define CONTROL_ADDR_REG_FU_PROF_WAIT_RD_DATA_CYC       0xd4
#define CONTROL_ADDR_REG_FU_PROF_WRITE_BUF_FULL_CYC     0xd8
#define CONTROL_ADDR_REG_FU_PROF_DATAREORG_CYC          0xdc
#define CONTROL_ADDR_REG_FU_PROF_BUS_RD_TRANS           0xe0
#define CONTROL_ADDR_REG_FU_PROF_BUS_WT_TRANS           0xe4
#define CONTROL_ADDR_REG_FU_PROF_BUS_RD_CYC             0xe8
#define CONTROL_ADDR_REG_FU_PROF_BUS_WT_CYC             0xec
#define CONTROL_ADDR_REG_FU_PROF_BUS_RREQ_WAIT_CYC      0xf0
#define CONTROL_ADDR_REG_FU_PROF_BUS_AWREQ_WAIT_CYC     0xf4
#define CONTROL_ADDR_REG_FU_PROF_BUS_WREQ_WAIT_CYC      0xf8
#define CONTROL_ADDR_REG_FU_PROF_OVERFLOW               0xfc


#define BUF_IDX_INSTR                   0
#define BUF_IDX_PARAMS                  1
#define BUF_IDX_SWAP                    2
#define BUF_IDX_DIN                     3
#define BUF_IDX_DOUT                    4
#define BUF_IDX_RESULT                  5
#define BUF_IDX_FUSRC                   6
#define BUF_IDX_FUDST                   7
#define BUF_IDX_SRC                     9
#define BUF_IDX_DST                     10
#define BUF_IDX_NULL                    11

#define REG_IDX_TASK_FU_ADDR_STRD       0
#define REG_IDX_TASK_FU_KW              1
#define REG_IDX_TASK_FU_SW              2
#define REG_IDX_TASK_FU_IC              3
#define REG_IDX_TASK_FU_OW              4
#define REG_IDX_TASK_FU_OH              5
#define REG_IDX_TASK_FU_SRC_NTRANS      6
#define REG_IDX_TASK_FU_DST_NTRANS      7
#define REG_IDX_TASK_FU_PL_CORR         8
#define REG_IDX_TASK_FU_PR_CORR         9
#define REG_IDX_TASK_FU_IW_CORR         10         
#define REG_IDX_TASK_FU_SW_CORR         11
#define REG_IDX_TASK_FU_WCG_CORR        12
#define REG_IDX_TASK_FU_READ_MODE       13
#define REG_IDX_TASK_MODE               14
#define REG_IDX_REG_VERSION             15
#define REG_IDX_REG_AXCACHE_AXOS        16
#define REG_IDX_REG_DPU_PROF_ENABLE     17
#define REG_IDX_REG_DPU_PROF_FLAG       18
#define REG_IDX_REG_DPU_PROF_TSTAMP     19
#define REG_IDX_REG_DPU_PROF_LSNUM      20
#define REG_IDX_REG_DPU_PROF_SSNUM      21
#define REG_IDX_REG_DPU_PROF_CSNUM      22
#define REG_IDX_REG_DPU_PROF_MSNUM      23
#define REG_IDX_REG_DPU_PROF_LFNUM      24
#define REG_IDX_REG_DPU_PROF_SFNUM      25
#define REG_IDX_REG_DPU_PROF_CFNUM      26
#define REG_IDX_REG_DPU_PROF_MFNUM      27
#define REG_IDX_REG_DPU_STATUS          28
#define REG_IDX_REG_FU_STATUS           29
#define REG_IDX_DONE_CNT                30 



#define BATCH_SIZE  4
#define SLR_NUM     4


Dpuv3Int8Controller::Dpuv3Int8Controller(std::string meta) : XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>(meta) {

  // load meta file
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     

  modelName_ = getFileNameIfExists("model", jobj);
  instr_filename_ = getFileNameIfExists("instrFile", jobj);
  din_filename_ = getFileNameIfExists("dInFile", jobj);
  dout_filename_ = getFileNameIfExists("dOutFile", jobj);
  result_filename_ = getFileNameIfExists("resultFile", jobj);
  params_filename_ = getFileNameIfExists("paramsFile", jobj);
 
  { // TODO init input/output tensor from compiler
    auto din = load(din_filename_);
    dout_ = load(dout_filename_);
    std::cout<<din.size()<<" din.size()"<<std::endl;
    const std::vector<std::int32_t> indims = { int32_t(din.size()) };
    const std::vector<std::int32_t> outdims = { int32_t(dout_.size()) };
    in_tensor_.reset(
      new xir::vart::Tensor("input", indims, xir::vart::Tensor::DataType::INT32));
    //For now we using indims for inhw as well, but ideally inhw would be different and this would come from meta.json
    in_hw_tensor_.reset(
      new xir::vart::Tensor("inputHw", indims, xir::vart::Tensor::DataType::INT32));
    
    out_tensor_.reset(
      new xir::vart::Tensor("output", outdims, xir::vart::Tensor::DataType::INT32));

    out_hw_tensor_.reset(
      new xir::vart::Tensor("outputHw", outdims, xir::vart::Tensor::DataType::INT32));

  }


  initializeTaskFUVariables();
  initCreateBuffers();
}

std::string Dpuv3Int8Controller::getFileNameIfExists(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    throw std::runtime_error("Error: missing "+name+" field in meta.json");
  return json_object_get_string(obj);

}


Dpuv3Int8Controller::~Dpuv3Int8Controller() {
}


void Dpuv3Int8Controller::runKernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* buf_size, uint32_t* reg_val)
{

    cmd.add(CONTROL_ADDR_BLOCK_INSTR            ,( buf_addr[BUF_IDX_INSTR]  ) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_INSTR + 0x4      ,((buf_addr[BUF_IDX_INSTR]  ) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_PARAMS           ,( buf_addr[BUF_IDX_PARAMS] ) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_PARAMS + 0x4     ,((buf_addr[BUF_IDX_PARAMS] ) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SWAP             ,( buf_addr[BUF_IDX_SWAP]   ) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SWAP + 0x4       ,((buf_addr[BUF_IDX_SWAP]   ) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_RSLT             ,( buf_addr[BUF_IDX_RESULT] ) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_RSLT + 0x4       ,((buf_addr[BUF_IDX_RESULT] ) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SRC              ,( buf_addr[BUF_IDX_SRC]    ) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_SRC + 0x4        ,((buf_addr[BUF_IDX_SRC]    ) >> 32) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_DST              ,( buf_addr[BUF_IDX_DST]    ) & 0xFFFFFFFF);
    cmd.add(CONTROL_ADDR_BLOCK_DST + 0x4        ,((buf_addr[BUF_IDX_DST]    ) >> 32) & 0xFFFFFFFF);

    cmd.add(CONTROL_ADDR_TASK_FU_ADDR_STRD      ,reg_val[REG_IDX_TASK_FU_ADDR_STRD]  );
    cmd.add(CONTROL_ADDR_TASK_FU_KW		        ,reg_val[REG_IDX_TASK_FU_KW]         );
    cmd.add(CONTROL_ADDR_TASK_FU_SW		        ,reg_val[REG_IDX_TASK_FU_SW]         );
    cmd.add(CONTROL_ADDR_TASK_FU_IC		        ,reg_val[REG_IDX_TASK_FU_IC]         );
    cmd.add(CONTROL_ADDR_TASK_FU_OW		        ,reg_val[REG_IDX_TASK_FU_OW]         );
    cmd.add(CONTROL_ADDR_TASK_FU_OH		        ,reg_val[REG_IDX_TASK_FU_OH]         );
    cmd.add(CONTROL_ADDR_TASK_FU_SRC_NTRANS  	,reg_val[REG_IDX_TASK_FU_SRC_NTRANS] );
    cmd.add(CONTROL_ADDR_TASK_FU_DST_NTRANS  	,reg_val[REG_IDX_TASK_FU_DST_NTRANS] );
    cmd.add(CONTROL_ADDR_TASK_FU_PL_CORR		,reg_val[REG_IDX_TASK_FU_PL_CORR]    );
    cmd.add(CONTROL_ADDR_TASK_FU_PR_CORR		,reg_val[REG_IDX_TASK_FU_PR_CORR]    );
    cmd.add(CONTROL_ADDR_TASK_FU_IW_CORR		,reg_val[REG_IDX_TASK_FU_IW_CORR]    );
    cmd.add(CONTROL_ADDR_TASK_FU_SW_CORR		,reg_val[REG_IDX_TASK_FU_SW_CORR]    );
    cmd.add(CONTROL_ADDR_TASK_FU_WCG_CORR		,reg_val[REG_IDX_TASK_FU_WCG_CORR]   );
    cmd.add(CONTROL_ADDR_TASK_FU_READ_MODE	    ,reg_val[REG_IDX_TASK_FU_READ_MODE]  );
    cmd.add(CONTROL_ADDR_TASK_MODE		        ,reg_val[REG_IDX_TASK_MODE]          );
    cmd.add(CONTROL_ADDR_REG_VERSION		    ,reg_val[REG_IDX_REG_VERSION]        );
    cmd.add(CONTROL_ADDR_REG_AXCACHE_AXOS		,reg_val[REG_IDX_REG_AXCACHE_AXOS]   );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_ENABLE	,reg_val[REG_IDX_REG_DPU_PROF_ENABLE]);
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_FLAG	    ,reg_val[REG_IDX_REG_DPU_PROF_FLAG]  );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_TSTAMP	,reg_val[REG_IDX_REG_DPU_PROF_TSTAMP]);
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_LSNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_LSNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_SSNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_SSNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_CSNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_CSNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_MSNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_MSNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_LFNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_LFNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_SFNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_SFNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_CFNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_CFNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_PROF_MFNUM	    ,reg_val[REG_IDX_REG_DPU_PROF_MFNUM] );
    cmd.add(CONTROL_ADDR_REG_DPU_STATUS		    ,reg_val[REG_IDX_REG_DPU_STATUS]     );
    cmd.add(CONTROL_ADDR_REG_FU_STATUS		    ,reg_val[REG_IDX_REG_FU_STATUS]      );
    cmd.add(CONTROL_ADDR_DONE_CNT		        ,reg_val[REG_IDX_DONE_CNT]           );

    cmd.execute();
    cmd.wait();

}

void Dpuv3Int8Controller::initializeTaskFUVariables()
{
    std::cout<<"-----------------------------------------------"<<std::endl;
    std::cout << "Program begins: "<< std::endl;

    //TO-DO MNDBG: This function's purpose is to fill in register values required for execution. Currently, these values are static. This has to be updated to dynamically calculate register values based on input/model information.

    task_mode_ = 0x0;
    uint32_t zero = 0;

    //Initialize register value
    reg_val[REG_IDX_TASK_FU_ADDR_STRD]      = 0x24c00;
    reg_val[REG_IDX_TASK_FU_KW]             = 0x6;
    reg_val[REG_IDX_TASK_FU_SW]             = 0x1;
    reg_val[REG_IDX_TASK_FU_IC]             = 0x2;
    reg_val[REG_IDX_TASK_FU_OW]             = 0xe4;
    reg_val[REG_IDX_TASK_FU_OH]             = 0xdf;
    reg_val[REG_IDX_TASK_FU_SRC_NTRANS]     = 0x931;
    reg_val[REG_IDX_TASK_FU_DST_NTRANS]     = 0xc400;
    reg_val[REG_IDX_TASK_FU_PL_CORR]        = 0x9;
    reg_val[REG_IDX_TASK_FU_PR_CORR]        = 0x2a9;
    reg_val[REG_IDX_TASK_FU_IW_CORR]        = 224*3;
    reg_val[REG_IDX_TASK_FU_SW_CORR]        = 6;
    reg_val[REG_IDX_TASK_FU_WCG_CORR]       = 0xe0;
    reg_val[REG_IDX_TASK_FU_READ_MODE]      = 0x2;
    reg_val[REG_IDX_TASK_MODE]              = task_mode_;
    reg_val[REG_IDX_REG_VERSION]            = zero;
    reg_val[REG_IDX_REG_AXCACHE_AXOS]       = 0x01012020;
    reg_val[REG_IDX_REG_DPU_PROF_ENABLE]    = 0x1;
    reg_val[REG_IDX_REG_DPU_PROF_FLAG]      = zero;
    reg_val[REG_IDX_REG_DPU_PROF_TSTAMP]    = zero;
    reg_val[REG_IDX_REG_DPU_PROF_LSNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_SSNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_CSNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_MSNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_LFNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_SFNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_CFNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_PROF_MFNUM]     = zero;
    reg_val[REG_IDX_REG_DPU_STATUS]         = zero;
    reg_val[REG_IDX_REG_FU_STATUS]          = zero;
    reg_val[REG_IDX_DONE_CNT]               = zero;


}

void Dpuv3Int8Controller::initCreateBuffers()
{
    //TO-DO MNDBG1: This function's purpose is to load instr, params data and allocate tensorbuffers, devicebuffers for instr, params, swap, fuSrc, fuDst. Currently buffer size for swap, fuSrc, fuDst is static, this shoudl be updated to be dynamic - the size would come from meta.json populated by compiler. 

    //TO-DO MNDBG2: This function also loads instr.txt and params.txt. If compiler provides instr.asm, function has to integrate a sub function which can convert instr.asm to instr.txt and then load the instr.txt. If compiler provides  abinary file, then the function has to integrate a subfunction which can load binary files and populate required data.


    //Allocate Memory in Host Memory
    uint32_t BLK_SIZE = 16*1024*1024;
    
    std::vector<int,aligned_allocator<int>> instr_=load(instr_filename_);

    std::vector<int,aligned_allocator<int>> params_=load(params_filename_);

    std::vector<int,aligned_allocator<int>> swap_(BLK_SIZE/sizeof(int32_t));

    std::vector<int,aligned_allocator<int>> fuSrc_(BLK_SIZE/sizeof(int32_t));

    std::vector<int,aligned_allocator<int>> fuDst_(BLK_SIZE/sizeof(int32_t));       	    
       	    
    const std::vector<std::int32_t> instrdims = { int32_t(instr_.size()) };
    const std::vector<std::int32_t> paramsdims = { int32_t(params_.size()) };
    const std::vector<std::int32_t> swapdims = { int32_t(swap_.size()) };
    const std::vector<std::int32_t> fuSrcdims = { int32_t(fuSrc_.size()) };
    const std::vector<std::int32_t> fuDstdims = { int32_t(fuDst_.size()) };

    instr_tensor_.reset(
      new xir::vart::Tensor("instr", instrdims, xir::vart::Tensor::DataType::UINT32));
    params_tensor_.reset(
      new xir::vart::Tensor("params", paramsdims, xir::vart::Tensor::DataType::UINT32));
    swap_tensor_.reset(
      new xir::vart::Tensor("swap", swapdims, xir::vart::Tensor::DataType::UINT32));
    fuSrc_tensor_.reset(
      new xir::vart::Tensor("fuSrc", fuSrcdims, xir::vart::Tensor::DataType::UINT32));
    fuDst_tensor_.reset(
      new xir::vart::Tensor("fuDst", fuDstdims, xir::vart::Tensor::DataType::UINT32));

    
    instrTbuf_.reset(new xir::vart::CpuFlatTensorBuffer((void*)instr_.data(),&(*instr_tensor_)));
    paramsTbuf_.reset(new xir::vart::CpuFlatTensorBuffer((void*)params_.data(),&(*params_tensor_)));
    swapTbuf_.reset(new xir::vart::CpuFlatTensorBuffer((void*)swap_.data(),&(*swap_tensor_)));
    fuSrcTbuf_.reset(new xir::vart::CpuFlatTensorBuffer((void*)fuSrc_.data(),&(*fuSrc_tensor_)));
    fuDstTbuf_.reset(new xir::vart::CpuFlatTensorBuffer((void*)fuDst_.data(),&(*fuDst_tensor_)));


    instr_buf_.reset(new XclDeviceBuffer(handle_.get(), instrTbuf_.get(), handle_->get_device_info().ddr_bank));
    params_buf_.reset(new XclDeviceBuffer(handle_.get(), paramsTbuf_.get(), handle_->get_device_info().ddr_bank));
    swap_buf_.reset(new XclDeviceBuffer(handle_.get(), swapTbuf_.get(), handle_->get_device_info().ddr_bank));
    fuSrc_buf_.reset(new XclDeviceBuffer(handle_.get(), fuSrcTbuf_.get(), handle_->get_device_info().ddr_bank));
    fuDst_buf_.reset(new XclDeviceBuffer(handle_.get(), fuDstTbuf_.get(), handle_->get_device_info().ddr_bank));

}

void Dpuv3Int8Controller::initRunBufs(uint64_t *buf_addr, uint32_t *buf_size)
{
    buf_addr[BUF_IDX_INSTR] = instr_buf_->get_phys_addr();
    buf_addr[BUF_IDX_PARAMS] = params_buf_->get_phys_addr();
    buf_addr[BUF_IDX_SWAP] = swap_buf_->get_phys_addr();

    buf_addr[BUF_IDX_FUSRC] = fuSrc_buf_->get_phys_addr();
    buf_addr[BUF_IDX_FUDST] = fuDst_buf_->get_phys_addr();

    buf_size[BUF_IDX_INSTR]     = instr_buf_->get_size();
    buf_size[BUF_IDX_PARAMS]    = params_buf_->get_size();
    buf_size[BUF_IDX_SWAP]      = swap_buf_->get_size();
    buf_size[BUF_IDX_FUSRC]     = fuSrc_buf_->get_size();
    buf_size[BUF_IDX_FUDST]     = fuDst_buf_->get_size();
    buf_size[BUF_IDX_SRC]       = 0;
    buf_size[BUF_IDX_DST]       = 0;
    buf_size[BUF_IDX_NULL]      = 0;

    if(task_mode_ == 0) // If FU is used 
    {
        buf_addr[BUF_IDX_DST] = buf_addr[BUF_IDX_FUDST];
        buf_size[BUF_IDX_DST] = buf_size[BUF_IDX_FUDST];
    }                                                                 
    else            // If FU is NOT used
    {                                                                 
        buf_addr[BUF_IDX_SRC] = buf_addr[BUF_IDX_NULL];
        buf_size[BUF_IDX_SRC] = buf_size[BUF_IDX_NULL];
    }

}


void Dpuv3Int8Controller::execute(uint64_t *buf_addr, uint32_t *buf_size)
{
    xrt_device* xdev = handle_->get_device_info().xdev;
    xrtcpp::acquire_cu_context(xdev,0);
    xrtcpp::exec::exec_write_command cmd(xdev);
    cmd.add_cu(0);
    auto start = utils::time_ns();
    std::cout << "Launch the kernel" << std::endl;
    runKernel( cmd, buf_addr, buf_size, reg_val);
    auto end = utils::time_ns();
    std::cout << "All Done !" <<  " | time (ms): " << (end-start)*1e-6 << "| fps: " << float(1.0*1e9/(end-start))*BATCH_SIZE*SLR_NUM << std::endl;
    xrtcpp::release_cu_context(xdev,0);

}

void Dpuv3Int8Controller::checkFpgaOutput(XclDeviceBuffer *outbuf)
{
    xir::vart::TensorBuffer* tbuf = outbuf->get_tensor_buffer();
    std::ofstream outputfile;
    std::string log_filename="";
    for (unsigned i = 0 ; i < dout_.size(); i++)
    {

        if(i%(dout_.size())==0)
        {
            log_filename = "result" + std::to_string(25 + ( std::rand() % ( 63 - 25 + 1 ) )) + ".txt";
//           log_filename = "result" + std::to_string(i/(result.size())) + ".txt";
            outputfile.open(log_filename);
        }

        uint32_t *resultData = (uint32_t*)tbuf->data().first;
        if ((uint32_t)dout_[i] != resultData[i])
        {
            outputfile << "Error: Result mismatch.  " << "dout: " << std::hex << std::setw(8) << std::setfill('0') << (uint32_t)dout_[i] << " | result: " << std::hex << std::setw(8) << resultData[i] << std::endl;
        }
        else 
        {
            outputfile << std::hex << std::setw(8) << std::setfill('0') << (uint32_t)resultData[i] << std::endl;
        }

        if((i%(dout_.size()))==((dout_.size())-1))
        {
            outputfile.close();
        }
    }

}

std::vector<const xir::vart::Tensor*> 
Dpuv3Int8Controller::get_input_tensors() const  {
  return std::vector<const xir::vart::Tensor*>{ in_tensor_.get() };
}

std::vector<const xir::vart::Tensor*> 
Dpuv3Int8Controller::get_output_tensors() const {
  return std::vector<const xir::vart::Tensor*>{ out_tensor_.get() };
}

std::vector<xir::vart::TensorBuffer*> 
Dpuv3Int8Controller::get_inputs() {
  auto stdBufs = create_tensor_buffers(get_input_tensors(), /*isInput*/true);
  auto hwBufs = create_hw_buffers(stdBufs, /*isInput*/true);
  return stdBufs;
}

std::vector<xir::vart::TensorBuffer*> 
Dpuv3Int8Controller::get_outputs() {
  auto stdBufs = create_tensor_buffers(get_output_tensors(), /*isInput*/false);
  auto hwBufs = create_hw_buffers(stdBufs, /*isInput*/false);
  return stdBufs;

}

std::vector<xir::vart::TensorBuffer*>
Dpuv3Int8Controller::create_hw_buffers(std::vector<xir::vart::TensorBuffer*> stdBuf, bool isInput) {
  // TODO: add an unordered_map<TensorBuffer*, TensorBuffer*> ubuf2hwbuf_ to class
  std::vector<xir::vart::TensorBuffer*> hwBuf;
  if(isInput)
    {
      hwBuf = create_tensor_buffers({in_hw_tensor_.get()}, isInput);
    }
  else
    {
      hwBuf = create_tensor_buffers({out_hw_tensor_.get()}, isInput);
    }
  stdbuf2hwbuf_[stdBuf[0]] = hwBuf[0];
 
  return hwBuf;
}

xir::vart::TensorBuffer* Dpuv3Int8Controller::get_hw_buffer(xir::vart::TensorBuffer* stdBuffer) {
  return stdbuf2hwbuf_[stdBuffer];
}

void Dpuv3Int8Controller::preprocess(xir::vart::TensorBuffer* stdbuf, xir::vart::TensorBuffer* hwbuf)
{
  
  //TO-DO MNDBG: this function's purpose is to take in input rgb tensor float tensor data and convert it to data format of the corresponding DDR space in a 32bit continuous style.

  //right now, if the functions detects debug mode, it loads up the pre-populated txt file containing data format as required - in a 32bit continuous style

  //This function cna also be used to load any intermediate tenosr buffer data, for debug purposes if we wish to test any particular layer we can extend this function to handle the intermidate buffer case too.

  const bool DPUV3INT8_DEBUG_MODE =
    std::getenv("DPUV3INT8_DEBUG_MODE") ?
            atoi(std::getenv("DPUV3INT8_DEBUG_MODE")) == 1 : false;

  if(DPUV3INT8_DEBUG_MODE)
  {
    std::pair<void*, size_t> hwbufPair;
    void* hwBufptr;

    std::vector<int,aligned_allocator<int>> hwDinVector;
    hwbufPair = hwbuf->data();
    hwBufptr = hwbufPair.first; 

    hwDinVector = load(din_filename_); 
    
    memcpy(hwBufptr, (void*)hwDinVector.data(), hwDinVector.size()*sizeof(uint32_t));
  }
}

void Dpuv3Int8Controller::postprocess(xir::vart::TensorBuffer* stdbuf, xir::vart::TensorBuffer* hwbuf)
{
  //TO-DO MNDBG: This function's purpose is to take in fpga outputs and convert 8bit to float, also convert from ddr space 32bit continuous style to standard format. This standard format can be sent to softmax, then later to get prediction labels. The function can be extended to intrgrate softmax, label prdictions.


  const bool DPUV3INT8_DEBUG_MODE =
    std::getenv("DPUV3INT8_DEBUG_MODE") ?
            atoi(std::getenv("DPUV3INT8_DEBUG_MODE")) == 1 : false;

  if(DPUV3INT8_DEBUG_MODE)
  {
//get size from meta.json
    memcpy(stdbuf->data().first, hwbuf->data().first, dout_.size()*sizeof(uint32_t));
   
  }
 
}

void Dpuv3Int8Controller::run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
                        const std::vector<xir::vart::TensorBuffer*> &outputs) {
  XclDeviceBuffer* inbuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(inputs[0]));
  XclDeviceBuffer* outbuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(outputs[0]));

  xir::vart::TensorBuffer* inHwTbuf = get_hw_buffer(inputs[0]);
  xir::vart::TensorBuffer* outHwTbuf = get_hw_buffer(outputs[0]);

  XclDeviceBuffer *inHwBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(inHwTbuf));
  XclDeviceBuffer *outHwBuf = dynamic_cast<XclDeviceBuffer*>(get_device_buffer(outHwTbuf));


  preprocess(inputs[0], inHwTbuf);

  uint64_t buf_addr[BUF_IDX_NUM];
  uint32_t buf_size[BUF_IDX_NUM];

  initRunBufs(buf_addr, buf_size);
  
  buf_addr[BUF_IDX_DIN] = inHwBuf->get_phys_addr();
  buf_addr[BUF_IDX_RESULT] = outHwBuf->get_phys_addr();

  buf_size[BUF_IDX_DIN] = inHwBuf->get_size();
  buf_size[BUF_IDX_DOUT] = 0;
  buf_size[BUF_IDX_RESULT] = outHwBuf->get_size();

  if(task_mode_ == 0) // If FU is used 
  {
      buf_addr[BUF_IDX_SRC] = buf_addr[BUF_IDX_DIN];
      buf_size[BUF_IDX_SRC] = buf_size[BUF_IDX_DIN];
  }
  else            // If FU is NOT used
  {                                                                 
      buf_addr[BUF_IDX_DST] = buf_addr[BUF_IDX_DIN];
      buf_size[BUF_IDX_DST] = buf_size[BUF_IDX_DIN];
  }

  inHwBuf->upload();
  execute(buf_addr, buf_size);
  outHwBuf->download();

  postprocess(outputs[0], outHwTbuf);

  checkFpgaOutput(outbuf);
}

std::vector<int32_t, aligned_allocator<int32_t>> Dpuv3Int8Controller::load(std::string filename)
{
    std::vector<int32_t, aligned_allocator<int32_t>> tmp;
    std::vector<int32_t, aligned_allocator<int32_t>> mem;
    std::ifstream   ifile;
    std::string     line;
    
    ifile.open(filename);
    while(std::getline(ifile, line))
    {
        tmp.push_back((int32_t)std::strtol(line.c_str(), nullptr, 16));
    }
    ifile.close();

    mem.insert(mem.end(), tmp.begin(), tmp.end());

    return mem;
}

