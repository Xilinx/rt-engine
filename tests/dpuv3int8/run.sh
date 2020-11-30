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
export XLNX_VART_FIRMWARE=tests/dpuv3int8/models/commonImgLabelDir

if [[ -z "${XLNX_VART_FIRMWARE}" ]]; then
    export XLNX_VART_FIRMWARE=/usr/lib
fi

export DPUV3INT8_DEBUGMODE=0

#xmodel format
#single thread
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel -t tc -d tests/dpuv3int8/models/commonImgLabelDir/imageDir100 -n 100 -s 4 -g true

#multi thread
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel -t tcmt -d tests/dpuv3int8/models/commonImgLabelDir/imageDir100 -n 100 -s 4 -g true

