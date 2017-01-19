#!/bin/bash

mkdir -p share

echo
echo zclassic-blocks 
echo Type 'zcl-archive' when all blocks are downloaded from ZClassic blockchain.
echo Current status: 'zcl-status'
echo

docker run -it --rm --name zclassic-blocks \
	-v $PWD/share:/home/zcl/share \
    --volumes-from zclassic-params \
    fxminer/zclassic:latest $@
