echo -e "______________________ Building Rocm-Thunk-Interface(ROCT) ________________________"
echo -e ""

SOURCE_DIR=${ROCT_HOME}

if [ -d ${ROCT_BUILD} ]; then
        rm -rf ${ROCT_BUILD}
        mkdir -p ${ROCT_BUILD}
        cd ${ROCT_BUILD}
else
        mkdir -p ${ROCT_BUILD}
        cd ${ROCT_BUILD}
fi

set -x

cmake -G "Unix Makefiles" \
				-DCMAKE_C_COMPILER="gcc" \
				-DCMAKE_CXX_COMPILER="g++" \
				-DCMAKE_BUILD_TYPE="Debug" \
				-DCMAKE_INSTALL_PREFIX=${INSTALL_HOME} \
				-DBUILD_SHARED_LIBS="ON" \
				$SOURCE_DIR

make -j4 

make -j4 install

cd ${WORK_DIR}/scripts
