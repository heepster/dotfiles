#!/bin/bash

if ! [ "$1" = "dump" ] || [ "$1" = "load" ]; then 
  echo "Must pass either 'dump' or 'load'"
  exit 1
fi

echo "Dumping WM Keybindings"
CONF_FILE=configs/wm_keybindings.dconf
DIR=/org/gnome/desktop/wm/keybindings/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "Dumping Gnome Terminal Settings"
CONF_FILE=configs/gnome-terminal.dconf
DIR=/org/gnome/terminal/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "Dumping WM Custom Keybindings"
CONF_FILE=configs/wm_custom_keybindings.dconf
DIR=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/
./bin/dconf.sh $1 $CONF_FILE $DIR
