source ${HOME}/rocm-toolchain/staging/scripts/export_common_vars.sh

export AOMP_JOB_THREADS=4

function enableRuntimeDebugFlags(){
### OpenMP runtime flags
export LIBOMPTARGET_INFO=-1
export LIBOMPTARGET_DEBUG=1
export LIBOMPTARGET_KERNEL_TRACE=3
export LIBOMPTARGET_DEVICE_RTL_DEBUG=1
export LIBOMPDEVICE_DEBUG=1

### HSA FLAGS
#export HSAKMT_DEBUG_LEVEL=7
export HSA_ENABLE_SDMA=0
export HSA_ENABLE_INTERRUPT=0
export HSA_SVM_GUARD_PAGES=0
export HSA_DISABLE_CACHE=1
export HSA_LOADER_ENABLE_MMAP_URI=1

### COMGR FLAGS
export AMD_COMGR_EMIT_VERBOSE_LOGS=1
#export AMD_COMGR_SAVE_TEMPS=1

### HIP FLAGS
export AMD_LOG_LEVEL=5
export AMD_OCL_WAIT_COMMAND=1
export HIPCC_VERBOSE=7
}

export ROCM_PATH=$INSTALL_HOME
export HSA_PATH=${ROCM_PATH}/hsa
export HIP_ROCCLR_HOME=${VDI_BUILD}
export HIP_CLANG_PATH=${ROCM_PATH}/bin
export HIP_CLANG_INCLUDE_PATH=${ROCM_PATH}/include
export HIP_INCLUDE_PATH=${ROCM_PATH}/include
export HIP_LIB_PATH=${ROCM_PATH}/lib
export DEVICE_LIB_PATH=${ROCM_PATH}/amdgcn/bitcode
export HIPCC_COMPILE_FLAGS_APPEND='-g'

#### This Flag is required for the lit test cases to run successfully for customized rocm path(i.e other than /opt/rocm) installation. ####
export ASAN_TEST_ROCM=$ROCM_PATH/../llvm
################################################################################################################

export ASAN_OPTIONS="help=0:verbosity=0:symbolize=1:detect_leaks=0" #;allocator_may_return_null=1
#export ROCM_LINK_ARGS=$ROCM_PATH/amdgcn/bitcode/asanrtl.bc;$ROCM_PATH/amdgcn/bitcode/ockl.bc
#export LD_PRELOAD=/home/ampandey/rocm-toolchain/staging/rocm/lib/clang/15.0.0/lib/linux/libclang_rt.asan-x86_64.so

export PATH=$ROCM_PATH/bin:$ROCM_PATH/../build/llvm/bin:$PATH
export LD_LIBRARY_PATH=$ROCM_PATH/amdgcn/bitcode:$ROCM_PATH/lib/clang/15.0.0/lib/linux:$ROCM_PATH/lib:$LD_LIBRARY_PATH

export AOMP_GPU=gfx908
export AOMP=$ROCM_PATH
export AOMPROCM=$ROCM_PATH

if [ ! -z "$1" ] && [ "$1" == "debug" ]; then
enableRuntimeDebugFlags 
fi


