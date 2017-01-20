#!/bin/bash
echo Zclassic blocks
echo

echo "Creating volumes & downloading images..."


docker volume create --name zclassic-blocks

docker pull fxminer/zclassic-blocks:latest

exit

# todo
echo
if [ "$(docker ps -aq -f name=zclassic-blocks)" = "" ]
then
    echo "Preparing zclassic-blocks..."
    docker run -it --name zclassic-params \
        -v zclassic-params:/home/zcl/.zcash-params \
        fxminer/zclassic-params
fi
echo "ZClassic params are ready."
echo "Done"


