#ifndef PL_CONTORLLER_SW_XRT_HPP
#define PL_CONTORLLER_SW_XRT_HPP
#include <experimental/xrt_kernel.h>
#include <cstring>
#include <unordered_map>

namespace pl_controller {
class pl_controller_sw_xrt {
   private:
    xrt::device device;
    // xrt::uuid uuid;
    xrt::kernel pl_ctrl_krnl;
    xrt::bo ucode_bo;
    xrt::bo runtime_addr_bo;
    uint32_t* ucode_bo_mapped;
    uint32_t* runtime_addr_bo_mapped;

    uint32_t ucode_size;
    uint32_t ucode_offset;
    uint32_t runtime_addr_size;

    std::unordered_map<std::string, int> ext_map;

    uint32_t pre_ucode_size;
    uint32_t* pre_ucode_buff;
    uint32_t core_control_size;
    uint32_t* core_control_buff;
    uint32_t core_iter_size;
    uint32_t* core_iter_buff;

    // get the size of ucode and runtime address
    int getSize(const std::string& ucodeFile, size_t& u_size, size_t& rt_size);

   public:
    // Open device
    // load xclbin
    // obtain object from xclbin
    pl_controller_sw_xrt(xrt::device device, const char* xclbinFilename);
    pl_controller_sw_xrt(xrt::device device, const xrt::uuid& uuid);
    pl_controller_sw_xrt(xrt::device device, const xrt::uuid& uuid, const std::string& ucodeFile);

    ~pl_controller_sw_xrt();

    int enqueueGraphRun(uint32_t iter);
    int enqueueRuntimeControl();
    int enqueueGraphEnd();

    int getGroupId();
    // allcoate buffer for uncode
    // allocate buffer for runtime address
    // load ucode to ucode buffer
    int loadMicroCode(const std::string& ucodeFile);

    // set runtime address
    int setAddress(uint32_t id, uint64_t addr);
    int setAddress(std::string name, uint64_t addr);

    // transfer data
    // start kernel
    int run(uint64_t aieBase);

    // if timeout = 0, disable timeout
    // if timeout, return -1, otherwise return 0
    int wait(uint32_t timeout);
};
}
#endif
