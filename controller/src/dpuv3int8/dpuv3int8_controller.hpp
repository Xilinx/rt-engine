#define BUF_IDX_NUM                     12
#define REG_NUM                         31

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
