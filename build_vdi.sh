echo -e "____________________________ Building VDI Runtime(ROCclr) ____________________________"
echo -e ""

SOURCE_DIR=${VDI_HOME}
OPENCL_DIR=${OPENCL_HOME}
HIP_DIR=${HIP_HOME}

SANITIZE_FLAGS="-fsanitize=address -shared-libasan"

if [ -d ${VDI_BUILD} ]; then
        rm -rf ${VDI_BUILD}
        mkdir -p ${VDI_BUILD}
        cd ${VDI_BUILD}
else
        mkdir -p ${VDI_BUILD}
        cd ${VDI_BUILD}
fi


set -x

cmake -G "Unix Makefiles" \
				-DCMAKE_C_COMPILER="clang" \
				-DCMAKE_CXX_COMPILER="clang++" \
        -DCMAKE_C_COMPILER="clang" \
				-DCMAKE_C_FLAGS="$SANITIZE_FLAGS" \
				-DCMAKE_CXX_FLAGS="$SANITIZE_FLAGS" \
				-DUSE_COMGR_LIBRARY="ON" \
				-DROCM_DEP_ROCMCORE="ON" \
				-DCMAKE_BUILD_TYPE="Debug" \
				-DCMAKE_PREFIX_PATH="${COMGR_BUILD};${LLVM_BUILD}" \
				-DCMAKE_INCLUDE_PATH="${COMGR_BUILD}/include" \
				$SOURCE_DIR

make -j8 
make -j8 install

cd ${WORK_DIR}/scripts
