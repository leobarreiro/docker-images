#!/bin/bash

docker container stop quasarci
docker container rm quasarci
docker image rm quasar-ci:0.0.1
