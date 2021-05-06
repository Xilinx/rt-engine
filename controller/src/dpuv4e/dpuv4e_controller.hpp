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
 private:
  vector<unsigned> hbm;
};

