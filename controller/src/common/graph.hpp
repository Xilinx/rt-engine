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

class DpuXmodel  {
 public:
  DpuXmodel(const std::string meta);
  DpuXmodel(const xir::Subgraph *subgraph);
  virtual ~DpuXmodel();
  std::vector<std::tuple<char*, int32_t,int>> get_parameter() {
    return xdpu_parameter_map;
  }
  std::unordered_map<char*, std::pair<int32_t,int>> get_code() {
    return xdpu_code_map;
  }
  std::vector<std::int32_t> get_input_offset() {
    return xdpu_io_input_offset;
  }
  std::vector<std::int32_t> get_output_offset() {
    return xdpu_io_output_offset;
  }
  void init_vitis_tensors(int batch_size, size_t device_index);
  /**
   * layer information
   * @param code_addr: address for instruction
   * @param inputs: offset and size pairs of input tensors
   * @param outputs: offset and size pairs of output tensors
   */ 
  struct subg_info {
    std::string name;
    uint64_t workload;
    uint64_t depth;
  };
  using address_info = std::tuple<uint64_t,int32_t,std::string,int32_t>; 
  using address_info_debug = std::tuple<int8_t*,int32_t,std::string>; 
  struct layer_info {
    layer_info(std::string name){ this->name = name;}
    std::string name;
    uint64_t workload;
    uint64_t depth;
    address_info_debug code_addr;
    address_info_debug code_addr_preload;
    std::vector<address_info> inputs;
    std::vector<address_info> outputs;
    void dbg_print() {
      std::cout << name << "\n  CODE( " << std::get<0>(code_addr) << " , " << std::get<1>(code_addr) << " )\n  ";
      std::cout << "IN " << inputs.size() << " : ";
      for(auto& l : inputs)
        std::cout << "(" << std::get<0>(l) << " , " << std::get<1>(l) << ") ";
      std::cout << "\n  ";
      std::cout << "OUT " << outputs.size() << " : ";
      for(auto& o : outputs)
        std::cout << "(" << std::get<0>(o) << " , " << std::get<1>(o) << ") ";
      std::cout << std::endl;
    }
    static std::string name_map(std::string raw) {
      std::string tmp = std::regex_replace(raw, std::regex("/"), "_");
      tmp = std::regex_replace(tmp, std::regex("\\(.*\\)"), "");
      return tmp + ".bin";
    }
  }; 
  subg_info get_subgraph_info() {
    return subgraph_info;
  }
  std::vector<layer_info> get_dbg_layers() {
    return dbg_layers_;
  }
  bool get_dump_mode() {
    return dump_mode_;
  }
  std::string get_dump_folder() {
    return dump_folder_;
  }
  bool get_debug_mode() {
    return debug_mode_;
  }
  int is_splitio() {
    return split_io;
  }
  int32_t get_total_outsize() {
    return xdpu_total_out_size;
  }
  int32_t get_total_insize() {
    return xdpu_total_in_size;
  }
  int32_t get_input_regid() {
    return input_regid;
  }
  int32_t get_output_regid() {
    return output_regid;
  }
  std::vector<float> get_input_scales() {
    return input_scales_;
  } 
  std::vector<float> get_output_scales() {
    return output_scales_;
  } 
  std::vector<std::pair<int32_t, int32_t>> get_xdpu_total_reg_map() {
    return xdpu_total_reg_map_out;
  }
  std::vector<std::pair<int32_t, int32_t>> get_xdpu_workspace_reg_map() {
    return xdpu_workspace_reg_map;
  }
  std::unordered_map<int32_t, std::string> get_xdpu_regid_to_hw_segment() {
    return xdpu_regid_to_hw_segment;
  }
  const xir::Subgraph* get_subgraph() {
    return subgraph_;
  }
  std::vector<const xir::Tensor*> get_graph_input_tensors();
  std::vector<const xir::Tensor*> get_graph_output_tensors();
  std::vector<const xir::Tensor*> get_output_tensors();
  std::vector<const xir::Tensor*> get_input_tensors();
  int32_t get_total_out_size() { return xdpu_total_out_size;}
  int32_t get_total_in_size() { return xdpu_total_in_size;}
  std::vector<layer_info> dbg_layers_;
  bool dump_mode_;
  std::string dump_folder_;
  bool debug_mode_;
  int split_io;
  //int batch_size_;
  int32_t xdpu_total_out_size;
  int32_t xdpu_total_in_size;
  int32_t input_regid;
  int32_t output_regid;
  //std::unordered_map<string,float> input_scales_;
  //std::unordered_map<string,float> output_scales_;
  std::vector<float> input_scales_;
  std::vector<float> output_scales_;
  uint64_t fingerprint;
  uint64_t get_fingerprint() {
    return fingerprint;
  }
 private:
  void init(const std::string &meta);
  void init(const xir::Subgraph* subgraph);
  void init_graph(const xir::Subgraph* subgraph);

  std::vector<std::vector<std::int32_t>> input_dims;
  std::vector<std::vector<std::int32_t>> output_dims;
  //std::vector<const xir::Tensor*> input_tensors_;
  //std::vector<const xir::Tensor*> output_tensors_;
  //std::vector<const xir::Tensor*> vitis_input_tensors_;
  //std::vector<const xir::Tensor*> vitis_output_tensors_;
  std::vector<std::unique_ptr<xir::Tensor>> intensors_;
  std::vector<std::unique_ptr<xir::Tensor>> outtensors_;
  std::vector<std::unique_ptr<xir::Tensor>> graph_intensors_;
  std::vector<std::unique_ptr<xir::Tensor>> graph_outtensors_;
  std::vector<std::int32_t> xdpu_io_input_offset;
  std::vector<std::int32_t> xdpu_io_output_offset;
  std::vector<std::pair<int32_t, int32_t>> xdpu_workspace_reg_map;
  std::unordered_map<int32_t, int32_t> xdpu_total_reg_map;
  std::vector<std::pair<int32_t, int32_t>> xdpu_total_reg_map_out;
  std::vector<std::tuple<char*, int32_t,int>> xdpu_parameter_map;
  std::unordered_map<int32_t,std::string> xdpu_regid_to_hw_segment;
  std::unordered_map<char*, std::pair<int32_t,int>> xdpu_code_map;
  subg_info subgraph_info;
  const xir::Subgraph *subgraph_;
  std::list<std::unique_ptr<xir::Tensor>> tensors_;
  
};

