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

#pragma once
#include "dpu_controller.hpp"
#include "graph.hpp"
#include "tensor_buffer_imp_host.hpp"
#include "tensor_buffer_imp_view.hpp"
#include "tensor_buffer_imp_host_phy.hpp"
#include "device_handle.hpp"
#include <queue>
#include "blockingconcurrentqueue.hpp"
#include "tensorbuffer_pool.hpp"
class Dpu {
public:
  Dpu(bool debug_mode, DeviceInfo info, int batch_size); 
  virtual void dpu_trigger_run(xrt::kernel kernel,  std::vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map_io,  std::unordered_map<int,uint64_t>& xdpu_total_dpureg_map,
  std::vector<std::pair<int, std::vector<uint64_t>>>& workspace_addr, uint64_t preload_code_addr, uint64_t code_addr);
  int program_once_complete;
  bool debug_mode_;
  DeviceInfo info_;
  int batch_size_;

}; 

#if __has_include(<filesystem>)
  #include <filesystem>
  namespace fs = std::filesystem;
#elif __has_include(<experimental/filesystem>)
  #include <experimental/filesystem>
  namespace fs = std::experimental::filesystem;
#else
  #error "Missing the <filesystem> header."
#endif

//
//DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")
class DpuXrtCloudController
: public XclDpuController<XrtNativeDeviceHandle, XrtNativeDeviceBuffer, XrtNativeDeviceBuffer> {
 public:
  DpuXrtCloudController(std::string meta, xir::Attrs* attrs);
  DpuXrtCloudController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
  virtual ~DpuXrtCloudController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs,
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override;
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override;
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override;
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override;
  virtual std::vector<vart::TensorBuffer*> get_outputs_inner(std::vector<unsigned> hbm,bool isInputs, int batchsz=-1) ;
  std::vector<float> get_input_scale() override;
  std::vector<float> get_output_scale() override;
  //float get_input_scale(xir::Tensor* tensor);
  float get_output_scale(xir::Tensor* tensor);
  virtual std::vector<unsigned> get_hbmw();
  virtual std::vector<unsigned> get_hbmc();
  virtual std::vector<unsigned> get_hbmio();
  virtual std::vector<vart::TensorBuffer*> create_tensor_buffers_hbm(
    const std::vector<const xir::Tensor*> &tensors, bool isInput, std::vector<unsigned> ddrBank,int batch_size);

  virtual void init_graph(std::vector<unsigned> hbmw, std::vector<unsigned> hbmc, xir::Attrs* attrs);
  virtual std::vector<const xir::Tensor*> get_merged_io_tensors(int size) const;
  virtual std::vector<vart::TensorBuffer*> init_tensor_buffer(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine=1);
  virtual std::vector<const xir::Tensor*> init_tensor(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine=1);
  virtual bool check_tensorbuffer_outside(const std::vector<vart::TensorBuffer*> &outputs);
  virtual void free_buffers(std::vector<vart::TensorBuffer*> &tbufs);
  virtual uint32_t tensorbuffer_trans(std::vector<vart::TensorBuffer*> &input_tensor_buffers, std::vector<vart::TensorBuffer*> &output_tensor_buffers, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, bool is_input, uint32_t buf_id);
  virtual std::vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_inside(bool create_tb_batch, std::vector<vart::TensorBuffer*> &output_tensor_buffers, std::vector<vart::TensorBuffer*> &input_tensor_buffers,
  std::vector<std::tuple<int, int,vart::TensorBuffer*>>& xdpu_total_buffer_dump);
  std::vector<std::tuple<int, int,uint64_t>> get_dpu_reg_outside(bool create_tb_batch, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs,
  std::vector<std::tuple<int, int,vart::TensorBuffer*>>& xdpu_total_buffer_dump);
  std::vector<std::tuple<int, int,uint64_t>> get_dpu_reg_outside_hbm(bool create_tb_batch, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs,
  std::vector<std::tuple<int, int,vart::TensorBuffer*>>& xdpu_total_buffer_dump);
//=======
  std::vector<vart::TensorBuffer*> create_tensorbuffer_for_batch(std::vector<unsigned> hbm, bool isInputs, std::vector<const xir::Tensor*> tensors, std::vector<int> tensor_offset, int output_bz, bool isTensorsBatch);
  xrt::bo get_xrt_bo(void* data, int size, std::vector<unsigned> hbm);
  xrt::bo get_xrt_bo(int size, std::vector<unsigned> hbm);
  xrt::bo get_xrt_bo(void* data, int size, unsigned hbm);
  xrt::bo get_xrt_bo(int size, unsigned hbm);
  std::unordered_map<vart::TensorBuffer*, std::unordered_map<int, std::vector<vart::TensorBuffer*>>> tbuf2hwbufsio_;
  std::unordered_map<vart::TensorBuffer*, xrt::bo> tbuf2reg_;
  std::mutex hwbufio_mtx_;
  std::list<std::unique_ptr<vart::TensorBuffer>> bufs_;
  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> bufsView2Phy_;
  std::list<std::unique_ptr<vart::TensorBufferExtImpView>> bufsView_;
  std::vector<std::unique_ptr<XrtNativeContext>> contexts_;
  uint64_t code_addr_;
  uint64_t  preload_code_addr_;
  std::vector<xrt::bo> bos_;
  //uint64_t reg0_addr_;
  int program_once_complete;
  //bool in_split;
  //bool out_split;
  std::vector<const xir::Tensor*> input_tensors_;
  std::vector<const xir::Tensor*> output_tensors_;
  int32_t xdpu_total_reg_size[3];
  std::unordered_map<int,uint64_t> xdpu_total_dpureg_map;
  std::unordered_map<int32_t, int32_t> xdpu_total_reg_map;
  //int32_t xdpu_total_out_size;
  //int32_t xdpu_total_in_size;
  //uint8_t input_regid;
  //uint8_t output_regid;
  //std::vector<float> input_scales_;
  //std::vector<float> output_scales_;
  //size_t getInputBufferSize();
  std::vector<int32_t> getInputOffsets();
  //size_t getOutputBufferSize();
  std::vector<int32_t> getOutputOffsets();
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
  std::vector<std::pair<int, std::vector<uint64_t>>> workspace_addr; 
  std::unordered_map<uint64_t, xrt::bo> bo_map_; 
  std::shared_ptr<DpuXmodel> model_;
  size_t cu_index_;
  size_t device_index_;
  std::unique_ptr<Dpu> dpu;
  vart::TensorBuffer* get_buffer(int32_t regid, int idx, std::vector<std::tuple<int, int,vart::TensorBuffer*>>& xdpu_total_dpureg_map_io);
 private:
  int flag;
  void init_profiler();
  bool share;
  std::unordered_map<int, xir::Tensor*> tensors_map_;
  std::list<std::unique_ptr<xir::Tensor>> tensors_;
  tensorbufferPool pool;
  xrt::bo code_;
};

