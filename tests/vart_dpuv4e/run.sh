
export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt
export RTE_ACQUIRE_DEVICE_UNMANAGED=1
cd ../../../
./build/tests/vart_dpuv4e.exe  tests/app/models/v4e_resnet50/dpu.xmodel tests/dpuv4e/models/v4e_resnet50/meta.json tests/dpuv3int8/models/commonImgLabelDir/imageDir/
cd -
