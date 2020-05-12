#include <fstream>
#include <sstream>
#include "dpu_controller.hpp"
#include "json-c/json.h"

DpuController::DpuController(std::string meta) {
  // load meta file
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     

  // get kernel name
  json_object *kernelObj = NULL;
  if (!json_object_object_get_ex(jobj, "kernel", &kernelObj))
    throw std::runtime_error("Error: missing 'kernel' field in meta.json");
  std::string kernelName = json_object_get_string(kernelObj);

  // get xclbin path and acquire handle
  json_object *xclbinObj = NULL;
  if (!json_object_object_get_ex(jobj, "xclbin", &xclbinObj))
    throw std::runtime_error("Error: missing 'xclbin' field in meta.json");
  std::string xclbinPath = json_object_get_string(xclbinObj);
  std::cout << "xclbin: " << xclbinPath << std::endl;
  handle_.acquire(kernelName, xclbinPath);
}

DpuController::~DpuController() {
}

void DpuController::run(void *in_ptr, void *out_ptr) {
  (void)in_ptr;
  (void)out_ptr;
}
