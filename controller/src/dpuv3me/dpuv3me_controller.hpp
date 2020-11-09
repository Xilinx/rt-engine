#include "dpu_controller.hpp"

class DpuV3meController
: public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
 public:
  DpuV3meController(std::string meta);
  DpuV3meController(const xir::Subgraph *subgraph);
  virtual ~DpuV3meController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs() override; 
  virtual std::vector<vart::TensorBuffer*> get_outputs() override; 
  std::vector<float> get_input_scale(); 
  std::vector<float> get_output_scale(); 

 private:
  void init(const std::string &meta);
  void init(const xir::Subgraph* subgraph);
  void init_graph(const xir::Subgraph* subgraph);
  std::vector<const xir::Tensor*> get_merged_io_tensors() const;
  std::vector<vart::TensorBuffer*> init_tensor_buffer(std::vector<const xir::Tensor*> tensors);
  std::pair<uint64_t,int32_t> alloc_and_fill_device_memory(xclDeviceHandle handle, std::vector<char> code);
  std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> tbuf2hwbuf_;
  std::mutex hwbuf_mtx_;
  std::list<std::unique_ptr<vart::TensorBuffer>> bufs_;
  std::vector<std::unique_ptr<XrtContext>> contexts_;
  uint64_t code_addr_;
  uint64_t reg0_addr_;
  uint64_t preload_code_addr_;
  uint64_t preload_reg0_addr_;
  int program_once_complete;
  std::vector<std::vector<std::int32_t>> input_dims;
  std::vector<std::vector<std::int32_t>> output_dims;
  std::vector<const xir::Tensor*> input_tensors_;
  std::vector<const xir::Tensor*> output_tensors_;
  std::vector<std::int32_t> xdpu_io_input_offset;
  std::vector<std::int32_t> xdpu_io_output_offset;
  int32_t xdpu_io_total_size;
  std::vector<float> input_scales_;
  std::vector<float> output_scales_;

  //****************************************************
  // Debug instruction support
  //****************************************************
  /** address info: <offset, size> */
  using address_info = std::pair<uint64_t,int32_t>;
  /**
   * layer information
   * @param code_addr: address for instruction
   * @param inputs: offset and size pairs of input tensors
   * @param outputs: offset and size pairs of output tensors
   */
  struct layer_info {
    layer_info(std::string name){
      this->name = name;
      this->preload_code_addr.first = 0x0ul;
      this->code_addr.first = 0x0ul;
    }
    std::string name;
    address_info preload_code_addr;
    address_info code_addr;
    std::vector<address_info> inputs;
    std::vector<address_info> outputs;
    std::vector<std::string> inputs_name;
    std::vector<std::string> outputs_name;
    void dbg_print() {
      std::cout << name << "\n  ";
      std::cout << "PRELOAD_CODE( " << preload_code_addr.first << " , " << preload_code_addr.second << " )\n  ";
      std::cout << "CODE( " << code_addr.first << " , " << code_addr.second << " )\n  ";
      std::cout << "IN " << inputs.size() << " : ";
      for(auto& l : inputs)
        std::cout << "(" << l.first << " , " << l.second << ") ";
      std::cout << "\n  ";
      std::cout << "OUT " << outputs.size() << " : ";
      for(auto& o : outputs)
        std::cout << "(" << o.first << " , " << o.second << ") ";
      std::cout << std::endl;
    }
    static std::string name_map(std::string raw) {
      std::string tmp = std::regex_replace(raw, std::regex("/"), "_");
      tmp = std::regex_replace(tmp, std::regex("\\(.*\\)"), "");
      return tmp + ".bin";
    }
  };
  std::vector<layer_info> dbg_layers_;
  bool dump_mode_;
  std::string dump_folder_;
  bool debug_mode_;
};
