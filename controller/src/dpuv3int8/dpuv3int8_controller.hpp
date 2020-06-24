#define REG_NUM                         31
#include "json-c/json.h"

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

  virtual std::vector<const xir::vart::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::vart::Tensor*> get_output_tensors() const override; 
  virtual std::vector<xir::vart::TensorBuffer*> get_inputs() override;
  virtual std::vector<xir::vart::TensorBuffer*> get_outputs() override;


 private:    

  void initializeTaskFUVariables();
  void initCreateBuffers();
  void initRunBufs(uint64_t *buf_addr, uint32_t *buf_size);
  
  void execute(uint64_t *buf_addr, uint32_t *buf_size);
  void run_Kernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* buf_size, uint32_t* reg_val);
  void checkFpgaOutput(XclDeviceBuffer *outbuf);
  
  std::unique_ptr<XclDeviceBuffer> createBuffer(void* hostPtr, size_t size);
  std::string getFileNameIfExists(std::string name, json_object* jobj);

  std::unique_ptr<xir::vart::Tensor> in_tensor_;
  std::unique_ptr<xir::vart::Tensor> out_tensor_;

  std::vector<int,aligned_allocator<int>> instr;
  std::vector<int,aligned_allocator<int>> params;
  std::vector<int,aligned_allocator<int>> swap;
  std::vector<int,aligned_allocator<int>> dout;
  std::vector<int,aligned_allocator<int>> fuSrc;
  std::vector<int,aligned_allocator<int>> fuDst;       	    
  
  uint32_t task_mode;

  uint32_t reg_val[REG_NUM];

  std::unique_ptr<XclDeviceBuffer> instr_buf;
  std::unique_ptr<XclDeviceBuffer> params_buf;
  std::unique_ptr<XclDeviceBuffer> swap_buf;
  std::unique_ptr<XclDeviceBuffer> fuSrc_buf;
  std::unique_ptr<XclDeviceBuffer> fuDst_buf;
  

  std::string modelName;
  std::string instr_filename;
  std::string din_filename;
  std::string dout_filename;
  std::string result_filename;
  std::string params_filename;

};
