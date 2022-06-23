echo -e "_________________________ Building HIP Runtime on VDI(ROCClr) _______________________"
echo -e ""

SOURCE_DIR=${HIP_HOME}
ROCclr_DIR=${VDI_HOME}
HIP_DIR=${HIP_HOME}

if [ -d ${HIP_BUILD} ]; then
		rm -rf ${HIP_BUILD}
		mkdir -p ${HIP_BUILD}
		cd ${HIP_BUILD}
 else
    mkdir -p ${HIPAMD_BUILD}
    cd ${HIP_BUILD}
fi

set -x 

cmake -G "Unix Makefiles" \
	-DROCclr_DIR=${ROCclr_DIR} \
	-DCMAKE_C_FLAGS="-fsanitize=address -shared-libasan" \
	-DCMAKE_CXX_FLAGS="-fsanitize=address -shared-libasan" \
	-DHIP_COMPILER=clang \
	-DHIP_PLATFORM=rocclr \
	-DCMAKE_PREFIX_PATH="${VDI_BUILD};${COMGR_BUILD};${LLVM_BUILD}" \
	-DCMAKE_INSTALL_PREFIX=${HIP_INSTALL} \
	$SOURCE_DIR

make -j8

make -j8 install

cd $WORK_DIR/scripts
