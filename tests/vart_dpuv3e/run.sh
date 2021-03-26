#!/bin/bash

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

