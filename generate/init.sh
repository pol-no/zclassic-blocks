#!/bin/bash
echo Zclassic blocks
echo

echo "Creating volumes & downloading images..."

if [[ `docker volume ls | grep zclassic-get-blocks | wc -l` -gt 0 ]]
then 
	docker volume rm zclassic-get-blocks
fi
docker volume create --name zclassic-get-blocks

docker pull fxminer/zclassic:latest
docker pull fxminer/zclassic-params:latest

echo
if [ "$(docker ps -aq -f name=zclassic-params)" = "" ]
then
    echo "Preparing zclassic-params..."
    docker run -it --name zclassic-params \
        -v zclassic-params:/home/zcl/.zcash-params \
        fxminer/zclassic-params
fi

echo "ZClassic params are ready."
echo "Done"


