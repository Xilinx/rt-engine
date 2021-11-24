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
#include <queue>
//
//DEF_ENV_PARAM(DEBUG_DPU_CONTROLLER, "0")
//
//
class tensorbufferPool {
 public:
  static tensorbufferPool& Instance() {
    static tensorbufferPool pool(8);
    return pool;
  }
  std::pair<vector<vart::TensorBuffer*>,vector<vart::TensorBuffer*>> get(std::string model) {
    auto iter = queues.find(model);
    if (iter != queues.end()) {
      auto queue = iter->second;
      while(queue.empty()) {
      }
      auto ptr = queue.front();
      queue.pop();
      return ptr;
    } else {
      throw std::runtime_error("No queue available!");
    }

  }
  explicit tensorbufferPool(const size_t pool_size) : size_(pool_size) {
    //cache_ = new vart::TensorBuffer[size_];
    //for (size_t i=0; i<size_; i++) {
    //  queue_.push(&cache_[i]);
    //}
   
  }
  ~tensorbufferPool() {
    //if(cahche_) {
    //  delete cache_;
    //  cache_ = nullptr;
    //}
    //for (auto &ptr : extended_cache_) {
    //  delete ptr;
    //}

  }
  void extend (std::string model, std::pair<std::vector<vart::TensorBuffer*>, std::vector<vart::TensorBuffer*>> buf) {
      //extended_cache_.push_back(bufin);
      //extended_cache_.push_back(bufout);
    auto iter = queues.find(model);
    if (iter != queues.end()) {
      auto queue = iter->second;
      queue.push(buf);
      queues.emplace(model,queue);
    } else {
      std::queue<std::pair<vector<vart::TensorBuffer*>,vector<vart::TensorBuffer*>>> queue;
      queue.push(buf);
      queues.emplace(model,queue);
    }
  }
  bool check(std::string dm5) {
    auto iter = queues.find(dm5);
    if (iter != queues.end())
      return true;
    else
      return false;
  }

  private:
    //std::queue<std::pair<vector<vart::TensorBuffer*>,vector<vart::TensorBuffer*>>> queue_;
    std::unordered_map<std::string,std::queue<std::pair<vector<vart::TensorBuffer*>,vector<vart::TensorBuffer*>>>> queues;
    //vart::TensorBuffer* cache_ = nullptr;
    //std::list<vector<vart::TensorBuffer*>> extended_cache_;
    const size_t size_;
};
class DpuCloudController 
: public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
 public:
  DpuCloudController(std::string meta, xir::Attrs* attrs);
  DpuCloudController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
  virtual ~DpuCloudController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override; 
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override; 
  virtual std::vector<vart::TensorBuffer*> get_outputs_inner(vector<unsigned> hbm,bool isInputs, int batchsz=-1) ; 
  vector<float> get_input_scale() override; 
  vector<float> get_output_scale() override; 
  //float get_input_scale(xir::Tensor* tensor); 
  float get_output_scale(xir::Tensor* tensor); 
  virtual std::vector<unsigned> get_hbmw();
  virtual std::vector<unsigned> get_hbmc();
  virtual std::vector<unsigned> get_hbmio();
  virtual std::vector<vart::TensorBuffer*> create_tensor_buffers_hbm(
    const std::vector<const xir::Tensor*> &tensors, bool isInput, vector<unsigned> ddrBank,int batch_size);

  //virtual void init(const std::string &meta);
  //virtual void init(const xir::Subgraph* subgraph);
  virtual void init_graph(vector<unsigned> hbmw, vector<unsigned> hbmc, xir::Attrs* attrs);
  virtual std::vector<const xir::Tensor*> get_merged_io_tensors(int size) const;
  virtual std::vector<vart::TensorBuffer*> init_tensor_buffer(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine=1);
  virtual std::vector<const xir::Tensor*> init_tensor(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngine=1);
  virtual bool check_tensorbuffer_outside(const std::vector<vart::TensorBuffer*> &outputs);
  virtual void free_buffers(std::vector<vart::TensorBuffer*> &tbufs);
  virtual void tensorbuffer_trans(std::vector<vart::TensorBuffer*> &input_tensor_buffers, std::vector<vart::TensorBuffer*> &output_tensor_buffers, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs, bool is_input);
  virtual vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_inside(bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, std::vector<vart::TensorBuffer*> &output_tensor_buffers, std::vector<vart::TensorBuffer*> &input_tensor_buffers );
  vector<std::tuple<int, int,uint64_t>> get_dpu_reg_outside(bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs);
  vector<std::tuple<int, int,uint64_t>> get_dpu_reg_outside_hbm(bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs);
  std::vector<vart::TensorBuffer*> create_tensorbuffer_for_batch(vector<unsigned> hbm, bool isInputs, std::vector<const xir::Tensor*> tensors, std::vector<int> tensor_offset, int output_bz, bool isTensorsBatch);
  void dpu_trigger_run(ert_start_kernel_cmd* ecmd, xclDeviceHandle xcl_handle, xclBufferHandle bo_handle, vector<std::tuple<int, int,uint64_t>> xdpu_total_dpureg_map2);
  xclBufferHandle get_xrt_bo(void* data, int size, vector<unsigned> hbm);
  xclBufferHandle get_xrt_bo(void* data, int size, unsigned hbm);
  std::unordered_map<vart::TensorBuffer*, std::unordered_map<int,vector<vart::TensorBuffer*>>> tbuf2hwbufsio_;
  std::mutex hwbufio_mtx_;
  std::list<std::unique_ptr<vart::TensorBuffer>> bufs_;
  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> bufsView2Phy_;
  std::list<std::unique_ptr<vart::TensorBufferExtImpView>> bufsView_;
  std::vector<std::unique_ptr<XrtContext>> contexts_;
  uint64_t code_addr_;
  uint64_t preload_code_addr_;
  uint64_t reg0_addr_;
  int program_once_complete;
  //bool in_split;
  //bool out_split;
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
  void init_profiler();
  std::string md5;
  bool share;
};

