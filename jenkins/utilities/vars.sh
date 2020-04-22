#!/bin/sh

export IMAGE_TAG=1.0.2
export CONTAINER_NAME=quasarci
export NETWORK_NAME=jenkins
export IMAGE_NAME=quasarbot/jenkins
export VOLUMEDIR=/var/local/docker/volumes/ci
export HTTP_PORT=8095
export SERVICE_NAME=quasar_jenkins