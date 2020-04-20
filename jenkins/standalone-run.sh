#!/bin/sh

$VOLUMEDIR=/var/local/docker/volumes/ci

mkdir -p "$VOLUMEDIR"
chown $USER:$USER "$VOLUMEDIR" -R

docker network create jenkins

docker container run --name quasar-ci -d --restart always \ 
    --network jenkins -p 8094:8080 -p 50000:50000 -m 2048m \ 
    -v "$VOLUMEDIR":/var/quasar/ci \ 
    -v /var/run/docker.sock:/var/run/docker.sock \ 
    -v $(which docker):/usr/bin/docker quasarbot/jenkins:latest
