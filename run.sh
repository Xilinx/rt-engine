export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt

#Sample commands
#build/tests/engine.exe
build/tests/app.exe -r tests/app/models/sample_resnet50/meta.json

#dpuv3int8 command
#export DPUV3INT8_DEBUG_MODE=1
#build/tests/app.exe -r tests/app/models/dpuv3int8_resnet50/meta.json -t tc
