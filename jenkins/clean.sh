#!/bin/bash

IMAGE_VERSION=0.0.1
CONTAINER_NAME=quasarci
NETWORK_NAME=jenkins
IMAGE_NAME=quasarbot/jenkins
VOLUMEDIR=/var/local/docker/volumes/ci

docker container stop $CONTAINER_NAME
docker container rm $CONTAINER_NAME
docker image rm $IMAGE_NAME:0.0.1
docker image rm $IMAGE_NAME:latest
docker network rm $NETWORK_NAME
rm -rf $VOLUMEDIR
