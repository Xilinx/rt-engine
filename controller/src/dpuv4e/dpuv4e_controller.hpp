#include "dpu_controller.hpp"

class DpuV4eController : public XclDpuController<XrtDeviceHandle, XrtDeviceBuffer> {
 public:
  DpuV4eController(std::string meta);
  virtual ~DpuV4eController() override;
  virtual void run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
      const std::vector<xir::vart::TensorBuffer*> &outputs) override;
};
