#include "dpu_controller.hpp"
//#include "common/graph.hpp"
#include "dpucloud_controller.hpp"
class DpuV3eController 
: public DpuCloudController {
 public:
  DpuV3eController(std::string meta);
  DpuV3eController(const xir::Subgraph *subgraph);
  virtual ~DpuV3eController() override;
  virtual std::vector<unsigned> get_hbmw() override;
  virtual std::vector<unsigned> get_hbmc() override;
  virtual std::vector<unsigned> get_hbmio() override;
  //virtual void run(
  //  const std::vector<vart::TensorBuffer*> &inputs, 
  //  const std::vector<vart::TensorBuffer*> &outputs) override;
  // virtual std::vector<vart::TensorBuffer*> get_outputs(int batchsz=-1) override;
  // vector<std::tuple<int, int,uint64_t>>  get_dpu_reg_outside(xclDeviceHandle xcl_handle,  bool create_tb_batch, std::vector<uint64_t> &in_addrs, std::vector<uint64_t> &out_addrs, const std::vector<vart::TensorBuffer*> &inputs, const std::vector<vart::TensorBuffer*> &outputs) override;
 private:
  vector<unsigned> hbmw;
  vector<unsigned> hbmc;
  vector<unsigned> hbmio;
};

