#!/bin/bash

IMAGE=$1
VERSION=$2

function checkDockerImageExists {
  if sudo docker images | grep "$1" | grep "$2"; then
    echo "Docker image '$1:$2' found"
  else
    echo "Docker image '$1:$2' not found"
    read -p "Try to download it? " -n 1 -r 

    if [[ $REPLY =~ ^[Yy]$ ]]; then
      sudo docker pull $1:$2
    else
      exit 1
    fi
  fi
}

function runDockerImage {
  sudo docker 
}

if ! [ -x "$(command -v docker)" ]; then
  echo "Docker not installed -- exiting"
  exit 1
fi

checkDockerImageExists $IMAGE $VERSION

