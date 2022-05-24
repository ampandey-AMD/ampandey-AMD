echo -e "____________________________ Building OpenCL Runtime ________________________________"
echo -e ""

SOURCE_DIR=${OPENCL_HOME}

if [ -d ${OPENCL_BUILD} ]; then
        rm -rf ${OPENCL_BUILD}
        mkdir -p ${OPENCL_BUILD}
        cd ${OPENCL_BUILD}
else
        mkdir -p ${OPENCL_BUILD}
        cd ${OPENCL_BUILD}
fi


cmake -G "Unix Makefiles" \
				-DCMAKE_C_COMPILER="gcc" \
				-DCMAKE_CXX_COMPILER="g++" \
				-DCMAKE_BUILD_TYPE="Debug" \
				-DCMAKE_PREFIX_PATH="${COMGR_BUILD};${VDI_BUILD}" \
				-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME} \
				$SOURCE_DIR


make -j32 
make -j32 install

cd $WORK_DIR/scripts

