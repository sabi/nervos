#!/bin/bash

IMAGENAME="$(cat docker-compose.yaml | grep image | cut -d ':' -f 2,3 | xargs)"
CONTAINERNAME="$(echo $IMAGENAME | cut -d ':' -f 1)"

docker build -t $IMAGENAME .
docker-compose up -d
