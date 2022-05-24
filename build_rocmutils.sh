echo -e "____________________________________________________________ Building ROCM Utilities ________________________________________________________________"
echo -e ""

###################################### BUILD ROCTRACER #####################################
echo -e "_________________ Building ROC-TRACER __________________"

if [ -d ${ROCTRACER_BUILD} ];then
	rm -rf ${ROCTRACER_BUILD}
	mkdir -p ${ROCTRACER_BUILD}
	cd ${ROCTRACER_BUILD}
else
	mkdir -p ${ROCTRACER_BUILD}
	cd ${ROCTRACER_BUILD}
fi

(set -x; $ROCTRACER_HOME/build.sh; make -j8 install)

###################################### BUILD ROCPROFILER #####################################
echo -e "_________________ Building ROC-PROFILER __________________"

if [ -d ${ROCPROFILER_BUILD} ];then
	rm -rf ${ROCPROFILER_BUILD}
	mkdir -p ${ROCPROFILER_BUILD}
	cd ${ROCPROFILER_BUILD}
else
	mkdir -p ${ROCPROFILER_BUILD}
	cd ${ROCPROFILER_BUILD}
fi

(set -x; cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${ROCM_PATH} ${ROCPROFILER_HOME}; make -j8; make -j8 install)

####################################### BUILD ROCMDBGAPI ####################################
echo -e "_________________ Building ROCM-DBG __________________"

if [ -d ${ROCMDBG_BUILD} ];then
	rm -rf ${ROCMDBG_BUILD}
	mkdir -p ${ROCMDBG_BUILD}
	cd ${ROCMDBG_BUILD}
else
	mkdir -p ${ROCMDBG_BUILD}
	cd ${ROCMDBG_BUILD}
fi

(set -x; cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${ROCM_PATH} ${ROCMDBG_HOME}; make -j8; make -j8 install)

######################################## BUILD ROCMGDB ######################################
echo -e "_________________ Building ROCM-GDB __________________"

if [ -d ${ROCMGDB_BUILD} ];then
	rm -rf ${ROCMGDB_BUILD}
	mkdir -p ${ROCMGDB_BUILD}
	cd ${ROCMGDB_BUILD}
else
	mkdir -p ${ROCMGDB_BUILD}
	cd ${ROCMGDB_BUILD}
fi

$ROCMGDB_HOME/configure --program-prefix=roc \
				--enable-64-bit-bfd --enable-targets="x86_64-linux-gnu,amdgcn-amd-amdhsa" \
				--disable-ld --disable-gas --disable-gdbserver --disable-sim --enable-tui \
				--disable-gdbtk --disable-shared --with-expat --with-system-zlib \
				--without-guile --with-babeltrace --with-lzma --with-python=python3 --with-rocm-dbgapi=${ROCM_PATH} --prefix=${INSTALL_HOME}

make -j8
#make -j8 install

cd $WORK_DIR/scripts
