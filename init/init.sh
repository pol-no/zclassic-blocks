#!/bin/bash
echo Zclassic blocks
echo

echo "Creating volumes & downloading images..."


docker volume create --name zclassic.blocks > /dev/null

docker pull fxminer/zclassic-blocks:latest

echo "Done"


