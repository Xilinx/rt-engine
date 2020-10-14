
export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt
export RTE_ACQUIRE_DEVICE_UNMANAGED=1
cd ../../../
./build/tests/vart_dpuv3mee.exe  tests/vart_dpuv3me/models/v3me_ssd_mobilenet/dpu.xmodel tests/vart_dpuv3me/models/v3me_ssd_mobilenet/dpu.xmodel/meta.json tests/dpuv3int8/models/commonImgLabelDir/imageDir/
cd -
