
(./build_roct.sh)
(./build_llvm.sh asan)
(./build_devicelib.sh)
(./build_rocr.sh)

(./build_comgr.sh)

(./build_rocminfo.sh)

## Build Flang Parser & Runtime
(./build_flang.sh && ./build_flang_runtime.sh)

## Build OpenCL runtime
(./build_opencl.sh)

## Build OpenMP runtime
(./build_openmp.sh asan)

## Build ROCclr runtime
#(./build_vdi.sh asan)

## Build HIP runtime
(./build_hipamd.sh)

