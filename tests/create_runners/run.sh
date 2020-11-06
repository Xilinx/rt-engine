# vart, xir & Unilog lib dir

export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib
export XILINX_XRT=/opt/xilinx/xrt

export XLNX_VART_FIRMWARE=tests/create_runners/dpu.xclbin

./build/tests/create_runners.exe  tests/app/models/v4e_yolov3voc/dpu.xmodel
