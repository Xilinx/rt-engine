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

cd ../../.

# vart, xir & Unilog lib dir
PREFIX=${HOME}/.local/Ubuntu.18.04.x86_64

if [ -z $1 ];
then
	# setting default path
	XILINX_VART=$PREFIX.Release
else
    XILINX_VART=$1
fi

export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib:${XILINX_VART}/lib
export XILINX_XRT=/opt/xilinx/xrt

# Set below env corresponding to xclbin
export XLNX_VART_FIRMWARE=${PWD}/tests/dpuv3int8/models/commonImgLabelDir/dpdpuv3_wrapper.hw.xilinx_u250_xdma_201830_2.xclbin

if [[ -z "${XLNX_VART_FIRMWARE}" ]]; then
    export XLNX_VART_FIRMWARE=/usr/lib
fi

export DPUV3INT8_DEBUGMODE=0

#xmodel format
#single thread
build/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel -t tc -d tests/dpuv3int8/models/commonImgLabelDir/imageDir100 -n 100 -s 4 -g true

#multi thread
build/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel -t tcmt -d tests/dpuv3int8/models/commonImgLabelDir/imageDir100 -n 100 -s 4 -g true

