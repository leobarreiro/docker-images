#!/bin/bash

. "./vars.sh"

docker service rm $SERVICE_NAME
docker network rm $SERVICE_NAME
rm -rf $VOLUMEDIR
