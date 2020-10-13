
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

export DPUV3INT8_DEBUGMODE=0
# dpuv3int8 - vart resnet50 sample
./build/tests/vart_dpuv3int8.exe tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel tests/dpuv3int8/models/dpuv3int8_xir/meta.json tests/dpuv3int8/models/commonImgLabelDir/imageDir/

#build/tests/engine.exe
