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



#include "dpuv3int8_controller.hpp"

#include "utils.hpp"

#include "experimental/xrt++.hpp"

#include <typeinfo>

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
#include "json-c/json.h"

#include "device_handle.hpp"

#define BATCH_SIZE  4
#define SLR_NUM     4


Dpuv3Int8Controller::Dpuv3Int8Controller(std::string meta) : XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer>(meta) {

  // load meta file
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     

  // get kernel name
  json_object *modelNameObj = NULL;
  if (!json_object_object_get_ex(jobj, "model", &modelNameObj))
    throw std::runtime_error("Error: missing 'model' field in meta.json");
  modelName = json_object_get_string(modelNameObj);

  json_object *instrNameObj = NULL;
  if (!json_object_object_get_ex(jobj, "instrFile", &instrNameObj))
    throw std::runtime_error("Error: missing 'instrFile' field in meta.json");
  instr_filename = json_object_get_string(instrNameObj);

  json_object *dInNameObj = NULL;
  if (!json_object_object_get_ex(jobj, "dInFile", &dInNameObj))
    throw std::runtime_error("Error: missing 'dInFile' field in meta.json");
  din_filename = json_object_get_string(dInNameObj);

  json_object *dOutNameObj = NULL;
  if (!json_object_object_get_ex(jobj, "dOutFile", &dOutNameObj))
    throw std::runtime_error("Error: missing 'dOutFile' field in meta.json");
  dout_filename = json_object_get_string(dOutNameObj);

  json_object *resultNameObj = NULL;
  if (!json_object_object_get_ex(jobj, "resultFile", &resultNameObj))
    throw std::runtime_error("Error: missing 'resultFile' field in meta.json");
  result_filename = json_object_get_string(resultNameObj);

  json_object *paramsNameObj = NULL;
  if (!json_object_object_get_ex(jobj, "paramsFile", &paramsNameObj))
    throw std::runtime_error("Error: missing 'paramsFile' field in meta.json");
  params_filename = json_object_get_string(paramsNameObj);

  init();
}

void Dpuv3Int8Controller::init()
{
  initializeTaskFUVariables();
  initAllocateHostMemory();
  initCreateBuffers();
  initGetDevBufrAddr();
  initBufrSize();
}


Dpuv3Int8Controller::~Dpuv3Int8Controller() {
}
void Dpuv3Int8Controller::run_Kernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* buf_size, uint32_t* reg_val)
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

    if(modelName=="res50")
    {
        task_fu_addr_strd = 0x24c00;
        task_fu_kw = 0x6;
        task_fu_sw = 0x1;
        task_fu_ic = 0x2;
        task_fu_ow = 0xe4;
        task_fu_oh = 0xdf;
        task_fu_src_ntrans = 0x931;
        task_fu_dst_ntrans = 0xc400;
        task_fu_pl_corr = 0x9;
        task_fu_pr_corr = 0x2a9;
        task_fu_iw_corr = 224*3;   //need update
        task_fu_sw_corr = 6;   //need update
        task_fu_wcg_corr = 0xe0;
        task_fu_read_mode = 0x2;
        task_mode = 0x0;
        reg_axcache_axos = 0x01012020;
        reg_dpu_prof_enable = 0x1;
    }
    else if(modelName=="res34")
    {
        task_fu_addr_strd = 0x24c00;
        task_fu_kw = 0x6;
        task_fu_sw = 0x1;
        task_fu_ic = 0x2;
        task_fu_ow = 0xe4;
        task_fu_oh = 0xdf;
        task_fu_src_ntrans = 0x931;
        task_fu_dst_ntrans = 0xc400;
        task_fu_pl_corr = 0x9;
        task_fu_pr_corr = 0x2a9;
        task_fu_iw_corr = 224*3;
        task_fu_sw_corr = 6;
        task_fu_wcg_corr = 0xe0;
        task_fu_read_mode = 0x2;
        task_mode = 0x1;
        reg_axcache_axos = 0x01012020;
        reg_dpu_prof_enable = 0x1;
    }
    
    uint32_t zero = 0;

    //Initialize register value
    reg_val[REG_IDX_TASK_FU_ADDR_STRD]      = task_fu_addr_strd;
    reg_val[REG_IDX_TASK_FU_KW]             = task_fu_kw;
    reg_val[REG_IDX_TASK_FU_SW]             = task_fu_sw;
    reg_val[REG_IDX_TASK_FU_IC]             = task_fu_ic;
    reg_val[REG_IDX_TASK_FU_OW]             = task_fu_ow;
    reg_val[REG_IDX_TASK_FU_OH]             = task_fu_oh;
    reg_val[REG_IDX_TASK_FU_SRC_NTRANS]     = task_fu_src_ntrans;
    reg_val[REG_IDX_TASK_FU_DST_NTRANS]     = task_fu_dst_ntrans;
    reg_val[REG_IDX_TASK_FU_PL_CORR]        = task_fu_pl_corr;
    reg_val[REG_IDX_TASK_FU_PR_CORR]        = task_fu_pr_corr;
    reg_val[REG_IDX_TASK_FU_IW_CORR]        = task_fu_iw_corr;
    reg_val[REG_IDX_TASK_FU_SW_CORR]        = task_fu_sw_corr;
    reg_val[REG_IDX_TASK_FU_WCG_CORR]       = task_fu_wcg_corr;
    reg_val[REG_IDX_TASK_FU_READ_MODE]      = task_fu_read_mode;
    reg_val[REG_IDX_TASK_MODE]              = task_mode;
    reg_val[REG_IDX_REG_VERSION]            = zero;
    reg_val[REG_IDX_REG_AXCACHE_AXOS]       = reg_axcache_axos;
    reg_val[REG_IDX_REG_DPU_PROF_ENABLE]    = reg_dpu_prof_enable;
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

void Dpuv3Int8Controller::initAllocateHostMemory()
{
    //Allocate Memory in Host Memory
    uint32_t BLK_SIZE = 16*1024*1024;

    instr=load(instr_filename);
    params=load(params_filename);
    swap.resize(BLK_SIZE/sizeof(int32_t));
    fuSrc.resize(BLK_SIZE/sizeof(int32_t));
    fuDst.resize(BLK_SIZE/sizeof(int32_t));       	    
    
    std::cout<<"One time initialzation"<<std::endl;
}


void Dpuv3Int8Controller::runAllocateHostMemory()
{
    //Allocate Memory in Host Memory
    uint32_t BLK_SIZE = 16*1024*1024;

    din=load(din_filename);
    dout=load(dout_filename);
    result.resize(dout.size());
    
    std::cout<<"Run time initialzation for each query"<<std::endl;

}

void Dpuv3Int8Controller::initCreateBuffers()
{
    std::cout << "Create Program and Kernel" << std::endl;
    //OPENCL HOST CODE AREA START
    // Use the first Xilinx device found in the system
    cl_context context = handle_->get_context();
    cl_int err = CL_SUCCESS;
    static const std::vector<unsigned> ddrBankMap = {
     XCL_MEM_DDR_BANK0,
     XCL_MEM_DDR_BANK1,
     XCL_MEM_DDR_BANK2,
     XCL_MEM_DDR_BANK3
    };
    cl_mem_flags flags = CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE;
    

    void *instrhost_ptr = (void*)instr.data();
//    size_t instrsize = instr.size()*sizeof(uint32_t);
//    instr_buf = new XclDeviceBuffer(handle_, instrhost_ptr, instrsize, ddrBankMap[handle_.get_device_info().ddr_bank], flags);

    const std::vector<std::int32_t> instrdims = { instr.size() };
    xir::vart::Tensor instrtensor("instr", instrdims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> instrtbuf(new xir::vart::CpuFlatTensorBuffer(instrhost_ptr, &instrtensor));
    instr_buf = new XclDeviceBuffer(handle_.get(), instrtbuf.get(), handle_->get_device_info().ddr_bank);



    void *paramshost_ptr = (void*)params.data();
//    size_t paramssize = params.size()*sizeof(uint32_t);
//    params_buf = new XclDeviceBuffer(handle_, paramshost_ptr, paramssize, ddrBankMap[handle_.get_device_info().ddr_bank], flags);

    const std::vector<std::int32_t> paramsdims = { params.size() };
    xir::vart::Tensor paramstensor("params", paramsdims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> paramstbuf(new xir::vart::CpuFlatTensorBuffer(paramshost_ptr, &paramstensor));
    params_buf = new XclDeviceBuffer(handle_.get(), paramstbuf.get(), handle_->get_device_info().ddr_bank);



    void *swaphost_ptr = (void*)swap.data();
//    size_t swapsize = swap.size()*sizeof(uint32_t);
//    swap_buf = new XclDeviceBuffer(handle_, swaphost_ptr, swapsize, ddrBankMap[handle_.get_device_info().ddr_bank], flags);

    const std::vector<std::int32_t> swapdims = { swap.size() };
    xir::vart::Tensor swaptensor("swap", swapdims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> swaptbuf(new xir::vart::CpuFlatTensorBuffer(swaphost_ptr, &swaptensor));
    swap_buf = new XclDeviceBuffer(handle_.get(), swaptbuf.get(), handle_->get_device_info().ddr_bank);



    void *fuSrchost_ptr = (void*)fuSrc.data();
//    size_t fuSrcsize = fuSrc.size()*sizeof(uint32_t);
//    fuSrc_buf = new XclDeviceBuffer(handle_, fuSrchost_ptr, fuSrcsize, ddrBankMap[handle_.get_device_info().ddr_bank], flags);


    const std::vector<std::int32_t> fuSrcdims = { fuSrc.size() };
    xir::vart::Tensor fuSrctensor("fuSrc", fuSrcdims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> fuSrctbuf(new xir::vart::CpuFlatTensorBuffer(fuSrchost_ptr, &fuSrctensor));
    fuSrc_buf = new XclDeviceBuffer(handle_.get(), fuSrctbuf.get(), handle_->get_device_info().ddr_bank);


    void *fuDsthost_ptr = (void*)fuDst.data();
//    size_t fuDstsize = fuDst.size()*sizeof(uint32_t);
//    fuDst_buf = new XclDeviceBuffer(handle_, fuDsthost_ptr, fuDstsize, ddrBankMap[handle_.get_device_info().ddr_bank], flags);


    const std::vector<std::int32_t> fuDstdims = { fuDst.size() };
    xir::vart::Tensor fuDsttensor("fuDst", fuDstdims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> fuDsttbuf(new xir::vart::CpuFlatTensorBuffer(fuDsthost_ptr, &fuDsttensor));
    fuDst_buf = new XclDeviceBuffer(handle_.get(), fuDsttbuf.get(), handle_->get_device_info().ddr_bank);

}



void Dpuv3Int8Controller::runCreateBuffers()
{
    std::cout << "Create Program and Kernel" << std::endl;
    //OPENCL HOST CODE AREA START
    // Use the first Xilinx device found in the system
    cl_context context = handle_->get_context();
    cl_int err = CL_SUCCESS;
    static const std::vector<unsigned> ddrBankMap = {
     XCL_MEM_DDR_BANK0,
     XCL_MEM_DDR_BANK1,
     XCL_MEM_DDR_BANK2,
     XCL_MEM_DDR_BANK3
    };
    cl_mem_flags flags = CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE;
    

    void *host_ptr = (void*)din.data();
//    size_t size = din.size()*sizeof(uint32_t);
//    din_buf = new XclDeviceBuffer(handle_, host_ptr, size, ddrBankMap[handle_.get_device_info().ddr_bank], flags);

    const std::vector<std::int32_t> dindims = { din.size() };
    xir::vart::Tensor dintensor("din", dindims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> dintbuf(new xir::vart::CpuFlatTensorBuffer(host_ptr, &dintensor));
    din_buf = new XclDeviceBuffer(handle_.get(), dintbuf.get(), handle_->get_device_info().ddr_bank);



    void *resulthost_ptr = (void*)result.data();
//    size_t resultsize = result.size()*sizeof(uint32_t);
//    result_buf = new XclDeviceBuffer(handle_, resulthost_ptr, resultsize, ddrBankMap[handle_.get_device_info().ddr_bank], flags);

    const std::vector<std::int32_t> resultdims = { result.size() };
    xir::vart::Tensor resulttensor("result", resultdims, xir::vart::Tensor::DataType::UINT32);
    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> resulttbuf(new xir::vart::CpuFlatTensorBuffer(resulthost_ptr, &resulttensor));
    result_buf = new XclDeviceBuffer(handle_.get(), resulttbuf.get(), handle_->get_device_info().ddr_bank);



}

void Dpuv3Int8Controller::initGetDevBufrAddr()
{
    //Get device buffer address 
    
    buf_addr[BUF_IDX_INSTR] = instr_buf->get_phys_addr();
    buf_addr[BUF_IDX_PARAMS] = params_buf->get_phys_addr();
    buf_addr[BUF_IDX_SWAP] = swap_buf->get_phys_addr();

    buf_addr[BUF_IDX_FUSRC] = fuSrc_buf->get_phys_addr();
    buf_addr[BUF_IDX_FUDST] = fuDst_buf->get_phys_addr();

}

void Dpuv3Int8Controller::runGetDevBufrAddr()
{
    //Get device buffer address 
    
    buf_addr[BUF_IDX_DIN] = din_buf->get_phys_addr();
    buf_addr[BUF_IDX_RESULT] = result_buf->get_phys_addr();

}



void Dpuv3Int8Controller::initBufrSize()
{
    //Initialize buf_size
    buf_size[BUF_IDX_INSTR]     = instr.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_PARAMS]    = params.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_SWAP]      = swap.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_FUSRC]     = fuSrc.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_FUDST]     = fuDst.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_SRC]       = 0;
    buf_size[BUF_IDX_DST]       = 0;
    buf_size[BUF_IDX_NULL]      = 0;

    if(task_mode == 0) // If FU is used 
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

void Dpuv3Int8Controller::runInitBufrSize()
{
    //Initialize buf_size
    buf_size[BUF_IDX_DIN]       = din.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_DOUT]      = dout.size()*sizeof(uint32_t);
    buf_size[BUF_IDX_RESULT]    = result.size()*sizeof(uint32_t);

    if(task_mode == 0) // If FU is used 
    {
        buf_addr[BUF_IDX_SRC] = buf_addr[BUF_IDX_DIN];
        buf_size[BUF_IDX_SRC] = buf_size[BUF_IDX_DIN];
    }                                                                 
    else            // If FU is NOT used                                                      
    {                                                                 
        buf_addr[BUF_IDX_DST] = buf_addr[BUF_IDX_DIN];
        buf_size[BUF_IDX_DST] = buf_size[BUF_IDX_DIN];
    }
}




void Dpuv3Int8Controller::execute()
{
    xrt_device* xdev = handle_->get_device_info().xdev;
    xrtcpp::acquire_cu_context(xdev,0);
    xrtcpp::exec::exec_write_command cmd(xdev);
    cmd.add_cu(0);
    auto start = utils::time_ns();
    std::cout << "Launch the kernel" << std::endl;
    run_Kernel( cmd, buf_addr, buf_size, reg_val);
    auto end = utils::time_ns();
    std::cout << "All Done !" <<  " | time (ms): " << (end-start)*1e-6 << "| fps: " << float(1.0*1e9/(end-start))*BATCH_SIZE*SLR_NUM << std::endl;
    xrtcpp::release_cu_context(xdev,0);

}

void Dpuv3Int8Controller::checkFpgaOutput()
{
    std::ofstream outputfile;
    std::string log_filename="";
    for (unsigned i = 0 ; i < dout.size(); i++)
    {

        if(i%(result.size())==0)
        {
            log_filename = "result" + std::to_string(25 + ( std::rand() % ( 63 - 25 + 1 ) )) + ".txt";
//           log_filename = "result" + std::to_string(i/(result.size())) + ".txt";
            outputfile.open (log_filename);
        }

        if ((uint32_t)dout[i] != (uint32_t)result.data()[i])
        {
            outputfile << "Error: Result mismatch.  " << "dout: " << std::hex << std::setw(8) << std::setfill('0') << (uint32_t)dout[i] << " | result: " << std::hex << std::setw(8) << (uint32_t)result.data()[i] << std::endl;
        }
        else 
        {
            outputfile << std::hex << std::setw(8) << std::setfill('0') << (uint32_t)result.data()[i] << std::endl;
        }

        if((i%(result.size()))==((result.size())-1))
        {
            outputfile.close();
        }
    }

}

std::vector<xir::vart::TensorBuffer*> 
Dpuv3Int8Controller::get_inputs() {
     const std::vector<std::int32_t> dummyInputDims = { 1 };
    xir::vart::Tensor dummyInputTensor("dummyInput", dummyInputDims, xir::vart::Tensor::DataType::UINT32);
    static const size_t dummyInputDataSize = xir::vart::size_of(dummyInputTensor.get_data_type());
    size_t dummyInputSize = dummyInputTensor.get_element_num() * dummyInputDataSize;
    void *dummyInputData;
    if (posix_memalign(&dummyInputData, getpagesize(), dummyInputSize))
      throw std::bad_alloc();

    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> dummyInputTbuf(new xir::vart::CpuFlatTensorBuffer(dummyInputData, &dummyInputTensor));

    std::vector<xir::vart::TensorBuffer*> tbufs;
    tbufs.emplace_back(dummyInputTbuf.get());

    return tbufs;

}

std::vector<xir::vart::TensorBuffer*> 
Dpuv3Int8Controller::get_outputs() {

    const std::vector<std::int32_t> dummyOutputDims = { 1 };
    xir::vart::Tensor dummyOutputTensor("dummyOutput", dummyOutputDims, xir::vart::Tensor::DataType::UINT32);
    static const size_t dummyOutputDataSize = xir::vart::size_of(dummyOutputTensor.get_data_type());
    size_t dummyOutputSize = dummyOutputTensor.get_element_num() * dummyOutputDataSize;
    void *dummyOutputData;
    if (posix_memalign(&dummyOutputData, getpagesize(), dummyOutputSize))
      throw std::bad_alloc();

    std::unique_ptr<xir::vart::CpuFlatTensorBuffer> dummyOutputTbuf(new xir::vart::CpuFlatTensorBuffer(dummyOutputData, &dummyOutputTensor));

    std::vector<xir::vart::TensorBuffer*> tbufs;
    tbufs.emplace_back(dummyOutputTbuf.get());

    return tbufs;
}


void Dpuv3Int8Controller::run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
                        const std::vector<xir::vart::TensorBuffer*> &outputs) {
    runAllocateHostMemory();
    runCreateBuffers();
    runGetDevBufrAddr();
    runInitBufrSize();
    execute();
    result_buf->download();
    checkFpgaOutput();

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

