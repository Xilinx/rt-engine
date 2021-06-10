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
#include "dpucloud_controller.hpp"
class DpuV3meController
//: public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
: public DpuCloudController {
 public:
  DpuV3meController(std::string meta, xir::Attrs* attrs);
  DpuV3meController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
  virtual ~DpuV3meController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<unsigned> get_hbmw() override;
  virtual std::vector<unsigned> get_hbmc() override;
  virtual std::vector<unsigned> get_hbmio() override;
  //virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override; 
 private:
  std::tuple<uint64_t,int32_t,std::string> alloc_and_fill_device_memory(xclDeviceHandle handle, std::vector<char> code);
  int dpu_hbm_start;
  vector<unsigned> hbm;
};
