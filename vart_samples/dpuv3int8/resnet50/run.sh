
export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt

export DPUV3INT8_DEBUGMODE=0
cd ../../../
./vart_samples/dpuv3int8/resnet50/resnet50 tests/dpuv3int8/models/dpuv3int8_xir/resnet50_handwritten.xmodel tests/dpuv3int8/models/dpuv3int8_xir/meta.json tests/dpuv3int8/models/commonImgLabelDir/imageDir/
cd -
