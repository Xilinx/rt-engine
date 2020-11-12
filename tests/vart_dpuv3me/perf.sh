ROOT=$(cd $(dirname $0); cd ../../; pwd)

export LD_LIBRARY_PATH=/usr/local/lib64:$(pwd)/build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib:${LD_LIBRARY_PATH}
export XILINX_XRT=/opt/xilinx/xrt
export RTE_ACQUIRE_DEVICE_UNMANAGED=1
export XLNX_VART_FIRMWARE=${ROOT}/tests/app/models/v3me_ssd_mobilenet/333.xclbin

export CTRLER_RUN=0 && export DEEPHI_PROFILING=0 && export XCLEXECBUF=0 && export DPU_IP_COUNTER=0
${ROOT}/build/tests/vart_dpuv3me.exe \
 ${ROOT}/tests/app/models/v3me_ssd_mobilenet/dpu.xmodel \
 ${ROOT}/tests/app/models/v3me_ssd_mobilenet/meta.json \
 ${ROOT}/tests/dpuv3int8/models/commonImgLabelDir/imageDir/ \
 &>/tmp/log
echo 'exec_async/wait API time:'
cat /tmp/log | grep QPS | awk '{print 1000000/$2 us}'

export CTRLER_RUN=1 && DEEPHI_PROFILING=0 && export XCLEXECBUF=0 && export DPU_IP_COUNTER=0
${ROOT}/build/tests/vart_dpuv3me.exe \
 ${ROOT}/tests/app/models/v3me_ssd_mobilenet/dpu.xmodel \
 ${ROOT}/tests/app/models/v3me_ssd_mobilenet/meta.json \
 ${ROOT}/tests/dpuv3int8/models/commonImgLabelDir/imageDir/ \
 &>/tmp/log
echo 'CONTROLLER::RUN'
cat /tmp/log | grep CTRLER_RUN | awk '{print $3}' | awk '{a+=$1}END{print a/NR us}'


export DEEPHI_PROFILING=1 && export XCLEXECBUF=1 && export DPU_IP_COUNTER=1
${ROOT}/build/tests/vart_dpuv3me.exe \
 ${ROOT}/tests/app/models/v3me_ssd_mobilenet/dpu.xmodel \
 ${ROOT}/tests/app/models/v3me_ssd_mobilenet/meta.json \
 ${ROOT}/tests/dpuv3int8/models/commonImgLabelDir/imageDir/ \
 &>/tmp/log
echo 'host to device:'
cat /tmp/log | grep INPUT_H2D | awk '{print $7}' | sed 's/us//g' | awk '{a+=$1}END{print a/NR us}'
echo 'device to host:'
cat /tmp/log | grep OUTPUT_D2H | awk '{print $7}' | sed 's/us//g' | awk '{a+=$1}END{print a/NR us}'
echo 'xclExecBuf/wait'
cat /tmp/log | grep xclExecBuf | awk '{print $3}' | awk '{a+=$1}END{print a/NR us}'
echo 'IP Counter'
cat /tmp/log | grep "IP COUNTER" | awk '{print $3}' | awk '{a+=$1}END{print a/NR us}'
