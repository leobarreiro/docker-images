#!/bin/bash

SERVICE_NAME=quasar_nexus
VOLUME_DIR=/var/local/docker/volumes/nexus

docker service rm $SERVICE_NAME
docker network rm $SERVICE_NAME
rm -rf $VOLUME_DIR
