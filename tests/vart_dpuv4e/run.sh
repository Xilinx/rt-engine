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

# vart, xir & Unilog lib dir

PREFIX=${HOME}/.local/RedHatEnterpriseWorkstation.7.4.x86_64

if [ -z $1 ];
then
	# setting default path
	XILINX_VART=$PREFIX.Release
else
    XILINX_VART=$1
fi

export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib:${XILINX_VART}/lib
export XILINX_XRT=/opt/xilinx/xrt

export XLNX_VART_FIRMWARE=tests/vart_dpuv4e/v4e_8pe_300MHz_xilinx_vck5000-es1_gen3x16_1_202010_1_a29ff10_Sep16Wed1614.xclbin

if [[ -z "${XLNX_VART_FIRMWARE}" ]]; then
    export XLNX_VART_FIRMWARE=/usr/lib
fi


export RTE_ACQUIRE_DEVICE_UNMANAGED=1
./build/tests/vart_dpuv4e.exe  tests/app/models/v4e_yolov3voc/dpu.xmodel tests/dpuv4e/models/v4e_resnet50/meta.json tests/dpuv3int8/models/commonImgLabelDir/imageDir/
