/*
 * Copyright 2019 Xilinx Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <UniLog/ErrorCode.hpp>

REGISTER_ERROR_CODE(VART_XRT_DEVICE_AVAILABLE_ERROR, "No devices available", "");

REGISTER_ERROR_CODE(VART_XRT_CU_AVAILABLE_ERROR,
                    "No CU available", "");
REGISTER_ERROR_CODE(VART_XRT_OPEN_CONTEXT_ERROR, "xclOpenContext failed", "");
REGISTER_ERROR_CODE(VART_XRM_CREATE_CONTEXT_ERROR, "failed to create XRM context", "");
REGISTER_ERROR_CODE(VART_XRM_CONNECT_ERROR, "Failed to connect to XRM", "");
REGISTER_ERROR_CODE(VART_XRM_ACQUIRE_CU_ERROR, "Could not acquire CU", "");
REGISTER_ERROR_CODE(VART_DEVICE_BUFFER_ALLOC_ERROR, "Cannot alloc device buffer -- unknown datatype", "");
REGISTER_ERROR_CODE(VART_XCLBIN_READ_ERROR, "Failed to open xclbin file for reading", "");
REGISTER_ERROR_CODE(VART_XCLBIN_DOWNLOAD_ERROR, "Bitstream download failed !", "");
REGISTER_ERROR_CODE(VART_CONTROLLER_VIR_MEMORY_ALLOC_ERROR, "not enough virtual space on host", "");
REGISTER_ERROR_CODE(VART_VERSION_MISMATCH_ERROR, "subgraph's version is mismatch with xclbin", "");
REGISTER_ERROR_CODE(VART_CONTROLLER_DUMP_FOLDER_CREATE_ERROR, "Create dump folder error", "");
REGISTER_ERROR_CODE(VART_CONTROLLER_DUMP_SUBFOLDER_CREATE_ERROR, "Create sub dump folder error", "");
REGISTER_ERROR_CODE(VART_DEVICE_MEMORY_ALLOC_ERROR, "Device memory not enough, alloc fail", "");
REGISTER_ERROR_CODE(VART_TENSOR_BUFFER_CREATE_ERROR, "TensorBuffer create fail", "");
REGISTER_ERROR_CODE(VART_TENSOR_BUFFER_INVALID, "invalid tensorbuffer input or output", "");
REGISTER_ERROR_CODE(VART_DPU_EXEC_ERROR, "DPU run fail", "");
REGISTER_ERROR_CODE(VART_DPU_TIMEOUT_ERROR, "DPU timeout", "");
REGISTER_ERROR_CODE(VART_CONTROLLER_DUMP_ERROR, "dump failed", "");
REGISTER_ERROR_CODE(VART_XCLBIN_PATH_INVALID, "xclbinPath is not set, please consider setting XLNX_VART_FIRMWARE.", "");
REGISTER_ERROR_CODE(VART_GRAPH_FINGERPRINT_ERROR, "no hardware info in subgraph", "");
REGISTER_ERROR_CODE(VART_TENSOR_BUFFER_CHECK_ERROR, "TensorBuffer size less than offset, input shpe invalid", "");
REGISTER_ERROR_CODE(VART_TENSOR_BUFFER_DIMS_ERROR, "input dims shape is invalid", "");

