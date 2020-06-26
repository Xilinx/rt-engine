#include <iostream>
#include <ert.h>
#include "dpuv4e_controller.hpp"

#define BIT(nr) (1 << (nr))
#define DOMAIN xclBOKind(0)
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

DpuV4eController::DpuV4eController(std::string meta) 
  : XclDpuController<XrtDeviceHandle, XrtDeviceBuffer, XrtDeviceBuffer>(meta) {
}

DpuV4eController::~DpuV4eController() {
}

void DpuV4eController::run(const std::vector<xir::vart::TensorBuffer*> &inputs, 
    const std::vector<xir::vart::TensorBuffer*> &outputs) {
  std::cout << "DpuV4eController::run start" << std::endl;
  XrtDeviceBuffer *inbuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(inputs[0]));
  XrtDeviceBuffer *outbuf = dynamic_cast<XrtDeviceBuffer*>(get_device_buffer(outputs[0]));
  (void)inbuf; // TODO
  (void)outbuf; // TODO

  auto xcl_handle = handle_->get_dev_handle();
  auto bo_handle = xclAllocBO(xcl_handle, 4096, DOMAIN, XCL_BO_FLAGS_EXECBUF);
  auto bo_addr = xclMapBO(xcl_handle, bo_handle, true);
  auto ecmd = reinterpret_cast<ert_start_kernel_cmd*>(bo_addr);

#if 0
  ecmd->cu_mask = handle_->get_device_info().cu_mask;
  ecmd->stat_enabled = 1;

  ecmd->state = ERT_CMD_STATE_NEW;
  ecmd->opcode = ERT_START_CU;
  ecmd->data[XDPU_CONTROL_AP] = XDPU_CONTROL_AP_START;        // [0] APCTL=0,
  ecmd->data[XDPU_CONTROL_GIE / 4] = XDPU_GLOBAL_INT_ENABLE;  // [1] GIE =1
  ecmd->data[XDPU_CONTROL_IER / 4] = 1;                       // [2] IER = 1
  auto p = 4;
  ecmd->data[p++] = 0x0; // 10
  ecmd->data[p++] = 0x8; // 14
  ecmd->data[p++] = 0x0; // 18
  ecmd->data[p++] = 0x01; // 1C
  ecmd->data[p++] = 0x4040; // 20
  for (int i = 0; i < 56; ++i) {
    ecmd->data[p++] = 0x0;
  } // reached till 0x100
  ecmd->data[p++] = 0xc2; // 0x104
  ecmd->data[p++] = 0x0; // 0x108
  ecmd->data[p++] = 0xc0; // 0x10C
  ecmd->data[p++] = 0x7000; // 0x110
  ecmd->data[p++] = 0xc2; // 0x114
  ecmd->data[p++] = 0x40000000; // 0x118
  ecmd->data[p++] = 0xc2; // 0x11C
  for (int i = 0; i < 8; ++i) {
    ecmd->data[p++] = 0x0;
  } // reached till 0x13C

  ecmd->data[p++] = 0x80000000; // 0x140
  ecmd->data[p++] = 0xc2; // 0x144

  /*ecmd->data[p++] = BASE_ADDR + XDPU_CONTROL_START;
    ecmd->data[p++] = 0x00;
    ecmd->data[p++] = BASE_ADDR + XDPU_CONTROL_RESET;
    ecmd->data[p++] = 0x01;
    ecmd->data[p++] = BASE_ADDR + XDPU_CONTROL_HP;
    ecmd->data[p++] = 0x2020;*/
  //ecmd->data[p++] = BASE_ADDR + 0x144;
  //ecmd->data[p++] = 0x2020;
  ecmd->count = p + 1;

  //auto state = 0;
  //state = ecmd->state;

  auto exec_buf_result = xclExecBuf(xcl_handle, bo_handle);
  if (exec_buf_result)
    throw std::runtime_error("Error: xclExecBuf failed");
  auto wait_value = 0;
  int wait_count = 0;
  while (ecmd->state < 4 && wait_count < 5) {
    wait_value = xclExecWait(xcl_handle, 1000);
    if (wait_value)
      throw std::runtime_error("Error: xclExecWait failed");
    wait_count++;
  }

  //state = ecmd->state;
#endif
  std::cout << "DpuV4eController::run end" << std::endl;
}
