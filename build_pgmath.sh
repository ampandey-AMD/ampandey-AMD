echo -e "________________________ Building PG Math Libraries  ______________________"
echo -e ""

SOURCE_DIR=${PGMATH_HOME}

if [ -d ${PGMATH_BUILD} ]; then
	rm -rf ${PGMATH_BUILD}
	mkdir -p ${PGMATH_BUILD}	
	cd ${PGMATH_BUILD}
else
	mkdir -p ${PGMATH_BUILD}
	cd ${PGMATH_BUILD}
fi

CMAKE_OPTIONS=(
-DCMAKE_BUILD_TYPE="Release"
-DLLVM_ENABLE_ASSERTIONS="ON"
-DCMAKE_SHARED_LINKER_FLAGS='-Wl,--disable-new-dtags'
-DCMAKE_INSTALL_RPATH_USE_LINK_PATH="ON"
-DLLVM_CONFIG=${ROCM_PATH}/bin/llvm-config
-DCMAKE_CXX_COMPILER=clang++
-DCMAKE_C_COMPILER=clang
-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME}
-DLLVM_TARGETS_TO_BUILD="AMDGPU;X86"
-DCMAKE_C_FLAGS=-I"$ROCM_PATH/clang/15.0.0/include"
-DCMAKE_CXX_FLAGS=-I"$ROCM_PATH/clang/15.0.0/include"
)

(set -x; cmake -G "Unix Makefiles" ${CMAKE_OPTIONS[@]} ${SOURCE_DIR}; make -j8; make -j8 install)

cd $WORK_DIR/scripts

