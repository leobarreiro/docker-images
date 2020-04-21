#!/bin/sh

. "./vars.sh"

mkdir -p $VOLUMEDIR
chown $USER:$USER $VOLUMEDIR -R
docker stack deploy --compose-file docker-compose.yml quasar
