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
  std::vector<const xir::Tensor*> get_input_tensors() {
    return input_tensors_;
  }
  std::vector<const xir::Tensor*> get_output_tensors() {
    return output_tensors_;
  }
  /**
   * layer information
   * @param code_addr: address for instruction
   * @param inputs: offset and size pairs of input tensors
   * @param outputs: offset and size pairs of output tensors
   */ 
  using address_info = std::tuple<uint64_t,int32_t,std::string,int32_t>; 
  using address_info_debug = std::tuple<int8_t*,int32_t,std::string>; 
  struct layer_info {
    layer_info(std::string name){ this->name = name;}
    std::string name;
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
  uint8_t get_input_regid() {
    return input_regid;
  }
  uint8_t get_output_regid() {
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
  std::vector<layer_info> dbg_layers_;
  bool dump_mode_;
  std::string dump_folder_;
  bool debug_mode_;
  int split_io;
  //int batch_size_;
  int32_t xdpu_total_out_size;
  int32_t xdpu_total_in_size;
  uint8_t input_regid;
  uint8_t output_regid;
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
  std::vector<const xir::Tensor*> input_tensors_;
  std::vector<const xir::Tensor*> output_tensors_;
  std::vector<std::int32_t> xdpu_io_input_offset;
  std::vector<std::int32_t> xdpu_io_output_offset;
  std::vector<std::pair<int32_t, int32_t>> xdpu_workspace_reg_map;
  std::unordered_map<int32_t, int32_t> xdpu_total_reg_map;
  std::vector<std::pair<int32_t, int32_t>> xdpu_total_reg_map_out;
  std::vector<std::tuple<char*, int32_t,int>> xdpu_parameter_map;
  std::unordered_map<char*, std::pair<int32_t,int>> xdpu_code_map;
  // Debug instruction support
  //****************************************************
  /** address info: <offset, size> */
};

