ROOT=$(cd $(dirname $0); cd ../../; pwd)

export LD_LIBRARY_PATH=/usr/local/lib64:$(pwd)/build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib:${LD_LIBRARY_PATH}
export XILINX_XRT=/opt/xilinx/xrt
export RTE_ACQUIRE_DEVICE_UNMANAGED=1
XLNX_VART_FIRMWARE=${ROOT}/tests/app/models/v3me_ssd_mobilenet/333.xclbin
${ROOT}/build/tests/vart_dpuv3me.exe  ${ROOT}/tests/app/models/v3me_ssd_mobilenet/dpu.xmodel ${ROOT}/tests/dpuv4e/models/v3me_ssd_mobilenet/meta.json ${ROOT}/tests/dpuv3int8/models/commonImgLabelDir/imageDir/
