#!/bin/bash

TAG=latest
if [[ $# -gt 0 ]]
then
    TAG=$1
fi

docker push fxminer/zclassic-blocks:${TAG}
