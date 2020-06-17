#!/bin/bash

CONF_FILE=$2
DIR=$3

if [ "$1" = "dump" ]; then 
  rm -f $CONF_FILE
  dconf dump $DIR > $CONF_FILE
elif [ "$1" = "load" ]; then
  echo "Loading $CONF_FILE into $DIR"
  dconf load $DIR < $CONF_FILE
else
  echo "Must pass either 'dump' or 'load'"
  exit 1
fi
