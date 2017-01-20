#!/bin/bash

echo
echo zclassic-blocks 
echo Importing blocks...

docker volume create --name zclassic-get-blocks

cd ..
docker run -it --rm --name zclassic-blocks \
    -v zclassic-get-blocks:/home/zcl/.zclassic \
    -v $PWD/share:/home/zcl/share \
    fxminer/zclassic:latest shell -c bash -c \
        'rm -Rf ~/.zclassic/* && cp /home/zcl/share/* /home/zcl/.zclassic && cd /home/zcl/.zclassic && 7z x *.7z && chown -R zcl:zcl /home/zcl/.zclassic && chmod 777 blocks chainstate'
