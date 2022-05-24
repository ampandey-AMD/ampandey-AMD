#!/bin/bash
source  "./common.sh"

echo -e "________________________ Building Flang Compiler && Flang Runtime  ______________________"
echo -e ""

#---------------------------------------------------------------------------------------------------------------------#
## Build the Flang Compiler
echo -e "Started building Flang Compiler...."
SOURCE_DIR=${FLANG_HOME}

if [ -d ${FLANG_BUILD} ]; then
				rm -rf ${FLANG_BUILD}
				mkdir -p ${FLANG_BUILD}	
				cd ${FLANG_BUILD}
else
				mkdir -p ${FLANG_BUILD}
				cd ${FLANG_BUILD}
fi

CMAKE_OPTIONS_COMPILER=(
				-DCMAKE_C_COMPILER="clang"
				-DCMAKE_CXX_COMPILER="clang++"
				-DCMAKE_C_FLAGS="-I$FLANG_HOME/runtime/libpgmath/lib/common"
				-DCMAKE_CXX_FLAGS="-I$FLANG_HOME/runtime/libpgmath/lib/common"
				-DLLVM_ENABLE_ASSERTIONS="ON"
				-DLLVM_CONFIG="$ROCM_PATH/bin/llvm-config"
				-DCMAKE_Fortran_COMPILER="gfortran"
				-DLLVM_TARGETS_TO_BUILD="AMDGPU;X86"
				-DFLANG_OPENMP_GPU_AMD="ON"
				-DFLANG_OPENMP_GPU_NVIDIA="ON"
				-DLLVM_INSTALL_TOOLCHAIN_ONLY="ON"
				-DFLANG_INCLUDE_TESTS="OFF"
				-DCMAKE_BUILD_TYPE="Release"
				-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME}
)

(set -x; cmake -G "Unix Makefiles" ${CMAKE_OPTIONS_COMPILER[@]} ${SOURCE_DIR}; make -j8; make -j8 install)

echo -e "Flang Compiler Build Successfull!"
#---------------------------------------------------------------------------------------------------------------------#
