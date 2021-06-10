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
class DpuV4eController 
: public DpuCloudController {
 public:
  DpuV4eController(std::string meta, xir::Attrs* attrs);
  DpuV4eController(const xir::Subgraph *subgraph, xir::Attrs* attrs);
  virtual ~DpuV4eController() override;
  //virtual void run(
  //  const std::vector<vart::TensorBuffer*> &inputs, 
  //  const std::vector<vart::TensorBuffer*> &outputs) override;
};

