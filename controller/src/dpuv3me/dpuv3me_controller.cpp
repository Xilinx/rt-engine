#include <cstring>
#include <iostream>
#include <fstream>
#include <iterator>
#include <sys/stat.h>
#include <sys/types.h>
#include <assert.h>
#include <ert.h>
#include <unistd.h>
#include <xrt.h>
#include <algorithm>
#include <chrono>
#include <regex>
#include <sstream>
#include <sys/stat.h>
#include <sys/types.h>
#include <iomanip>

#include "engine.hpp"
#include "dpuv3me_controller.hpp"
#include "xir/xir.h"
#include "xir/graph/graph.hpp"
#include "xir/graph/subgraph.hpp"
#include "json-c/json.h"

#include "dpu_runner.hpp"

using namespace std;
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#define BIT(nr) (1 << (nr))

#define XDPU_GLOBAL_INT_ENABLE BIT(0)
#define XDPU_CONTROL_AP 0x00
#define XDPU_CONTROL_AP_START 0x00
#define XDPU_CONTROL_GIE 0x04
#define XDPU_CONTROL_IER 0x08
#define XDPU_CONTROL_ISR 0x0C
#define BASE_ADDR 0x00000 // NOTE: USE ONLY FOR BEFORE 2020.1
#define XDPU_CONTROL_START 0x10  /* write 1 to enable DPU start */
#define XDPU_CONTROL_RESET 0x1C  /* reset DPU active low */
#define XDPU_CONTROL_HP 0x20
#define XDPU_CONTROL_INSTR_L 0x140
#define XDPU_CONTROL_INSTR_H 0x144
#define XDPU_CONTROL_ADDR_0_L 0x100 // weights / reg0
#define XDPU_CONTROL_ADDR_0_H 0x104
#define XDPU_CONTROL_ADDR_1_L 0x108 // input1
#define XDPU_CONTROL_ADDR_1_H 0x10C

/*
 * a contiguous memory block is allocated for each requests' I/O
 * layout:
 *  0      : output
 *  3071   : input
 *  153599 : intermediate
 */
//#define XDPU_IO_INPUT_OFFSET      3071
//#define XDPU_IO_OUTPUT_OFFSET        0
//#define XDPU_IO_TOTAL_SIZE    11018751
static size_t XDPU_IO_INPUT_OFFSET;
static size_t XDPU_IO_OUTPUT_OFFSET;
static size_t XDPU_IO_TOTAL_SIZE;

DpuV3meController::DpuV3meController(std::string meta)
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(meta) {
  // assign many contexts -- one for each worker thread
  // threads cannot share contexts (or xclExecWait may miss the 'done' signal)
  Engine& engine = Engine::get_instance();
  for (unsigned i=0; i < engine.get_num_workers(); i++)
    contexts_.emplace_back(new XrtContext(*handle_));

  init(meta);
}

DpuV3meController::DpuV3meController(const xir::Subgraph *subgraph) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(subgraph) {

  /**************************
   * TODO
   **************************/
}

DpuV3meController::~DpuV3meController() {
}

void DpuV3meController::init(const std::string &meta) {
  auto handle = contexts_[0]->get_dev_handle();

  //initialize all code and parameter addr to zero
  code_addr_ = 0x0;
  reg0_addr_ = 0x0;
  preload_code_addr_ = 0x0;
  preload_reg0_addr_ =0x0;

  // get directory of meta.json
  size_t slash = meta.find_last_of("/");
  auto dirpath = meta.substr(0, slash);
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());

  // get xmode name
  json_object *modelObj = NULL;
  if (!json_object_object_get_ex(jobj, "filename", &modelObj))
    throw std::runtime_error("Error: missing 'filename' field in meta.json");

  std::string modelName = json_object_get_string(modelObj);
  const string xmodel = dirpath + "/" +modelName;
  cout << xmodel<< endl;
  xclBOProperties boProp;

  if (json_object_object_get_ex(jobj, "dump_mode", &modelObj)) {
    dump_mode_ = json_object_get_boolean(modelObj);
    if(dump_mode_) {
      auto t = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
      std::stringstream ss;
      ss << "dump_" << std::put_time(std::localtime(&t), "%Y%m%d%H%M%S");
      dump_folder_ = ss.str();
      if(mkdir(dump_folder_.c_str(),S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO))
        throw std::runtime_error("Error: Create dump folder error");
    }
  }
  if (json_object_object_get_ex(jobj, "debug_mode", &modelObj)) {
    debug_mode_ = json_object_get_boolean(modelObj);
  }

  // Get all subgraphs
  auto graph = xir::Graph::deserialize(xmodel);
  auto root = graph->get_root_subgraph();
  auto children = root->children_topological_sort();
  std::vector<xir::Subgraph*> subgraph;
  for (auto c : children) {
    auto device = c->get_attr<std::string>("device");
    if (device == "DPU") {
      subgraph.emplace_back(c);
    }
  }
  // Get one subgraph
  const xir::Subgraph* subgraph_ = subgraph[0]; // check subgraph_->get_name()
  // Load parameter
  size_t parameter_size = 0;
  const char * parameter_value = NULL;
  auto reg_id_to_parameter_value =
    subgraph_->get_attr<std::map<std::string, std::vector<char>>>("reg_id_to_parameter_value");
  for (const auto& c : reg_id_to_parameter_value) {
    if (!c.second.empty()) {
      parameter_size = c.second.size();
      parameter_value = (const char *)&c.second[0];
      break;
    }
  }

  // Get Reg ID size
  auto reg_id_to_context_type =
    subgraph_->get_attr<std::map<std::string, std::string>>("reg_id_to_context_type");
  auto reg_id_to_size =
    subgraph_->get_attr<std::map<std::string, int32_t>>("reg_id_to_size");
  size_t total_io_size = 0;
  for(auto &r : reg_id_to_context_type) {
    if (r.second == "DATA") {
      total_io_size += reg_id_to_size.at(r.first);
    }
  }
  XDPU_IO_TOTAL_SIZE = total_io_size;

  layer_info layer(subgraph_->get_name());
  // Get input offset
  auto input_ops_name = subgraph_->get_attr<std::vector<std::string>>("input_ops_name");
  for (auto &in_name : input_ops_name) {
    auto op = graph->get_op(in_name);
    auto out = op->get_output_tensor();
    XDPU_IO_INPUT_OFFSET = out->get_attr<std::int32_t>("ddr_addr");
    input_dims.emplace_back(out->get_shape());
    layer.inputs.emplace_back(address_info{XDPU_IO_INPUT_OFFSET, out->get_data_size()});
  }

  // Get output offset
  auto output_ops_name = subgraph_->get_attr<std::vector<std::string>>("output_ops_name");
  for(auto &out_name : output_ops_name) {
    auto op = graph->get_op(out_name);
    auto out = op->get_output_tensor();
    XDPU_IO_OUTPUT_OFFSET = out->get_attr<std::int32_t>("ddr_addr");
    output_dims.emplace_back(out->get_shape());
    layer.outputs.emplace_back(address_info{XDPU_IO_OUTPUT_OFFSET, out->get_data_size()});
  }

  //in release mode: using dbg_layers_ to store first inputs and final outputs information
  dbg_layers_.emplace_back(std::move(layer));

  // Load mc_code
  if(!debug_mode_) {
    auto& mc_code = subgraph_->get_attr<std::vector<char>>("mc_code");
    void *codePtr = NULL;
    unsigned size = mc_code.size();
    if (posix_memalign(&codePtr, getpagesize(), size))
      throw std::bad_alloc();
    for (unsigned i=0; i < size; i++) ((char*)codePtr)[i] = mc_code[i];
    auto codeMem
      = xclAllocUserPtrBO(handle, codePtr, size, 16);
    xclSyncBO(handle, codeMem, XCL_BO_SYNC_BO_TO_DEVICE, size, 0);
    xclGetBOProperties(handle, codeMem, &boProp);
    code_addr_ = boProp.paddr;
    free(codePtr);

  } else {
    dbg_layers_.clear();
    auto children = subgraph_->get_children();
    auto child_order = subgraph_->get_attr<std::vector<std::string>>("children_topological_sort");
    for (const auto& child_name : child_order) {
      auto child = std::find_if(children.begin(), children.end(),
          [&child_name](auto g) { return g->get_name() == child_name; });

      layer_info layer(child_name);
      if ((*child)->has_attr("mc_code")) {
        auto& mc_code = (*child)->get_attr<std::vector<char> >("mc_code");

        void *codePtr = NULL;
        auto codeSize = mc_code.size();
        if (posix_memalign(&codePtr, getpagesize(), codeSize))
          throw std::bad_alloc();
        std::copy(mc_code.begin(), mc_code.end(),  (char*)codePtr);
        auto codeBO = xclAllocUserPtrBO(handle, codePtr, codeSize, 16);
        xclSyncBO(handle, codeBO, XCL_BO_SYNC_BO_TO_DEVICE, codeSize, 0);

        layer.code_addr.first = (uint64_t)xclGetDeviceAddr(handle, codeBO);
        layer.code_addr.second = codeSize;

        free(codePtr);
      }

      auto in_tensors = (*child)->get_input_tensors() ;
      for(auto t: in_tensors) {
        layer.inputs.emplace_back(address_info{t->get_attr<int32_t>("ddr_addr"), t->get_data_size()});
      }
      auto out_tensors = (*child)->get_output_tensors() ;
      for(auto t: out_tensors) {
        layer.outputs.emplace_back(address_info{t->get_attr<int32_t>("ddr_addr"), t->get_data_size()});
      }

      dbg_layers_.emplace_back(std::move(layer));
    }
  }

  // reg0
  void *reg0Ptr = NULL;
  if (posix_memalign(&reg0Ptr, getpagesize(), parameter_size))
    throw std::bad_alloc();
  for (unsigned i=0; i < parameter_size; i++) ((char*)reg0Ptr)[i] = parameter_value[i];
  auto reg0Mem
    = xclAllocUserPtrBO(handle, reg0Ptr, parameter_size, 16);
  xclSyncBO(handle, reg0Mem, XCL_BO_SYNC_BO_TO_DEVICE, parameter_size, 0);
  xclGetBOProperties(handle, reg0Mem, &boProp);
  reg0_addr_ = boProp.paddr;
  free(reg0Ptr);

  printf("preload_code_addr_: %llx\n", preload_code_addr_);
  printf("preload_reg0_addr_: %llx\n", preload_reg0_addr_);
  printf("code_addr_: %llx\n", code_addr_);
  printf("reg0_addr_: %llx\n", reg0_addr_);

  program_once_complete = 0;
}

//FIXME, both the input and output tensor info should come from xmodel
std::vector<const xir::Tensor*>
DpuV3meController::get_input_tensors() const {
  // TODO get from compiler
  static std::unique_ptr<xir::Tensor> tensor(xir::Tensor::create("input", input_dims[0], xir::DataType{xir::DataType::INT, 8}));
  return std::vector<const xir::Tensor*>(8, tensor.get());
}

std::vector<const xir::Tensor*>
DpuV3meController::get_output_tensors() const {
  // TODO get from compiler
  static std::unique_ptr<xir::Tensor> tensor(xir::Tensor::create("output", output_dims[0], xir::DataType{xir::DataType::INT, 8}));
  return std::vector<const xir::Tensor*>(8, tensor.get());
}

std::vector<const xir::Tensor*>
DpuV3meController::get_merged_io_tensors() const {
  // TODO get from compiler
  static const std::vector<std::int32_t> dims = { 1, 1, 1, (int)XDPU_IO_TOTAL_SIZE };
  static std::unique_ptr<xir::Tensor> tensor(xir::Tensor::create("inout", dims, xir::DataType{xir::DataType::INT, 8}));
  return std::vector<const xir::Tensor*>(8, tensor.get());
}

/*
 * override input alloc -- don't allocate any device buffer
 * (because we used merged {output, input, intermediate}
 *  that is mapped to output TensorBuffer)
 */
std::vector<vart::TensorBuffer*>
DpuV3meController::get_inputs() {
  const auto &tensors = get_input_tensors();
  std::vector<vart::TensorBuffer*> tbufs;
  for (unsigned ti=0; ti < tensors.size(); ti++)
  {
    // allocate aligned host memory
    const size_t dataSize 
      = std::ceil(tensors[ti]->get_data_type().bit_width / 8.f);
    size_t size = tensors[ti]->get_element_num() * dataSize;
    void *data;
    if (posix_memalign(&data, getpagesize(), size))
      throw std::bad_alloc();

    // make TensorBuffer to hold host memory
    std::unique_ptr<vart::CpuFlatTensorBuffer> tbuf(
      new vart::CpuFlatTensorBuffer(data, tensors[ti]));
    tbufs.emplace_back(tbuf.get());
    {
      std::unique_lock<std::mutex> lock(tbuf_mtx_);
      tbufs_.emplace_back(std::move(tbuf));
    }
  }

  return tbufs;
}

/*
 * override output alloc -- extend size to include
 * {output, input, intermediate}
 */
std::vector<vart::TensorBuffer*>
DpuV3meController::get_outputs() {
  return create_tensor_buffers(get_merged_io_tensors(), /*isInput*/false);
}

#define DPUREG_MISC_END 0x84
#define DPUREG_CONV_END 0x88
#define DPUREG_SAVE_END 0x8c
#define DPUREG_LOAD_END 0x90
#define DPUREG_MISC_START 0x94
#define DPUREG_CONV_START 0x98
#define DPUREG_SAVE_START 0x9c
#define DPUREG_LOAD_START 0xa0

static uint32_t read32_dpu_reg(xclDeviceHandle dpu_handle, uint64_t offset) {
  uint32_t val;
  xclRead(dpu_handle, XCL_ADDR_KERNEL_CTRL, offset, (void *)(&val), 4);
  return val;
}

void DpuV3meController::run(const std::vector<vart::TensorBuffer*> &inputs,
    const std::vector<vart::TensorBuffer*> &outputs) {

  Engine& engine = Engine::get_instance();
  const unsigned worker_id = engine.get_my_worker_id();
  if (worker_id >= contexts_.size())
    throw std::runtime_error("Error: worker_id too large; update controller code");

  auto &context = *(contexts_[worker_id]);
  auto xcl_handle = context.get_dev_handle();
  auto bo_handle = context.get_bo_handle();
  auto bo_addr = context.get_bo_addr();

  // get device buffers for input TensorBuffers
  std::vector<XrtDeviceBuffer*> io_bufs(outputs.size());
  std::vector<uint64_t> io_addrs(io_bufs.size());
  for (unsigned i=0; i < outputs.size(); i++)
  {
    io_bufs[i] = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(outputs[i]));
    io_addrs[i] = io_bufs[i]->get_phys_addr();
  }

  // upload batch of inputs
  const auto inSize = get_input_tensors()[0]->get_element_num();
  for (unsigned i=0; i < io_bufs.size() && i < inputs.size(); i++)
  {
    // instead of uploading all {output, input, intermediate},
    // just upload input region
    // io_bufs[i]->upload();
    if (xclUnmgdPwrite(xcl_handle, 0, (void*)inputs[i]->data().first, inSize,
      io_addrs[i] + XDPU_IO_INPUT_OFFSET))
      throw std::runtime_error("Error: upload failed");
  }

  int p;
  int exec_buf_result;
  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);
  ecmd->cu_mask = handle_->get_device_info().cu_mask;
  ecmd->extra_cu_masks = 0;
  ecmd->stat_enabled = 1;
  ecmd->state = ERT_CMD_STATE_NEW;
  ecmd->opcode = ERT_EXEC_WRITE;
  ecmd->type = ERT_CTRL;


auto trigger_dpu_func = [&](){
  std::vector<std::pair<int, int> > regVals;
  if (0 == program_once_complete) {
    program_once_complete = 1;

    regVals.push_back( { XDPU_CONTROL_AP, XDPU_CONTROL_AP_START });
    regVals.push_back( { XDPU_CONTROL_GIE / 4, XDPU_GLOBAL_INT_ENABLE });
    regVals.push_back( { XDPU_CONTROL_START / 4, 0x0 });
    regVals.push_back( { 0x18 / 4, 0x0 });
    regVals.push_back( { XDPU_CONTROL_HP / 4, 0x2020 });

    if (preload_code_addr_){
      // do preload
      regVals.push_back( { XDPU_CONTROL_INSTR_L / 4, preload_code_addr_ & 0xFFFFFFFF });
      regVals.push_back( { XDPU_CONTROL_INSTR_H / 4, (preload_code_addr_ >> 32) & 0xFFFFFFFF });
      regVals.push_back( { XDPU_CONTROL_ADDR_0_L / 4, preload_reg0_addr_ & 0xFFFFFFFF });
      regVals.push_back( { XDPU_CONTROL_ADDR_0_H / 4, (preload_reg0_addr_ >> 32) & 0xFFFFFFFF });

      p = 6;
      for (unsigned i=0; i < regVals.size(); i++) {
        ecmd->data[p++] = (regVals[i].first) * 4;
        ecmd->data[p++] = (regVals[i].second);
      }
      ecmd->count = 1 + p;

      // exec kernel
      exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
      if (exec_buf_result)
        throw std::runtime_error("Error: xclExecBuf failed");

      // wait for kernel
      for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
              && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);

      if (ecmd->state != ERT_CMD_STATE_COMPLETED) {
        std::cout << "Error: CU timeout when do preload " << std::endl;
        std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_LOAD_START) << std::endl;
        std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_LOAD_END) << std::endl;
        std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_SAVE_START) << std::endl;
        std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_SAVE_END) << std::endl;
        std::cout << "CONV START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_CONV_START) << std::endl;
        std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_CONV_END) << std::endl;
        std::cout << "MISC START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_MISC_START) << std::endl;
        std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_MISC_END) << std::endl;
        throw std::runtime_error("Error: CU timeout when do preload "
          + std::to_string(handle_->get_device_info().cu_index));
      }
      regVals.clear();
    }

    //configure real code and parameter
    regVals.push_back( { XDPU_CONTROL_INSTR_L / 4, code_addr_ & 0xFFFFFFFF });
    regVals.push_back( { XDPU_CONTROL_INSTR_H / 4, (code_addr_ >> 32) & 0xFFFFFFFF });
    regVals.push_back( { XDPU_CONTROL_ADDR_0_L / 4, reg0_addr_ & 0xFFFFFFFF });
    regVals.push_back( { XDPU_CONTROL_ADDR_0_H / 4, (reg0_addr_ >> 32) & 0xFFFFFFFF });
  }

  // program DPU input/output addrs
  // io_addrs.size should be 1 with v3me dpu
  for (unsigned i=0; i < 1; i++)
  {
    auto lowOffset = (XDPU_CONTROL_ADDR_1_L + (i*0x100)) / 4;
    auto highOffset = (XDPU_CONTROL_ADDR_1_H + (i*0x100)) / 4;
    regVals.push_back({ lowOffset, 0x190000000ULL & 0xFFFFFFFF });
    regVals.push_back({ highOffset, (0x190000000ULL >> 32) & 0xFFFFFFFF });
  }

  p = 6;
  for (unsigned i=0; i < regVals.size(); i++)
  {
    ecmd->data[p++] = (regVals[i].first) * 4;
    ecmd->data[p++] = (regVals[i].second);
  }
  ecmd->count = 1 + p;

  // exec kernel
  exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
  if (exec_buf_result)
    throw std::runtime_error("Error: xclExecBuf failed");

  // wait for kernel
  for (int wait_count=0; wait_count < 15 && xclExecWait(xcl_handle, 1000) == 0
            && ecmd->state != ERT_CMD_STATE_COMPLETED; wait_count++);

  if (ecmd->state != ERT_CMD_STATE_COMPLETED)
  {
    std::cout << "Error: CU timeout " << std::endl;
    std::cout << "LOAD START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_LOAD_START) << std::endl;
    std::cout << "LOAD END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_LOAD_END) << std::endl;
    std::cout << "SAVE START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_SAVE_START) << std::endl;
    std::cout << "SAVE END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_SAVE_END) << std::endl;
    std::cout << "CONV START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_CONV_START) << std::endl;
    std::cout << "CONV END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_CONV_END) << std::endl;
    std::cout << "MISC START:" << read32_dpu_reg(xcl_handle,  0+ DPUREG_MISC_START) << std::endl;
    std::cout << "MISC END  :" << read32_dpu_reg(xcl_handle,  0+ DPUREG_MISC_END) << std::endl;
    throw std::runtime_error("Error: CU timeout " + std::to_string(handle_->get_device_info().cu_index));
  }
};
  // program DPU request
  if(!debug_mode_) { //=== run release instructions
    if(dump_mode_ ) { // dump input
      int tensor_idx = 0;
      for(auto& out: dbg_layers_[0].inputs) {
        auto offset = out.first;
        auto size = out.second;
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < io_bufs.size(); i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, io_addrs[i] + offset))
            throw std::runtime_error("Error: dump failed!");
          std::stringstream ss;
          ss << dump_folder_ << "/INPUT_"
             << "_E" << i << "_" << std::to_string(tensor_idx);
          std::ofstream ofs(ss.str(), std::ofstream::binary);
          ofs.write(data.get(), size);
          ofs.close();
        }
        tensor_idx++;
      }
    }

    trigger_dpu_func();

    if(dump_mode_ ) {  // dump final output
      int tensor_idx = 0;
      for(auto& out: dbg_layers_[0].outputs) {
        auto offset = out.first;
        auto size = out.second;
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < io_bufs.size(); i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, io_addrs[i] + offset))
            throw std::runtime_error("Error: dump failed!");
          std::stringstream ss;
          ss << dump_folder_ << "/OUTPUT_"
             << "_E" << i << "_" << std::to_string(tensor_idx);
          std::ofstream ofs(ss.str(), std::ofstream::binary);
          ofs.write(data.get(), size);
          ofs.close();
        }
        tensor_idx++;
      }
    }
  } else {//=== run debug instructions
    // dump first layer's inputs
    if(dump_mode_ && (dbg_layers_.size() > 0)) {
      auto& inputs = dbg_layers_[0].inputs;
      int tensor_idx = 0;
      for(auto& input: inputs) {
        auto offset = input.first;
        auto size = input.second;
        auto data = std::make_unique<char[]>(size);
        for (unsigned i=0; i < io_bufs.size(); i++) {
          if (xclUnmgdPread(xcl_handle, 0, data.get(), size, io_addrs[i] + offset))
            throw std::runtime_error("Error: dump failed!");
          std::stringstream ss;
          ss << dump_folder_ << "/0000_E" << i << "_" << tensor_idx << "INPUT";
          std::ofstream ofs(ss.str(), std::ofstream::binary);
          ofs.write(data.get(), size);
          ofs.close();
        }
        tensor_idx++;
      }
    }

    int layer_idx = 0;
    for(auto& layer: dbg_layers_) {
      if(layer.code_addr.second > 0) {
        code_addr_ = layer.code_addr.first;
        trigger_dpu_func();

        // Save the outputs to file
        if(dump_mode_) {
          int tensor_idx = 0;
          for(auto& out: layer.outputs) {
            auto offset = out.first;
            auto size = out.second;
            auto data = std::make_unique<char[]>(size);
            for (unsigned i=0; i < io_bufs.size(); i++) {
              if (xclUnmgdPread(xcl_handle, 0, data.get(), size, io_addrs[i] + offset))
                throw std::runtime_error("Error: dump failed!");
              std::stringstream ss;
              ss << dump_folder_ << "/" << setw(4) << setfill('0') << layer_idx
                 << "_E" << i << "_" << std::to_string(tensor_idx) << std::regex_replace(layer.name, std::regex("/"), "_");
              std::ofstream ofs(ss.str(), std::ofstream::binary);
              ofs.write(data.get(), size);
              ofs.close();
            }
            tensor_idx++;
          }
        }
        layer_idx ++;
      }
    }
  }

  // download results into output TensorBuffers
  const auto outSize = get_output_tensors()[0]->get_element_num();
  for (unsigned i=0; i < io_bufs.size(); i++)
  {
    // instead of downloading all {output, input, intermediate},
    // just download output region
    // io_bufs[i]->download();
    if (xclUnmgdPread(xcl_handle, 0, (void*)outputs[i]->data().first,
      outSize,
      io_addrs[i] + XDPU_IO_OUTPUT_OFFSET))
      throw std::runtime_error("Error: download failed");
  }

}
