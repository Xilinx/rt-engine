export XILINX_XRT=/opt/xilinx/xrt

export LD_LIBRARY_PATH=$XILINX_XRT/lib:$CONDA_PREFIX/lib:build

export XLNX_VART_FIRMWARE=/opt/xilinx/overlaybins/dpuv3int8/dpu.xclbin

export XMODEL=tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel

./build/tests/vart_samples.exe $XMODEL
