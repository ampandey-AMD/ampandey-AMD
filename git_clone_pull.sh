#!/bin/bash
###################################################################################################################################
############################ Note: Please run the export_common_vars.sh first before running this one #############################
###################################################################################################################################

declare -A clone_list
declare -A dir_list

clone_list['llvm-project']="ssh://ampandey@gerrit-git.amd.com:29418/lightning/ec/llvm-project"
clone_list['device-libs']="ssh://ampandey@gerrit-git.amd.com:29418/lightning/ec/device-libs"
clone_list['comgr']="ssh://ampandey@gerrit-git.amd.com:29418/lightning/ec/support"
clone_list['opencl']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/opencl"
clone_list['hip']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/hip"
clone_list['hipamd']="ssh://ampandey@git.amd.com:29418/compute/ec/hipamd"
clone_list['vdi']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/vdi"
clone_list['rocr']="ssh://ampandey@gerrit-git.amd.com:29418/hsa/ec/hsa-runtime"
clone_list['roct']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/libhsakmt"
clone_list['rocminfo']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/rocminfo"
clone_list['rocm-gdb']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/rocm-gdb"
clone_list['rocr-debug-agent']="ssh://ampandey@gerrit-git.amd.com:29418/DevTools/ec/rocr_debug_agent"
clone_list['rocm-dbgapi']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/rocm-dbgapi"
clone_list['roctracer']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/roctracer"
clone_list['rocprofiler']="ssh://ampandey@gerrit-git.amd.com:29418/compute/ec/rocprofiler"
### Flang repo 
clone_list['flang']="https://github.com/ROCm-Developer-Tools/flang"

dir_list['llvm-project']="amd-stg-open"
dir_list['device-libs']="amd-stg-open"
dir_list['comgr']="amd-stg-open"
dir_list['opencl']="amd-staging"
dir_list['hip']="amd-staging"
dir_list['hipamd']="amd-staging"
dir_list['vdi']="amd-staging"
dir_list['rocr']="amd-staging"
dir_list['roct']="amd-staging"
dir_list['rocminfo']="amd-staging"
dir_list['rocm-gdb']="amd-staging"
dir_list['rocr-debug-agent']="amd-master"
dir_list['rocm-dbgapi']="amd-staging"
dir_list['roctracer']="amd-staging"
dir_list['rocprofiler']="amd-staging"
dir_list['flang']="master"

function check_Clone_OR_Pull(){
DIR_NAME="$1"
if [[ -d "$DIR_NAME" ]];then
				echo -e " Executing \"git pull\" in $DIR_NAME at branch \"${dir_list["$DIR_NAME"]}\"..."
				(set -x; cd ${DIR_NAME}; git pull; cd ..)
				echo -e ""
else
				echo -e " \"$DIR_NAME\" does not exists!"
				(set -x; git clone -b ${dir_list["$DIR_NAME"]} ${clone_list["$DIR_NAME"]} ${DIR_NAME})
				echo -e ""
fi
}

function run_Clone_OR_Pull(){					
### LLVM
#check_Clone_OR_Pull 'llvm-project'

### DEVICE LIBS
check_Clone_OR_Pull 'device-libs'

### COMPILER SUPPORT(COMGR)
check_Clone_OR_Pull 'comgr'

### OPENCL
check_Clone_OR_Pull 'opencl'

### HIP
check_Clone_OR_Pull 'hip'

### HIP-AMD
check_Clone_OR_Pull 'hipamd'

### VDI(ROCClr)
check_Clone_OR_Pull 'vdi'

### ROCR(HSA-RUNTIME)
check_Clone_OR_Pull 'rocr'

### ROCT
check_Clone_OR_Pull 'roct'

### ROCM_INFO
check_Clone_OR_Pull 'rocminfo'

### ROCM-GDB
check_Clone_OR_Pull 'rocm-gdb'

### ROCR-DEBUG-AGENT 
check_Clone_OR_Pull 'rocr-debug-agent'

### ROCM-DBGAPI
check_Clone_OR_Pull 'rocm-dbgapi'

### ROCM-PROFILER
check_Clone_OR_Pull 'rocprofiler'

### ROCM-TRACER
check_Clone_OR_Pull 'roctracer'

### FLANG
check_Clone_OR_Pull 'flang'
}

echo -e "Cloning all source codes into \"src-home\" directory!"

if [ -d "$SRC_HOME" ];then
	echo -e "${SRC_HOME} directory is present!"
	cd ${SRC_HOME}
else
	echo -e "Creating directory \"src-home\"!..."
	mkdir -p ${SRC_HOME}
	cd ${SRC_HOME}
fi

run_Clone_OR_Pull

cd ${WORK_DIR}/scripts
