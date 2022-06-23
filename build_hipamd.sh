#!/bin/bash
source common.sh
echo -e "______________________________ Building HIP-AMD Runtime ____________________________________"
echo -e ""

SOURCE_DIR=${HIPAMD_HOME}
HIP_DIR=${HIP_HOME}
OPENCL_DIR=${OPENCL_HOME}
ROCCLR_DIR=${VDI_HOME}

#SANITIZE_FLAGS="-fsanitize=address -shared-libasan"

if [ -d ${HIPAMD_BUILD} ]; then
        rm -rf ${HIPAMD_BUILD}
        mkdir -p ${HIPAMD_BUILD}
        cd ${HIPAMD_BUILD}
else
        mkdir -p ${HIPAMD_BUILD}
        cd ${HIPAMD_BUILD}
fi

### Please set the CMAKE_INSTALL_PREFIX=INSTALL_HOME/hipamd so that it does not messes header files in INSTALL_HOME/include
set -x
cmake -G "Unix Makefiles" \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_FLAGS="-O0 ${SANITIZE_FLAGS}" \
	-DCMAKE_CXX_FLAGS="-O0 ${SANITIZE_FLAGS}" \
	-DHIP_COMPILER=clang \
	-DHIP_PLATFORM=amd \
	-DHIP_COMMON_DIR=${HIP_DIR} \
	-DAMD_OPENCL_PATH=${OPENCL_DIR} \
	-DROCCLR_PATH=${ROCCLR_DIR} \
	-DBUILD_SHARED_LIBS="ON" \
	-DCMAKE_BUILD_TYPE="Debug" \
	-DCMAKE_PREFIX_PATH="$ROCM_PATH" \
	-DCMAKE_INCLUDE_PATH="$ROCM_PATH" \
	-DCMAKE_INSTALL_PREFIX="${ROCM_PATH}" \
	${SOURCE_DIR}

make -j32

make -j32 install

cd ${WORK_DIR}/scripts
