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

#include "dpu_controller.hpp"
//#include "common/graph.hpp"
#include "dpucloud_controller.hpp"
class DpuV3eController 
: public DpuCloudController {
 public:
  DpuV3eController(std::string meta, xir::Attrs* attrs);
  DpuV3eController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
  virtual ~DpuV3eController() override;
  virtual std::vector<unsigned> get_hbmw() override;
  virtual std::vector<unsigned> get_hbmc() override;
  virtual std::vector<unsigned> get_hbmio() override;
  //virtual void run(
  //  const std::vector<vart::TensorBuffer*> &inputs, 
  //  const std::vector<vart::TensorBuffer*> &outputs) override;
  // virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override;
  // std::vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_outside(xclDeviceHandle xcl_handle,  bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs) override;
 private:
  std::vector<unsigned> hbmw;
  std::vector<unsigned> hbmc;
  std::vector<unsigned> hbmio;
};

