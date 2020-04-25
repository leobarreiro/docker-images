#!/bin/sh

VOLUMEDIR=/var/local/docker/volumes/artifactory
ARTUSER=artifactory

adduser --quiet --no-create-home --disabled-password $ARTUSER

mkdir -p $VOLUMEDIR
mkdir -p $VOLUMEDIR/data
mkdir -p $VOLUMEDIR/logs
mkdir -p $VOLUMEDIR/backup

chown $ARTUSER:$ARTUSER $VOLUMEDIR -R
chmod 775 $VOLUMEDIR -R
docker stack deploy --compose-file docker-compose.yml quasar
