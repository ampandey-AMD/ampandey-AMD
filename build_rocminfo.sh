echo -e "___________________________ Building Rocminfo __________________________"

SOURCE_DIR=$ROCMINFO_HOME

if [ -d ${ROCMINFO_BUILD} ]; then
        rm -rf ${ROCMINFO_BUILD}
        mkdir -p ${ROCMINFO_BUILD}
        cd ${ROCMINFO_BUILD}
else
        mkdir -p ${ROCMINFO_BUILD}
        cd ${ROCMINFO_BUILD}
fi

set -x 
cmake -G "Unix Makefiles" \
				-DCMAKE_C_COMPILER="gcc" \
				-DCMAKE_CXX_COMPILER="g++" \
				-DCMAKE_BUILD_TYPE="Release" \
				-DCMAKE_PREFIX_PATH="$ROCM_PATH" \
				-DCMAKE_INSTALL_PREFIX="$INSTALL_HOME" \
				$SOURCE_DIR

make -j8 
make -j8 install

cd $WORK_DIR/scripts
