echo -e "________________________________ Building COMGr ____________________________"
echo -e ""

SOURCE_DIR=${ROCRDBGAGENT_HOME}/src
export Debug_Agent_PREFIX_PATH="${ROCM_PATH}/hsa/include;${ROCM_PATH}/hsa/lib;${ROCM_PATH}/include;${ROCM_PATH}/lib;${ROCM_PATH}/bin"

if [ -d ${ROCRDBGAGENT_BUILD} ]; then
        rm -rf ${ROCRDBGAGENT_BUILD}
        mkdir -p ${ROCRDBGAGENT_BUILD}
        cd ${ROCRDBGAGENT_BUILD}
else
        mkdir -p ${ROCRDBGAGENT_BUILD}
        cd ${ROCRDBGAGENT_BUILD}
fi

set -x 

cmake -G "Unix Makefiles" \
	-DCMAKE_C_COMPILER="gcc" \
	-DCMAKE_CXX_COMPILER="g++" \
	-DCMAKE_BUILD_TYPE="Release" \
	-DCMAKE_PREFIX_PATH="$Debug_Agent_PREFIX_PATH" \
	-DCMAKE_INSTALL_PREFIX="$INSTALL_HOME" \
	$SOURCE_DIR

make -j8 

make -j8 install

cd $WORK_DIR/scripts
