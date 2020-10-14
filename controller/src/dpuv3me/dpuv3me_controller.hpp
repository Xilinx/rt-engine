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

 private:
  void init(const std::string &meta);
  std::vector<const xir::Tensor*> get_merged_io_tensors() const;

  std::vector<std::unique_ptr<XrtContext>> contexts_;
  uint64_t code_addr_;
  uint64_t reg0_addr_;
  uint64_t preload_code_addr_;
  uint64_t preload_reg0_addr_;
  int program_once_complete;
  std::vector<std::vector<std::int32_t>> input_dims;
  std::vector<std::vector<std::int32_t>> output_dims;

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
    layer_info(std::string name){ this->name = name;}
    std::string name;
    address_info code_addr;
    std::vector<address_info> inputs;
    std::vector<address_info> outputs;
    void dbg_print() {
      std::cout << name << "\n  CODE( " << code_addr.first << " , " << code_addr.second << " )\n  ";
      std::cout << "IN " << inputs.size() << " : ";
      for(auto& l : inputs)
        std::cout << "(" << l.first << " , " << l.second << ") ";
      std::cout << "\n  ";
      std::cout << "OUT " << outputs.size() << " : ";
      for(auto& o : outputs)
        std::cout << "(" << o.first << " , " << o.second << ") ";
      std::cout << std::endl;
    }
  };
  std::vector<layer_info> dbg_layers_;
  bool dump_mode_;
  std::string dump_folder_;
  bool debug_mode_;
};
