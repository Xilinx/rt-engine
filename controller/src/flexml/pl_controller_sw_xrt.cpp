#include "pl_controller_sw_xrt.hpp"
#include <fstream>
namespace pl_controller {
pl_controller_sw_xrt::pl_controller_sw_xrt(xrt::device m_device, const char* xclbinFilename) {
    //// Open device
    // unsigned int dev_index = 0;
    // device = xrt::device(dev_index); // device index=0
    device = m_device;
    // load xclbin
    auto uuid = device.load_xclbin(xclbinFilename);

    // obtain object from xclbin
    pl_ctrl_krnl = xrt::kernel(device, uuid, "pl_controller_hw_v4", true); // cu_access_mode::exclusive
}
pl_controller_sw_xrt::pl_controller_sw_xrt(xrt::device m_device, const xrt::uuid& uuid) {
    //// Open device
    // unsigned int dev_index = 0;
    // device = xrt::device(dev_index); // device index=0
    device = m_device;
    // obtain object from xclbin
    pl_ctrl_krnl = xrt::kernel(device, uuid, "pl_controller_hw_v4", true); // cu_access_mode::exclusive
}

pl_controller_sw_xrt::~pl_controller_sw_xrt() {}

int pl_controller_sw_xrt::loadMicroCode(const std::string& ucodeFile) {
    std::ifstream fin(ucodeFile, std::ios::binary);
    // first 2 32-bits storing the ucode size and runtime address id size
    fin.read((char*)&ucode_size, sizeof(uint32_t));
    fin.read((char*)&runtime_addr_size, sizeof(uint32_t));
    std::cout << "ucode_size=" << ucode_size << ", runtime_addr_size=" << runtime_addr_size << std::endl;
    // if(rt_size < 16 * sizeof(int))
    // runtime_addr_size = 16 * sizeof(uint32_t);
    // printf("u_size = %d, rt_size = %d\n", ucode_size, runtime_addr_size);
    // fin.close();
    // get ucode num and runtime address num
    // TBD
    // getSize(ucodeFile, ucode_size, runtime_addr_size);

    // allcoate buffer for uncode
    ucode_bo = xrt::bo(device, ucode_size, pl_ctrl_krnl.group_id(0));
    ucode_bo_mapped = ucode_bo.map<uint32_t*>();

    // allocate buffer for runtime address
    runtime_addr_bo = xrt::bo(device, runtime_addr_size, pl_ctrl_krnl.group_id(3));
    runtime_addr_bo_mapped = runtime_addr_bo.map<uint32_t*>();

    // std::ifstream fin(ucodeFile, std::ios::binary);
    // fin.seekg(8, fin.beg);
    uint32_t val = 0;
    for (uint32_t i = 0; i < ucode_size / sizeof(uint32_t); i++) {
        if (fin.read((char*)&val, sizeof(uint32_t))) {
            ucode_bo_mapped[i] = val;
            // std::cout << "ucode[" << i << "]: " << val << std::endl;
        } else {
            printf("UCODE number is not correct\n");
        }
    }
    uint32_t map_sz = 0;
    fin.read((char*)&map_sz, sizeof(int));
    runtime_addr_bo_mapped[0] = map_sz;
    std::cout << "external buffer size: " << map_sz << std::endl;
    for (int i = 0; i < map_sz; i++) {
        uint32_t str_sz;
        fin.read((char*)&str_sz, sizeof(int));
        char tmp[str_sz + 1];
        fin.read(tmp, str_sz);
        tmp[str_sz] = '\0';
        ext_map[tmp] = i;
        std::cout << "loadMicroCode: name=" << tmp << ", id=" << i << std::endl;
    }
    fin.close();
    return 0;
}

int pl_controller_sw_xrt::setAddress(std::string name, uint64_t addr) {
    try {
        int id = ext_map.at(name);
        uint64_t tmp = addr / 4;
        std::cout << "setAddress: name=" << name << ", id=" << id << ", addr=" << tmp << std::endl;
        runtime_addr_bo_mapped[id * 2 + 1] = tmp & 0xffffffff;
        runtime_addr_bo_mapped[id * 2 + 2] = (tmp >> 32) & 0xffffffff;
    } catch (const std::out_of_range& e) {
        std::cout << "[ERROR] cannot find " << name << " in pl_controller_sw::ext_map\n";
        exit(-1);
    }
    return 0;
}

int pl_controller_sw_xrt::setAddress(uint32_t id, uint64_t addr) {
    uint64_t tmp = addr / 4;
    runtime_addr_bo_mapped[id] = tmp;
    return 0;
}
// if timeout,return -1;
// else return 0;
int pl_controller_sw_xrt::wait(uint32_t timeout) {
    std::cout << "Waiting PL controller done....." << std::endl;
    while (true) {
        unsigned int status;
        status = pl_ctrl_krnl.read_register(0x0);
        if (status == 6 || status == 4) {
            break;
        }
        sleep(2);
    }
    std::cout << "PL controller done!" << std::endl;
    return 0;
}

int pl_controller_sw_xrt::run(uint64_t aieBase) {
    uint32_t high_addr = aieBase >> 32;
    uint32_t low_addr = aieBase;
    printf("high_addr = %d, low_addr = %d\n", high_addr, low_addr);

    uint32_t ucode_num = ucode_size / sizeof(uint32_t);
    printf("ucode_num = %d\n", ucode_num);
    // set argumentfor pl controller kernel
    printf("kernel start setting argument\n");
    uint64_t ucode_bo_addr = ucode_bo.address();
    pl_ctrl_krnl.write_register(0x10, ucode_bo_addr & 0xffffffff);
    pl_ctrl_krnl.write_register(0x14, (ucode_bo_addr >> 32) & 0xffffffff);
    pl_ctrl_krnl.write_register(0x1C, low_addr);
    pl_ctrl_krnl.write_register(0x20, high_addr);
    pl_ctrl_krnl.write_register(0x28, ucode_num);
    uint64_t runtime_addr_bo_addr = runtime_addr_bo.address();
    pl_ctrl_krnl.write_register(0x30, runtime_addr_bo_addr & 0xffffffff);
    pl_ctrl_krnl.write_register(0x34, (runtime_addr_bo_addr >> 32) & 0xffffffff);

    printf("kernel set argument done\n");
    // sync bo
    ucode_bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, ucode_size, /*OFFSET=*/0);
    runtime_addr_bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, runtime_addr_size, /*OFFSET=*/0);
    printf("bo sync to device done\n");

    // start pl controller kernel
    pl_ctrl_krnl.write_register(0x0, 0x1);
    printf("kernel started\n");
    return 0;
}
// get the size of ucode and runtime address
int pl_controller_sw_xrt::getSize(const std::string& ucodeFile, size_t& u_size, size_t& rt_size) {
    std::ifstream fin(ucodeFile, std::ios::binary);
    // first 2 32-bits storing the ucode size and runtime address id size
    fin.read((char*)&u_size, sizeof(int));
    fin.read((char*)&rt_size, sizeof(int));
    // if(rt_size < 16 * sizeof(int))
    rt_size = 16 * sizeof(int);
    // printf("u_size = %d, rt_size = %d\n", u_size, rt_size);
    fin.close();
    return 0;
}
} // end of namespace
