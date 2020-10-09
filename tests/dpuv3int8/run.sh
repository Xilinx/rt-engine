echo "Please move this run.sh script to rt-engine home directory"
echo "Please update runner/src/dpu_runner.cpp to create Dpuv3Int8Controller"

export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt

export DPUV3INT8_DEBUGMODE=0
#single thread
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_resnet50/meta.json -t tc -d tests/dpuv3int8/models/commonImgLabelDir/imageDir100 -n 100 -s 4 -g true

#multi thread
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_resnet50/meta.json -t tcmt -d tests/dpuv3int8/models/commonImgLabelDir/imageDir100 -n 100 -s 4 -g true
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_resnet50/meta.json -t tcmt -d tests/dpuv3int8/models/commonImgLabelDir/imageDir10000 -n 10000 -s 4 -g true

#xmodel format
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_xir/meta.json -t tc -d tests/dpuv3int8/models/commonImgLabelDir/imageDir/ -n 4 -s 4 -v

export DPUV3INT8_DEBUGMODE=1
#xmodel format
build/tests/dpuv3int8.exe -r tests/dpuv3int8/models/dpuv3int8_debugTestCases/xirdebugCase/meta.json -t tc -p

