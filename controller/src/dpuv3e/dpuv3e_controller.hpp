#include "dpu_controller.hpp"

class DpuV3eController 
: public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
 public:
  DpuV3eController(std::string meta);
  DpuV3eController(const xir::Subgraph *subgraph);
  virtual ~DpuV3eController() override;
  virtual void run(
    const std::vector<vart::TensorBuffer*> &inputs, 
    const std::vector<vart::TensorBuffer*> &outputs) override;
  virtual std::vector<const xir::Tensor*> get_input_tensors() const override; 
  virtual std::vector<const xir::Tensor*> get_output_tensors() const override; 
  virtual std::vector<vart::TensorBuffer*> get_inputs(int batchsz=-1) override; 
  virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override; 
  std::vector<float> get_input_scale(); 
  std::vector<float> get_output_scale(); 

 private:
  void init(const std::string &meta);
  void init(const xir::Subgraph* subgraph);
  void init_graph(const xir::Subgraph* subgraph);
  std::vector<const xir::Tensor*> get_merged_io_tensors(int size) const;
  std::vector<vart::TensorBuffer*> init_tensor_buffer(std::vector<const xir::Tensor*> tensors, int batchSupport, unsigned runEngone=1);
  void free_buffers(std::vector<vart::TensorBuffer*> &tbufs, bool isInput);
  //std::unordered_map<vart::TensorBuffer*, std::tuple<vector<vart::TensorBuffer*>, vector<vart::TensorBuffer*>>> tbuf2hwbufio2_;
  //std::unordered_map<vart::TensorBuffer*, std::tuple<vart::TensorBuffer*, vart::TensorBuffer*>> tbuf2hwbufio_;
  //std::unordered_map<vart::TensorBuffer*, std::tuple<vart::TensorBuffer*,vart::TensorBuffer*, vart::TensorBuffer*>> tbuf2hwbufsio_;
  std::unordered_map<vart::TensorBuffer*, std::unordered_map<int,vart::TensorBuffer*>> tbuf2hwbufsio_;
  std::unordered_map<vart::TensorBuffer*, std::unordered_map<int,vector<vart::TensorBuffer*>>> tbuf2hwbufsio2_;
  //std::unordered_map<vart::TensorBuffer*, io_map> tbuf2hwbufsio2_;
  //std::tuple<vart::TensorBuffer*, vart::TensorBuffer*, vart::TensorBuffer*> tbuf2hwbufio_;
  //std::unordered_map<vart::TensorBuffer*, vector<vart::TensorBuffer*>> tbuf2hwbufin2_;
  std::mutex hwbufio_mtx_;
  std::mutex hwbufio2_mtx_;
  //std::unordered_map<vart::TensorBuffer*, vart::TensorBuffer*> tbuf2hwbuf_;
  //std::unordered_map<vart::TensorBuffer*, vector<vart::TensorBuffer*>> tbuf2hwbuf2_;
  //std::mutex hwbuf_mtx_;
  //std::mutex hwbuf2_mtx_;
  std::list<std::unique_ptr<vart::TensorBuffer>> bufs_;
  std::vector<std::unique_ptr<XrtContext>> contexts_;
  uint64_t code_addr_;
  uint64_t reg0_addr_;
  int program_once_complete;

  std::vector<std::vector<std::int32_t>> input_dims;
  std::vector<std::vector<std::int32_t>> output_dims;
  std::vector<const xir::Tensor*> input_tensors_;
  std::vector<const xir::Tensor*> output_tensors_;
  std::vector<std::int32_t> xdpu_io_input_offset;
  std::vector<std::int32_t> xdpu_io_output_offset;
  //int32_t xdpu_io_total_size;
  int32_t xdpu_total_reg_size[3];
  //std::unordered_map<int, int> xdpu_total_io_map;
  //std::unordered_map<int, int> xdpu_total_const_map;
  std::unordered_map<int,uint64_t> xdpu_total_dpureg_map;
  //std::unordered_map<int, std::pair<int,uint64_t>> xdpu_total_dpureg_map2;
  std::unordered_map<int32_t, int32_t> xdpu_total_reg_map;
  //int32_t xdpu_total_size[8];
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
  //****************************************************
  // Debug instruction support
  //****************************************************
  /** address info: <offset, size> */
  using address_info = std::tuple<uint64_t,int32_t,std::string,int32_t>; 
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
  std::vector<layer_info> dbg_layers_;
  bool dump_mode_;
  std::string dump_folder_;
  bool debug_mode_;
  int split_io;
  int batch_size_;
  std::vector<unsigned> axi_argv;
  unsigned axi_i;
  std::vector<unsigned> axi_w;
};

