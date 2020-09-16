export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt

#Sample commands
#build/tests/engine.exe
build/tests/app.exe -r tests/app/models/sample_resnet50/meta.json
