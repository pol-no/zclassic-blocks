#!/bin/bash

usage() {
    echo "Usage: `basename $0` [-r]"
    echo "Runs zclassic-blocks container.
Options:
    -h - Shows help
    -r - Removes container
"
}

blocks_exists() {
    [ "$(docker ps -aq -f name=zclassic-blocks)" != "" ]
}

while getopts ":rh" opt; do
  case $opt in
    h)
      usage
      exit
      ;;
    r)
      if blocks_exists
      then
        docker rm zclassic-blocks > /dev/null
        CODE=$?
        if [[ $CODE -eq 0 ]]
        then
          echo "zclassic-blocks container has been removed."
        else
          echo "Error: $CODE"
          exit $CODE
        fi
        exit
      else 
		echo "zclassic-blocks container doesn't exist."
		exit
      fi
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if blocks_exists
then
    echo "zclassic-blocks container is already prepared."
else 
    docker run -it --name zclassic-blocks \
        fxminer/zclassic-blocks:latest $@
	CODE=$?
	if [[ $CODE -ne 0 ]]
	then
		echo "Error: $CODE"
		exit $CODE
	fi
fi
