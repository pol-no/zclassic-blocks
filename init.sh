#!/bin/bash
echo Zclassic blocks
echo

echo "Creating volumes & downloading images..."
export NAME=zclassic

docker volume create --name zclassic-blocks
docker volume create --name zclassic-chainstate

docker pull fxminer/zclassic-params:latest
docker pull fxminer/zclassic:latest

echo

if [ "$(docker ps -aq -f name=zclassic-params)" = "" ]
then
	echo "Preparing ZClassic params..."
	docker run -it --name zclassic-params \
		-v zclassic-params:/home/zcl/.zcash-params \
		fxminer/zclassic-params
fi
echo "ZClassic params are ready."
echo "Done"


