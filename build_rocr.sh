echo -e  "_____________________________ Building HSA Runtime(ROCR) _____________________________"
echo -e ""

SOURCE_DIR=${ROCR_HOME}/opensrc/hsa-runtime

if [ -d ${ROCR_BUILD} ]; then
        rm -rf ${ROCR_BUILD}
        mkdir -p ${ROCR_BUILD}
        cd ${ROCR_BUILD}
else
        mkdir -p ${ROCR_BUILD}
        cd ${ROCR_BUILD}
fi

set -x

cmake -G "Unix Makefiles" \
	-DCMAKE_C_COMPILER="gcc" \
	-DCMAKE_CXX_COMPILER="g++" \
	-DCMAKE_PREFIX_PATH="${ROCM_PATH}" \
	-DCMAKE_INCLUDE_PATH=${ROCM_PATH}/include \
	-DCMAKE_LIBRARY_PATH=${ROCM_PATH}/lib \
	-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME} \
	-DCMAKE_BUILD_TYPE="Debug" \
	$SOURCE_DIR

make -j8
make -j8 install

cd ${WORK_DIR}/scripts
