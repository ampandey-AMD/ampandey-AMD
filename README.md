### **ORDER TO BUILD THE TOOLCHAIN** ###

./build_roct.sh

./build_llvm.sh

./build_devicelibs.sh

./build_rocr.sh

### **COMGR IS DEPENDENT ON LLVM AND DEVICE LIBS** ###

./build_comgr.sh  

### **FLANG PARSER && RUNTIME** ###

./build_flang.sh
./build_flang_runtime.sh

### **OPENCL RUNTIME** ###

./build_opencl.sh

### **OPENMP RUNTIME** ###

./build_openmp.sh

### **HIPAMD RUNTIME** ###

./build_vdi.sh

#### ***NOTE build_hipamd.sh builds for both VDI && HIP*** ####

./build_hipamd.sh
