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


#define BUF_IDX_NUM                     BUF_IDX_NULL+1
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

#define REG_NUM                         31
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

#include "dpu_controller.hpp"
#include "experimental/xrtexec.hpp"

template <typename T>
struct aligned_allocator
{
    using value_type = T;
    T *allocate(std::size_t num)
    {
        void *ptr = nullptr;
        if (posix_memalign(&ptr, 4096, num * sizeof(T)))
            throw std::bad_alloc();
        return reinterpret_cast<T *>(ptr);
    }
    void deallocate(T *p, std::size_t num)
    {
        free(p);
    }
};


class Dpuv3Int8Controller : public XclDpuController<XclDeviceHandle, XclDeviceBuffer, XclDeviceBuffer> {
 public:
  Dpuv3Int8Controller(std::string meta);
  virtual ~Dpuv3Int8Controller() override;
  virtual void run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
           const std::vector<xir::vart::TensorBuffer*> &outputs) override;
  std::vector<int32_t, aligned_allocator<int32_t>> load(std::string filename);
  static void run_Kernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* buf_size, uint32_t* reg_val);
  virtual std::vector<xir::vart::TensorBuffer*> get_inputs() override;
  virtual std::vector<xir::vart::TensorBuffer*> get_outputs() override;


 private:    

  void init();
  void initializeTaskFUVariables();
  void initAllocateHostMemory();
  void runAllocateHostMemory();
  void initCreateBuffers();
  void runCreateBuffers();
  void initGetDevBufrAddr();
  void runGetDevBufrAddr();
  void initBufrSize();
  void runInitBufrSize();
  void execute();
  void checkFpgaOutput();

  std::vector<int,aligned_allocator<int>> instr;
  std::vector<int,aligned_allocator<int>> params;
  std::vector<int,aligned_allocator<int>> swap;
  std::vector<int,aligned_allocator<int>> din;
  std::vector<int,aligned_allocator<int>> dout;
  std::vector<int,aligned_allocator<int>> result;
  std::vector<int,aligned_allocator<int>> fuSrc;
  std::vector<int,aligned_allocator<int>> fuDst;       	    

  uint32_t task_fu_addr_strd;
  uint32_t task_fu_kw;
  uint32_t task_fu_sw;
  uint32_t task_fu_ic;
  uint32_t task_fu_ow;
  uint32_t task_fu_oh;
  uint32_t task_fu_src_ntrans;
  uint32_t task_fu_dst_ntrans;
  uint32_t task_fu_pl_corr;
  uint32_t task_fu_pr_corr;
  uint32_t task_fu_iw_corr;
  uint32_t task_fu_sw_corr;
  uint32_t task_fu_wcg_corr;
  uint32_t task_fu_read_mode;
  uint32_t task_mode;
  uint32_t reg_axcache_axos;
  uint32_t reg_dpu_prof_enable;

  uint64_t buf_addr[BUF_IDX_NUM];
  uint32_t buf_size[BUF_IDX_NUM];
  uint32_t reg_val[REG_NUM];

  XclDeviceBuffer* instr_buf;
  XclDeviceBuffer* params_buf;
  XclDeviceBuffer* swap_buf;
  XclDeviceBuffer* din_buf;
  XclDeviceBuffer* result_buf;
  XclDeviceBuffer* fuSrc_buf;
  XclDeviceBuffer* fuDst_buf;
  
  std::string modelName;

  std::string instr_filename;
  std::string din_filename;
  std::string dout_filename;
  std::string result_filename;
  std::string params_filename;

};
