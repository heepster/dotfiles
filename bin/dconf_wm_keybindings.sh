#!/bin/bash

CONF_FILE=configs/wm_keybindings.dconf
DIR=/org/gnome/desktop/wm/keybindings/

if [ "$1" = "dump" ]; then 
  rm -f $CONF_FILE
  dconf dump $DIR > $CONF_FILE
elif [ "$1" = "load" ]; then
  dconf load $DIR < $CONF_FILE
else
  echo "Must pass either 'dump' or 'load'"
  exit 1
fi
