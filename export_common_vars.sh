########################################################################################################
#### BUILD FIRST ROCT AND ROCR then BUILD LLVM DLIBS OPENMP VDI HIPAMD OPENCL #####
########################################################################################################

export WORK_DIR=${HOME}/rocm-toolchain/staging

export SRC_HOME=${WORK_DIR}/src-home
export BUILD_HOME=${WORK_DIR}/build
export INSTALL_HOME=${WORK_DIR}/rocm

########################################################################################################
### SOURCE-CODE HOME
########################################################################################################
export LLVM_HOME=${SRC_HOME}/llvm-project
export DLIB_HOME=${SRC_HOME}/device-libs
export ROCR_HOME=${SRC_HOME}/rocr
export ROCT_HOME=${SRC_HOME}/roct
export VDI_HOME=${SRC_HOME}/vdi
export HIP_HOME=${SRC_HOME}/hip
export HIPAMD_HOME=${SRC_HOME}/hipamd
export OPENCL_HOME=${SRC_HOME}/opencl
export OPENMP_HOME=${SRC_HOME}/llvm-project/openmp
export FLANG_HOME=${SRC_HOME}/flang
export FLANGRT_HOME=${SRC_HOME}/flang/runtime/flangrti
export PGMATH_HOME=${SRC_HOME}/flang/runtime/libpgmath
export COMGR_HOME=${SRC_HOME}/comgr
export ROCMINFO_HOME=${SRC_HOME}/rocminfo
export ROCMDBG_HOME=${SRC_HOME}/rocm-dbgapi
export ROCRDBGAGENT_HOME=${SRC_HOME}/rocr-dbg-agent
export ROCMGDB_HOME=${SRC_HOME}/rocm-gdb
export ROCTRACER_HOME=${SRC_HOME}/roctracer
export ROCPROFILER_HOME=${SRC_HOME}/rocprofiler
#########################################################################################################

#########################################################################################################
### BUILD HOME
#########################################################################################################
export LLVM_BUILD=${BUILD_HOME}/llvm
export DLIB_BUILD=${BUILD_HOME}/dlibs
export ROCR_BUILD=${BUILD_HOME}/rocr
export ROCT_BUILD=${BUILD_HOME}/roct
export VDI_BUILD=${BUILD_HOME}/vdi
export HIP_BUILD=${BUILD_HOME}/hip
export HIPAMD_BUILD=${BUILD_HOME}/hipamd
export OPENCL_BUILD=${BUILD_HOME}/opencl
export OPENMP_BUILD=${BUILD_HOME}/openmp
export COMGR_BUILD=${BUILD_HOME}/comgr
export FLANG_BUILD=${BUILD_HOME}/flang
export FLANGRT_BUILD=${BUILD_HOME}/flang_runtime
export PGMATH_BUILD=${BUILD_HOME}/pgmath
export ROCMINFO_BUILD=${BUILD_HOME}/rocminfo
export ROCMDBG_BUILD=${BUILD_HOME}/rocm-dbgapi
export ROCRDBGAGENT_BUILD=${BUILD_HOME}/rocr-dbg-agent
export ROCMGDB_BUILD=${BUILD_HOME}/rocm-gdb
export ROCTRACER_BUILD=${BUILD_HOME}/roctracer
export ROCPROFILER_BUILD=${BUILD_HOME}/rocprofiler
#########################################################################################################
