#---------------------------------------------------------------------------------------------------------------------#
## Build the Flang Runtime
echo -e "Started building Flang Runtime...."
export FC="$ROCM_PATH/bin/flang"
SOURCE_DIR=${FLANG_HOME}

if [ -d ${FLANGRT_BUILD} ]; then
        rm -rf ${FLANGRT_BUILD}
        mkdir -p ${FLANGRT_BUILD}
        cd ${FLANGRT_BUILD}
else
        mkdir -p ${FLANGRT_BUILD}
        cd ${FLANGRT_BUILD}
fi

cmake -G "Unix Makefiles" \
	-DCMAKE_C_COMPILER="clang" \
	-DCMAKE_CXX_COMPILER="clang++" \
	-DCMAKE_C_FLAGS="-I$FLANG_HOME/runtime/libpgmath/lib/common" \
	-DCMAKE_CXX_FLAGS="-I$FLANG_HOME/runtime/libpgmath/lib/common" \
	-DLLVM_ENABLE_ASSERTIONS="ON" \
	-DLLVM_DIR="$LLVM_BUILD" \
	-DLLVM_INSTALL_RUNTIME="ON" \
	-DLLVM_CONFIG="$ROCM_PATH/bin/llvm-config" \
	-DCMAKE_Fortran_COMPILER="flang" \
	-DCMAKE_TARGETS_TO_BUILD="AMDGPU;X86" \
	-DFLANG_BUILD_RUNTIME="ON" \
	-DOPENMP_BUILD_DIR="$OPENMP_BUILD/runtime/src" \
	-DFLANG_INCLUDE_TESTS="OFF" \
	-DCMAKE_PREFIX_PATH="$PGMATH_BUILD;$FLANG_BUILD;$LLVM_BUILD" \
	-DCMAKE_BUILD_TYPE="Release" \
	-DCMAKE_SHARED_LINKER_FLAGS='-Wl,--disable-new-dtags' \
	-DCMAKE_INSTALL_PREFIX="$INSTALL_HOME" \
	${SOURCE_DIR}


#(set -x; cmake -G "Unix Makefiles" ${CMAKE_OPTIONS_RT[@]} ${SOURCE_DIR})

make -j8

make -j8 install

echo -e "Flang Runtime Build Successfull!"
#---------------------------------------------------------------------------------------------------------------------#
