#include "dpu_controller.hpp"
#include "dpucloud_controller.hpp"
class DpuV3meController
//: public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer> {
: public DpuCloudController {
 public:
  DpuV3meController(std::string meta);
  DpuV3meController(const xir::Subgraph *subgraph);
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
