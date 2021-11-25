// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#pragma once

#include "device_handle.hpp"
#include "xrt_bin_stream.hpp"
#include "vitis/ai/env_config.hpp"
#include <experimental/xrm_experimental.h>
#include <glog/logging.h>
#include <cstring>

#if __has_include(<filesystem>)
  #include <filesystem>
  namespace fs = std::filesystem;
#elif __has_include(<experimental/filesystem>)
  #include <experimental/filesystem>
  namespace fs = std::experimental::filesystem;
#else
  #error "Missing the <filesystem> header."
#endif

class XrmResource : public DeviceResource {
 public:
  XrmResource(std::string kernelName, std::string xclbin, xir::Attrs* attrs);
  ~XrmResource();
  int alloc_from_attrs(std::string kernelName, char* xclbinPath, xir::Attrs* attrs);
  int alloc_with_deviceId(std::string kernelName, char* xclbinPath, xir::Attrs* attrs);
  int alloc_without_deviceId(std::string kernelName, char* xclbinPath);
 private:
  void *context_;
  std::unique_ptr<xrmCuProperty> cu_prop_;
  std::unique_ptr<xrmCuResource> cu_rsrc_;
};
