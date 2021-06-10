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

#include <map>
#include <iostream>
#include <fstream>
#include <sstream>
#include <bits/stdc++.h>

#include "json-c/json.h"
#include "experimental/xrtexec.hpp"

#include <xir/graph/graph.hpp>
#include <xir/graph/subgraph.hpp>
#include <xir/util/tool_function.hpp>

#include "dpu_controller.hpp"
#include "dpuv3int8_regmap.hpp"
#include "dpuv3int8_instr_format_conversion.hpp"
#include "dpuv3int8_xmodel.hpp"
#include "dpu_runner.hpp"

#define REG_NUM                         31

template <typename T>
struct aligned_allocator
{
    using value_type = T;
    T *allocate(std::size_t num)
    {
        void *ptr = nullptr;
        //not use 4096 but use getpagesize instead
        //similar to http://xcdl190260/aaronn/rt-engine/blob/master/controller/src/dpu_controller.cpp#L102
        if (posix_memalign(&ptr, 4096, num * sizeof(T)))
            throw std::bad_alloc();
        return reinterpret_cast<T *>(ptr);
    }
    void deallocate(T *p, std::size_t num)
    {
        free(p);
    }
};


class Dpuv3Int8Controller : public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
 public:
  Dpuv3Int8Controller(std::string meta);
  Dpuv3Int8Controller(const xir::Subgraph *subgraph);
  virtual ~Dpuv3Int8Controller() override;
  virtual void run(const std::vector<vart::TensorBuffer*> &inputs, 
           const std::vector<vart::TensorBuffer*> &outputs) override;

  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override;
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override;


 protected:    
  virtual void preprocess(vart::TensorBuffer*, vart::TensorBuffer*); 
  virtual void each_output_reorg(void* std_data, void *result_data, int ddr_size, int startVal, int std_size, int stdOutCh, int outputNumber);
  virtual void runKernel(ert_start_kernel_cmd* ecmd, uint64_t* buf_addr, uint32_t* reg_val, xclDeviceHandle xcl_handle, xclBufferHandle bo_handle);
//  virtual void runKernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* reg_val);
  virtual void initRunBufs(uint64_t *buf_addr, XrtDeviceBuffer* swap_buf, XrtDeviceBuffer* druSrc_buf, XrtDeviceBuffer* druDst_buf);
  void readRegs(xclDeviceHandle xcl_handle);
  static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset); 
  std::unique_ptr<Xmodel> xmodel_;
  std::unique_ptr<XrtDeviceBuffer> instr_buf_;
  std::unique_ptr<XrtDeviceBuffer> params_buf_;
  std::vector<int,aligned_allocator<int>> params_;

 private:
  virtual void channelAugmentation(std::vector<int8_t> &inputStdData, std::vector<int8_t> &channelAugmentedData, std::vector<int> &channelAugShape);
  virtual void batchInterleave(std::vector<int8_t> &inputData, std::vector<int8_t> &batchInterleavedData, std::vector<int> &channelAugShape);
  virtual void output_reorg(std::vector<void*>, void*, int); 
  void initializeTensors();  
  void initializeTaskDRUVariables(); 
  virtual void initCreateBuffers();
  void initRegMap();
  uint32_t readReg(unsigned offset);
  void dumpReg();
  void postprocess(std::vector<vart::TensorBuffer*>, vart::TensorBuffer*);
  std::vector<vart::TensorBuffer*> create_hw_buffers(std::vector<vart::TensorBuffer*> stdBuf, bool isInput);
  vart::TensorBuffer* get_hw_buffer(vart::TensorBuffer *tb);
  
  std::unique_ptr<xir::Tensor> in_tensor_;
  std::vector<std::unique_ptr<xir::Tensor>> out_tensors_; 
  std::unique_ptr<xir::Tensor> in_hw_tensor_;
  std::unique_ptr<xir::Tensor> out_hw_tensor_;
  std::unique_ptr<xir::Tensor> instr_tensor_;
  std::unique_ptr<xir::Tensor> params_tensor_;
  std::unique_ptr<xir::Tensor> swap_tensor_;
  std::unique_ptr<xir::Tensor> druSrc_tensor_;
  std::unique_ptr<xir::Tensor> druDst_tensor_;

  std::vector<int,aligned_allocator<int>> instr_;
  std::vector<std::unique_ptr<XrtContext>> contexts_;

  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> stdbuf2hwbuf_;
  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> stdbuf2swapbuf_;
  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> stdbuf2druSrcbuf_;
  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> stdbuf2druDstbuf_;

  std::unique_ptr<vart::CpuFlatTensorBuffer> instrTbuf_;
  std::unique_ptr<vart::CpuFlatTensorBuffer> paramsTbuf_;

  uint32_t reg_val[REG_NUM];

  static std::vector<int32_t, aligned_allocator<int32_t>> load(std::string filename);
  static std::vector<int32_t, aligned_allocator<int32_t>> load(std::vector<std::string> svals);

  cl_mem regMap_;

  static void data_float2fix(int8_t* dataDst, float* dataSrc, int size, float scale);
  static void data_fix2float(float* dataDst, int8_t* dataSrc, int size, float scale);

};

class Dpuv3Int8DebugController : public Dpuv3Int8Controller {

  public:
    Dpuv3Int8DebugController(std::string meta);
    Dpuv3Int8DebugController(const xir::Subgraph *subgraph);

  private:
    virtual void preprocess(vart::TensorBuffer*, vart::TensorBuffer*);
    virtual void runKernel(ert_start_kernel_cmd* ecmd, uint64_t* buf_addr, uint32_t* reg_val, xclDeviceHandle xcl_handle, xclBufferHandle bo_handle);
//   virtual void runKernel(xrtcpp::exec::exec_write_command cmd, uint64_t* buf_addr, uint32_t* reg_val);
    virtual void initRunBufs(uint64_t *buf_addr, XrtDeviceBuffer* swap_buf, XrtDeviceBuffer* druSrc_buf, XrtDeviceBuffer* druDst_buf);
    virtual void each_output_reorg(void* std_data, void *result_data, int ddr_size, int startVal, int std_size, int stdOutCh, int outputNumber);
    void loadBinFile(std::string binFileName, bool isInput, int idx);
    std::string toHexWidth2( uint32_t i );
    std::string toHexWidth16( uint32_t i );
    void convert2DmemFormat(std::vector<int8_t> &flattenedData, std::string dataName, std::string outFileName);
    void compareAgainstGolden(void *outData, int std_size, int idx);
    void batchInterleave();
    void channelAug();
    void debugDumpRegVals(uint64_t* buf_addr, uint32_t* reg_val);
    void debugDumpOutputs(void *std_data, void *result_data, int result_size, int std_size, int outIdx);
    void debugDumpParams(void *params_data, int params_size);
    void debugDumpInstr();
    void debugDumpParamsDdrFormat();
    void debugDumpInstrAcCode(); 
    
    uint32_t chAugW_;
    uint32_t chAugH_;
    uint32_t chAugCh_;
    
    std::vector<int8_t> debugInput_;
    std::vector<std::vector<int8_t>> debugGolden_;
    std::vector<int8_t> debugChAug_;
    std::vector<int8_t> debugBatchInterleaved_;
        
    std::ofstream debug_dumpvals_;
    std::vector<std::unique_ptr<XrtContext>> contexts_;

    bool dumpDmem_;
};


