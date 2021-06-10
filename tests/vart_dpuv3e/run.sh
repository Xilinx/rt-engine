#!/bin/bash

# Copyright 2021 Xilinx Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ $# != 2 ]; then
    echo "USAGE: $0 core_batch thread_num"
    exit 1;
fi
core_batch="$1"
thread_num="$2"

PREFIX=${HOME}/.local/Ubuntu.18.04.x86_64
XILINX_VART=$PREFIX.Release

export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:build:/opt/xilinx/xrt/lib:${XILINX_VART}/lib
export XILINX_XRT=/opt/xilinx/xrt

export XLNX_VART_FIRMWARE=./tests/vart_dpuv3e/V3E.2020Dec10Thu1652.300M..SLR0=4ENGINESLR1=5ENGINESLR2=5ENGINE.xilinx_u280_xdma_201920_3.xclbin

if [[ -z "${XLNX_VART_FIRMWARE}" ]]; then
    export XLNX_VART_FIRMWARE=/usr/lib
fi

export RTE_XRM_DONT_SHARE_CU=1
export XLNX_ENABLE_DEBUG_MODE=0
export XLNX_ENABLE_DUMP=0
#export RTE_ACQUIRE_DEVICE_UNMANAGED=1
${XILINX_VART}/bin/vart_dpuv3e.exe ./tests/vart_dpuv3e/resnet50.xmodel ${core_batch} ${thread_num}
