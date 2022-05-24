#!/bin/bash

trap handler_checkCMDStatus SIGHUP SIGINT SIGABRT 

function handler_checkCMDStatus(){
if [ "$?" != 0 ];then
echo -e "Exit with a negative code!!!"
exit $?
fi
return $?
}
