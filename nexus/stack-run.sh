#!/bin/sh

VOLUME_DIR=/var/local/docker/volumes/nexus
USER_SERVICE=200

mkdir -p $VOLUME_DIR
chown $USER_SERVICE:$USER_SERVICE $VOLUME_DIR -R
chmod 0755 $VOLUME_DIR -R
docker stack deploy --compose-file docker-compose.yml quasar
