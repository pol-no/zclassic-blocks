#!/bin/bash

echo
echo zclassic-blocks 
echo Type 'zcl-archive' when all blocks are downloaded from ZClassic blockchain.
echo Current status: 'zcl-status'
echo

docker volume create --name zclassic-get-blocks

cd ..
if ! [ -d share ]
then
    mkdir -p share
fi

docker run -it --rm --name zclassic-blocks \
    -v zclassic-get-blocks:/home/zcl/.zclassic \
    -v $PWD/share:/home/zcl/share \
    --volumes-from zclassic-params \
    fxminer/zclassic:latest -disablewallet $@
