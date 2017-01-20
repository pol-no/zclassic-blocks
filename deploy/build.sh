#!/bin/bash

TAG=latest
if [[ $# -gt 0 ]]
then
    TAG=$1
fi

cd ..
docker build -t fxminer/zclassic-blocks:${TAG} .
