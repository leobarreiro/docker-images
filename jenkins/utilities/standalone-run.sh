#!/bin/sh

. "./vars.sh"

mkdir -p $VOLUMEDIR
chown $USER:$USER $VOLUMEDIR -R

docker network create $NETWORK_NAME

docker container run --name $CONTAINER_NAME -d --restart always \
    --network $NETWORK_NAME -p $HTTP_PORT:8080 -p 50000:50000 -m 2048m \
    -v $VOLUMEDIR:/var/quasar/ci \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):/usr/bin/docker $IMAGE_NAME:$IMAGE_TAG
