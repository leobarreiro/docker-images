#!/bin/bash

. "./vars.sh"

docker container stop $CONTAINER_NAME
docker container rm $CONTAINER_NAME
docker image rm $IMAGE_NAME:$IMAGE_TAG
docker image rm $IMAGE_NAME:latest
docker network rm $NETWORK_NAME
rm -rf $VOLUMEDIR
