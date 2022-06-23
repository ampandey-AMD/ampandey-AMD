echo -e "________________________________ Building COMGr ____________________________"
echo -e ""

SOURCE_DIR=$COMGR_HOME/lib/comgr

if [ -d ${COMGR_BUILD} ]; then
        rm -rf ${COMGR_BUILD}
        mkdir -p ${COMGR_BUILD}
        cd ${COMGR_BUILD}
else
        mkdir -p ${COMGR_BUILD}
        cd ${COMGR_BUILD}
fi

set -x 

cmake -G "Unix Makefiles" \
	-DCMAKE_C_COMPILER="gcc" \
	-DCMAKE_CXX_COMPILER="g++" \
	-DCMAKE_BUILD_TYPE="Debug" \
	-DCMAKE_PREFIX_PATH="$ROCM_PATH" \
	-DCMAKE_INSTALL_PREFIX="$INSTALL_HOME" \
	-DBUILD_SHARED_LIBS="ON" \
	$SOURCE_DIR

make -j8 

make -j8 install

cd $WORK_DIR/scripts
