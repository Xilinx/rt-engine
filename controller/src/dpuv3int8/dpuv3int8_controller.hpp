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
  std::vector<xir::vart::TensorBuffer*> create_hw_buffers(std::vector<xir::vart::TensorBuffer*> stdBuf, bool isInput=true);
  xir::vart::TensorBuffer* get_hw_buffer(xir::vart::TensorBuffer *tb);


 private:    

  void preprocess(xir::vart::TensorBuffer*, xir::vart::TensorBuffer*);
  void postprocess(xir::vart::TensorBuffer*, xir::vart::TensorBuffer*);
  std::unordered_map<xir::vart::TensorBuffer*, xir::vart::TensorBuffer*> stdbuf2hwbuf_;

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
  std::unique_ptr<xir::vart::Tensor> in_hw_tensor_;
  std::unique_ptr<xir::vart::Tensor> out_hw_tensor_;
  std::unique_ptr<xir::vart::Tensor> instr_tensor_;
  std::unique_ptr<xir::vart::Tensor> params_tensor_;
  std::unique_ptr<xir::vart::Tensor> swap_tensor_;
  std::unique_ptr<xir::vart::Tensor> fuSrc_tensor_;
  std::unique_ptr<xir::vart::Tensor> fuDst_tensor_;

  std::vector<int,aligned_allocator<int>> instr_;
  std::vector<int,aligned_allocator<int>> params_;
  std::vector<int,aligned_allocator<int>> swap_;
  std::vector<int,aligned_allocator<int>> dout_;
  std::vector<int,aligned_allocator<int>> fuSrc_;
  std::vector<int,aligned_allocator<int>> fuDst_;       	    
  
  uint32_t task_mode_;

  uint32_t reg_val[REG_NUM];

  std::unique_ptr<XclDeviceBuffer> instr_buf_;
  std::unique_ptr<XclDeviceBuffer> params_buf_;
  std::unique_ptr<XclDeviceBuffer> swap_buf_;
  std::unique_ptr<XclDeviceBuffer> fuSrc_buf_;
  std::unique_ptr<XclDeviceBuffer> fuDst_buf_;

  std::unique_ptr<xir::vart::CpuFlatTensorBuffer> instrTbuf_;
  std::unique_ptr<xir::vart::CpuFlatTensorBuffer> paramsTbuf_;
  std::unique_ptr<xir::vart::CpuFlatTensorBuffer> swapTbuf_;
  std::unique_ptr<xir::vart::CpuFlatTensorBuffer> fuSrcTbuf_;
  std::unique_ptr<xir::vart::CpuFlatTensorBuffer> fuDstTbuf_;


  std::string modelName_;
  std::string instr_filename_;
  std::string din_filename_;
  std::string dout_filename_;
  std::string result_filename_;
  std::string params_filename_;

};
