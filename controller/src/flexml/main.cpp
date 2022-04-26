#include "pl_controller_sw_xrt.hpp"
#include <experimental/xrt_aie.h>
#include <fstream>
#include "multi_layer_tiny_yolov2.h"
#include "Work/ps/c_rts/aie_control_xrt.cpp"

int main(const int argc, char* argv[]) {
    char* xclbinFileName = argv[1];
    char* ucodeFile = argv[2];
    char* ifm_file = argv[3];
    char* wts_file = argv[4];
    char* ofm_file = argv[5];

    std::ifstream ifm_strm(ifm_file, std::ios::in);
    std::ifstream wts_strm(wts_file, std::ios::in);
    std::ifstream ofm_strm(ofm_file, std::ios::in);

    int nerr = 0;
    const int ifm_size = 8 * 64 * 8 * 52;
    const int wts_size = 78848;
    const int ofm_size = 8 * 32 * 16 * 28;

    const uint64_t aieBase = 0x20000000000;
    // open device
    unsigned int dev_index = 0;
    auto device = xrt::aie::device(dev_index);
    // create instance of pl_controller_sw_xrt
    auto uuid = device.load_xclbin(xclbinFileName);
    pl_controller::pl_controller_sw_xrt pl_ctrl_sw(device, uuid);

    // load ucode
    int rc = pl_ctrl_sw.loadMicroCode(ucodeFile);

    std::cout << "graph init...\n";
    auto ghdl = xrt::graph(device, uuid, "compute_graph");
    std::cout << "graph run...\n";
    ghdl.run(1);

    // FIXME use TinyYolo data
    auto ifm_bo = xrt::bo(device, ifm_size, 0);
    auto ifm_bo_map = ifm_bo.map<uint32_t*>();
    for (int i = 0; i < ifm_size / 4; i++) ifm_strm >> std::hex >> ifm_bo_map[i];
    pl_ctrl_sw.setAddress("compute_graph.ifm_ddr", ifm_bo.address());

    auto wts_bo = xrt::bo(device, wts_size, 0);
    auto wts_bo_map = wts_bo.map<uint32_t*>();
    for (int i = 0; i < wts_size / 4; i++) wts_strm >> std::hex >> wts_bo_map[i];
    pl_ctrl_sw.setAddress("compute_graph.wts_ddr", wts_bo.address());

    auto ofm_bo = xrt::bo(device, ofm_size, 0);
    auto ofm_bo_map = ofm_bo.map<uint32_t*>();
    pl_ctrl_sw.setAddress("compute_graph.ofm_ddr", ofm_bo.address());

    // data transfer to DDR
    ifm_bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, ifm_size, 0);
    wts_bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, wts_size, 0);

    // start pl controller kernel
    // which write
    rc = pl_ctrl_sw.run(aieBase);
    // wait done;
    rc = pl_ctrl_sw.wait(0);

    ghdl.wait();
    ghdl.end();
    std::cout << "Graph wait done" << std::endl;
    ofm_bo.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

    for (int i = 0; i < ofm_size / 4; i++) {
        uint32_t ofm32_ref_data;
        ofm_strm >> std::hex >> ofm32_ref_data;
        if ((uint32_t)ofm_bo_map[i] != ofm32_ref_data) {
            std::cout << "ofm_bo_map[" << i << "]=" << (uint32_t)ofm_bo_map[i] << ", " << ofm32_ref_data << std::endl;
            nerr++;
        }
    }
    std::cout << "check: nerr=" << nerr << std::endl;
    if (nerr)
        std::cout << "Test failed\n";
    else
        std::cout << "Test passed\n";
    return nerr;
}
