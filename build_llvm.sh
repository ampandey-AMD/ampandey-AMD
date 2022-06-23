#!/bin/bash

source common.sh

echo -e "____________________________________________ Building LLVM Compiler with compiler-rt runtime _______________________________________________"
echo -e ""

SOURCE_DIR=${LLVM_HOME}/llvm

if [ -d ${LLVM_BUILD} ]; then
				rm -rf ${LLVM_BUILD}
				mkdir -p ${LLVM_BUILD}
				cd ${LLVM_BUILD}
else
				mkdir -p ${LLVM_BUILD}
				cd ${LLVM_BUILD}
fi

CMAKE_OPTIONS=(
		-DLLVM_BUILD_TOOLS=ON 
		-DCMAKE_C_COMPILER=gcc 
		-DCMAKE_CXX_COMPILER=g++ 
		-DCMAKE_BUILD_TYPE=Release
		-DCOMPLER_RT_DEBUG=OFF
		-DLLVM_ENABLE_ASSERTIONS=ON
		-DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;lld;compiler-rt'
		-DLLVM_ENABLE_RTTI=ON
		-DLLVM_INSTALL_UTILS=ON
		-DLLVM_TARGETS_TO_BUILD="X86;AMDGPU"
		-DCMAKE_SHARED_LINKER_FLAGS='-Wl,--disable-new-dtags'
		-DCLANG_DEFAULT_LINKER=lld
		-DLLVM_PARALLEL_LINK_JOBS=2
		-DCMAKE_PREFIX_PATH=${ROCM_PATH}
		-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME}
)

if [ ! -z "$1" ] && [ "$1" == "asan" ]; then
				CMAKE_OPTIONS+=("-DSANITIZER_AMDGPU=1")
				CMAKE_OPTIONS+=("-DHSA_INCLUDE_PATH=${ROCR_HOME}/opensrc/hsa-runtime/inc")
        CMAKE_OPTIONS+=("-DCOMGR_INCLUDE_PATH=${COMGR_HOME}/lib/comgr/include")
fi

(set -x;cmake -G "Unix Makefiles" ${CMAKE_OPTIONS[@]} ${SOURCE_DIR}; make -j4; make -j4 install)

#make check-clang
#make check-llvm

cd $WORK_DIR/scripts
