#!/bin/bash

DEVICE=$(ls -1Ap /dev/cu.usbmodem* | head -1)
VALID_CMDS=(C c M D d B)

function print_help() {
    echo "Command codes:"
    echo -e "\tC\tActivate cat"
    echo -e "\tc\tDeactivate cat"
    echo -e "\tM\tMeow once"
    echo -e "\tD\tActivate dog"
    echo -e "\td\tDeactivate dog"
    echo -e "\tB\tBark once"
}

CMD=$1

if [[ ! " ${VALID_CMDS[@]} " =~ " ${CMD} " ]]; then
    print_help
    exit 1
fi

if [ -z $DEVICE ] ; then
    echo "Could not identify device"
    exit 1
fi

# stty -f /dev/cu.usbmodem1411 -hupcl
stty -f "${DEVICE}" ispeed 9600 ospeed 9600 -ignpar cs8 -cstopb -echo

echo "${CMD}" > "${DEVICE}"
# echo -n $'\65' > /dev/cu.usbmodem1411
# echo -en '\x41' > /dev/cu.usbmodem1411
