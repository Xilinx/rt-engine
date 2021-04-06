#pragma once
#include "dpu_controller.hpp"
#include "graph.hpp"
//DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")
class DpuCloudController 
: public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
 public:
  DpuCloudController(std::string meta);
  DpuCloudController(const xir::Subgraph *subgraph);
  virtual ~DpuCloudController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override; 
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override; 
  virtual std::vector<vart::TensorBuffer*> get_outputs_inner(vector<unsigned> hbm,int batchsz=-1) ; 
  virtual std::vector<float> get_input_scale() override; 
  virtual std::vector<float> get_output_scale() override; 
  virtual std::vector<unsigned> get_hbmw();
  virtual std::vector<unsigned> get_hbmc();
  virtual std::vector<unsigned> get_hbmio();
  virtual std::vector<vart::TensorBuffer*> create_tensor_buffers_hbm(
    const std::vector<const xir::Tensor*> &tensors, bool isInput, vector<unsigned> ddrBank);

  //virtual void init(const std::string &meta);
  //virtual void init(const xir::Subgraph* subgraph);
  virtual void init_graph(vector<unsigned> hbmw, vector<unsigned> hbmc);
  virtual std::vector<const xir::Tensor*> get_merged_io_tensors(int size) const;
  virtual std::vector<vart::TensorBuffer*> init_tensor_buffer(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngone=1);
  virtual bool check_tensorbuffer_outside(const std::vector<vart::TensorBuffer*> &outputs);
  virtual void free_buffers(std::vector<vart::TensorBuffer*> &tbufs, bool isInput);
  virtual void tensorbuffer_trans(std::vector<vart::TensorBuffer*> &input_tensor_buffers, std::vector<vart::TensorBuffer*> &output_tensor_buffers, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, bool is_input);
  virtual vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_inside(bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, std::vector<vart::TensorBuffer*> &output_tensor_buffers );
  virtual vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_outside(xclDeviceHandle xcl_handle, bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs );
  virtual vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_outside_hbm(xclDeviceHandle xcl_handle, bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, vector<unsigned> hbm);
  xclBufferHandle get_xrt_bo(void* data, int size, vector<unsigned> hbm);
  std::unordered_map<vart::TensorBuffer*, std::unordered_map<int,vart::TensorBuffer*>> tbuf2hwbufsio_;
  std::unordered_map<vart::TensorBuffer*, std::unordered_map<int,vector<vart::TensorBuffer*>>> tbuf2hwbufsio2_;
  std::mutex hwbufio_mtx_;
  std::mutex hwbufio2_mtx_;
  std::list<std::unique_ptr<vart::TensorBuffer>> bufs_;
  std::vector<std::unique_ptr<XrtContext>> contexts_;
  uint64_t code_addr_;
  uint64_t preload_code_addr_;
  uint64_t reg0_addr_;
  int program_once_complete;

  std::vector<const xir::Tensor*> input_tensors_;
  std::vector<const xir::Tensor*> output_tensors_;
  int32_t xdpu_total_reg_size[3];
  std::unordered_map<int,uint64_t> xdpu_total_dpureg_map;
  std::unordered_map<int32_t, int32_t> xdpu_total_reg_map;
  int32_t xdpu_total_out_size;
  int32_t xdpu_total_in_size;
  uint8_t input_regid;
  uint8_t output_regid;
  std::vector<float> input_scales_;
  std::vector<float> output_scales_;
  size_t getInputBufferSize();
  vector<int32_t> getInputOffsets();
  size_t getOutputBufferSize();
  vector<int32_t> getOutputOffsets();
  void data_float2fix(int8_t* dataDst, float* dataSrc, int size, float scale);
  void data_fix2float(float* dataDst, int8_t* dataSrc, int size, float scale);
  bool dump_mode_;
  std::string dump_folder_;
  bool debug_mode_;
  int split_io;
  int batch_size_;
  std::unordered_map<std::string, std::pair<uint64_t,int32_t>> layer_debug_mode;
  std::unordered_map<std::string, std::pair<uint64_t,int32_t>> layer_debug_mode_preload;
  std::unordered_map<int, std::vector<vart::TensorBuffer*>> xdpu_workspace_dpu; 
  std::shared_ptr<DpuXmodel> model_;
 private:
  int flag;
};

