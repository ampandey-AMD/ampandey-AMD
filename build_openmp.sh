#!/bin/bash
source common.sh

echo -e "________________________ Building OpenMP Runtime ______________________"
echo -e ""

SOURCE_DIR=${LLVM_HOME}/openmp

if [ -d ${OPENMP_BUILD} ]; then
				rm -rf ${OPENMP_BUILD}
				mkdir -p ${OPENMP_BUILD}	
				cd ${OPENMP_BUILD}
else
				mkdir -p ${OPENMP_BUILD}
				cd ${OPENMP_BUILD}
fi

CMAKE_OPTIONS=(
				-DCMAKE_C_COMPILER="gcc"
				-DCMAKE_CXX_COMPILER="g++"
				-DCMAKE_C_FLAGS="-O0"
				-DCMAKE_CXX_FLAGS="-O0"
				-DOPENMP_ENABLE_LIBOMPTARGET=1
				-DDEVICELIBS_ROOT=${DLIB_HOME}
				-DLIBOMPTARGET_AMDGCN_GFXLIST="gfx700;gfx701;gfx801;gfx803;gfx900;gfx902;gfx90a;gfx908;gfx906;gfx1030;gfx1031"
				-DLIBOMPTARGET_ENABLE_DEBUG="ON"
				-DLLVM_DIR=${LLVM_BUILD}
				-DLIBOMPTARGET_INCLUDE_DIR="${LLVM_BUILD}/llvm/include"
				-DLIBOMPTARGET_LLVM_INCLUDE_DIRS="${LLVM_HOME}/llvm/include"
				-DCMAKE_BUILD_TYPE="Debug"
				-DCMAKE_PREFIX_PATH="/home/ampandey/grpc-home/grpc-install;${ROCM_PATH}"
				-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME}
)

if [ ! -z "$1" ] && [ "$1" == "asan" ]; then
        CMAKE_OPTIONS+=("-DSANITIZER_AMDGPU=1")
fi

set -x
cmake -G "Unix Makefiles" ${CMAKE_OPTIONS[@]} ${SOURCE_DIR}

make -j16
make -j16 install

#make check-openmp

cd $WORK_DIR/scripts
