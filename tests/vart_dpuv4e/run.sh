# vart, xir & Unilog lib dir

PREFIX=${HOME}/.local/RedHatEnterpriseWorkstation.7.4.x86_64

if [ -z $1 ];
then
	# setting default path
	XILINX_VART=$PREFIX.Release
else
    XILINX_VART=$1
fi

export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib:${XILINX_VART}/lib
export XILINX_XRT=/opt/xilinx/xrt

export XLNX_VART_FIRMWARE=tests/vart_dpuv4e/v4e_8pe_300MHz_xilinx_vck5000-es1_gen3x16_1_202010_1_a29ff10_Sep16Wed1614.xclbin

if [[ -z "${XLNX_VART_FIRMWARE}" ]]; then
    export XLNX_VART_FIRMWARE=/usr/lib
fi


export RTE_ACQUIRE_DEVICE_UNMANAGED=1
./build/tests/vart_dpuv4e.exe  tests/app/models/v4e_resnet50/dpu.xmodel tests/dpuv4e/models/v4e_resnet50/meta.json tests/dpuv3int8/models/commonImgLabelDir/imageDir/
