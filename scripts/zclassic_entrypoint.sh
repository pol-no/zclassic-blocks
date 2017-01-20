#!/bin/bash

set -e

zmkdir() {
    if ! [ -d "$1" ]
    then
        mkdir -p "$1"
    fi
    chmod 777 "$1"
}

# Install script
if [[ $1 = 'init' ]]
then
    SCRIPT=$2
    if [[ $# -eq 1 ]] 
    then
        SCRIPT=zclassic-blocks.sh
    fi
    cat "${ZCL_SCRIPTS}/init/$SCRIPT"
    exit $?
fi

#if ! [ -d "${ZCLASSIC_DATA_DIR}/blocks" ] && ! [ -d "${ZCLASSIC_DATA_DIR}/chainstate" ]
#then
#    mkdir -p "${ZCLASSIC_DATA_DIR}/blocks" "${ZCLASSIC_DATA_DIR}/chainstate"
#	
#	
#    echo "Copying blockchain files..."
#	cp -R "${ZCLASSIC_BLOCKS}/blocks" "${ZCLASSIC_DATA_DIR}"
#	cp -R "${ZCLASSIC_BLOCKS}/chainstate" "${ZCLASSIC_DATA_DIR}"
#	
#    chmod 666 "${ZCLASSIC_DATA_DIR}/blocks" "${ZCLASSIC_DATA_DIR}/chainstate"
#    chown -R zcl:zcl "${ZCLASSIC_DATA_DIR}/blocks" "${ZCLASSIC_DATA_DIR}/chainstate"
#fi

echo "ZClassic blockchain is ready."

# Shell script
if [[ $1 = 'shell' ]] || [[ $1 = 'sh' ]] || [[ $1 = 'bash' ]]
then
    if [[ $1 = 'shell' ]] || [[ $1 = 'bash' ]]
    then
	shift
        /bin/bash $@ 
    fi
    if [[ $1 = 'sh' ]]
    then
	shift
        /bin/sh $@ 
    fi
    exit
fi
