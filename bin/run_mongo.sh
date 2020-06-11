#!/bin/bash

NAME=$1
HOST_DATA_DIR=~/.local/share/docker-mongo/$NAME/
CONTAINER_DATA_DIR=/data/db

mkdir -p $HOST_DATA_DIR

sudo docker run \
  -p 27017:27017 \
  --rm \
  --name mongo4.2 \
  -v $HOST_DATA_DIR:$CONTAINER_DATA_DIR \
  mongo:4.2 
