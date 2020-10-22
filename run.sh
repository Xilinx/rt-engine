export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib:${XILINX_VART}/lib
export XILINX_XRT=/opt/xilinx/xrt

#Sample commands
#build/tests/engine.exe
build/tests/app.exe -r tests/app/models/sample_resnet50/meta.json

# vart, xir & Unilog lib dir
PREFIX=${HOME}/.local/Ubuntu.18.04.x86_64

if [ -z $1 ];
then
	# setting default path
	XILINX_VART=$PREFIX.Release
else
    XILINX_VART=$1
fi

# Set below env corresponding to xclbin
export XLNX_VART_FIRMWARE=/opt/xilinx/overlaybins/xdnnv3
if [[ -z "${XLNX_VART_FIRMWARE}" ]]; then
    export XLNX_VART_FIRMWARE=/usr/lib
fi

#vart integrated
build/tests/app.exe -r tests/app/models/sample_resnet50/sampleres50.xmodel

