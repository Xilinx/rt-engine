#define REG_NUM                         31
#include "json-c/json.h"

#include "dpu_controller.hpp"
#include "experimental/xrtexec.hpp"
#include "dpu_runner.hpp"

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
  virtual void run(const std::vector<vart::TensorBuffer*> &inputs, 
           const std::vector<vart::TensorBuffer*> &outputs) override;

  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs() override;
  virtual std::vector<vart::TensorBuffer*> get_outputs() override;


 private:    
  
  void initializeTaskFUVariables();//TO-DO MNDBG 
  void initCreateBuffers();//TO-DO MNDBG
  void preprocess(vart::TensorBuffer*, vart::TensorBuffer*);//TO-DO MNDBG
  void postprocess(vart::TensorBuffer*, vart::TensorBuffer*);//TO_DO MNDBG
  std::vector<vart::TensorBuffer*> create_hw_buffers(std::vector<vart::TensorBuffer*> stdBuf, bool isInput=true);
  std::vector<int32_t, aligned_allocator<int32_t>> load(std::string filename);
  vart::TensorBuffer* get_hw_buffer(vart::TensorBuffer *tb);
  void initRunBufs(uint64_t *buf_addr, uint32_t *buf_size, XclDeviceBuffer* swap_buf, XclDeviceBuffer* fuSrc_buf, XclDeviceBuffer* fuDst_buf);
  void execute(uint64_t *buf_addr, uint32_t *buf_size);
  void runKernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* buf_size, uint32_t* reg_val);
  void checkFpgaOutput(XclDeviceBuffer *outbuf);
  std::string getFileNameIfExists(std::string name, json_object* jobj);

  std::unique_ptr<xir::Tensor> in_tensor_;
  std::unique_ptr<xir::Tensor> out_tensor_;
  std::unique_ptr<xir::Tensor> in_hw_tensor_;
  std::unique_ptr<xir::Tensor> out_hw_tensor_;
  std::unique_ptr<xir::Tensor> instr_tensor_;
  std::unique_ptr<xir::Tensor> params_tensor_;
  std::unique_ptr<xir::Tensor> swap_tensor_;
  std::unique_ptr<xir::Tensor> fuSrc_tensor_;
  std::unique_ptr<xir::Tensor> fuDst_tensor_;

  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> stdbuf2hwbuf_;

  std::vector<int,aligned_allocator<int>> dout_;
 
  uint32_t task_mode_;

  uint32_t reg_val[REG_NUM];

  std::unique_ptr<XclDeviceBuffer> instr_buf_;
  std::unique_ptr<XclDeviceBuffer> params_buf_;
  std::unique_ptr<XclDeviceBuffer> swap_buf_;
  std::unique_ptr<XclDeviceBuffer> fuSrc_buf_;
  std::unique_ptr<XclDeviceBuffer> fuDst_buf_;

  std::unique_ptr<vart::CpuFlatTensorBuffer> instrTbuf_;
  std::unique_ptr<vart::CpuFlatTensorBuffer> paramsTbuf_;
  std::unique_ptr<vart::CpuFlatTensorBuffer> swapTbuf_;
  std::unique_ptr<vart::CpuFlatTensorBuffer> fuSrcTbuf_;
  std::unique_ptr<vart::CpuFlatTensorBuffer> fuDstTbuf_;


  std::string modelName_;
  std::string instr_filename_;
  std::string din_filename_;
  std::string dout_filename_;
  std::string result_filename_;
  std::string params_filename_;

};
