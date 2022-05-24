echo -e "___________________________ Building Device Libs ____________________________"
echo -e ""

SOURCE_DIR=${DLIB_HOME}

if [ -d ${DLIB_BUILD} ]; then
				rm -rf ${DLIB_BUILD}
				mkdir -p ${DLIB_BUILD}
				cd ${DLIB_BUILD}
else
				mkdir -p ${DLIB_BUILD}
				cd ${DLIB_BUILD}
fi

set -x 
cmake -G "Unix Makefiles" \
				--trace-source=/home/ampandey/rocm-staging/rocm-device-libs/utils/prepare-builtins/CMakeLists.txt \
				-DCMAKE_C_COMPILER="gcc" \
				-DCMAKE_CXX_COMPILER="g++" \
				-DCMAKE_BUILD_TYPE="Debug" \
				-DCMAKE_PREFIX_PATH="$ROCM_PATH" \
				-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME} \
				${SOURCE_DIR}

make -j$(nproc)

make -j$(nproc) install

cd $WORK_DIR/scripts
