#!/bin/bash

if ! [[ "$1" == "dump" || "$1" == "load" ]]; then 
  echo "Must pass either 'dump' or 'load'"
  exit 1
fi

echo "$1 Gnome Terminal Settings"
CONF_FILE=configs/gnome-terminal.dconf
DIR=/org/gnome/terminal/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 WM Keybindings"
CONF_FILE=configs/keybindings_wm.dconf
DIR=/org/gnome/desktop/wm/keybindings/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 WM Custom Keybindings"
CONF_FILE=configs/keybindings_wm_custom.dconf
DIR=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 Gnome Keybindings"
CONF_FILE=configs/keybindings_gnome.dconf
DIR=/org/gnome/shell/keybindings/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 Media Keybindings"
CONF_FILE=configs/keybindings_media_keys.dconf
DIR=/org/gnome/settings-daemon/plugins/media-keys/
./bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 Gnome Interface"
CONF_FILE=configs/gnome_interface.dconf
DIR=/org/gnome/desktop/interface/
bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 Gnome Desktop Background"
CONF_FILE=configs/gnome_desktop_background.dconf
DIR=/org/gnome/desktop/background/
bin/dconf.sh $1 $CONF_FILE $DIR

echo "$1 Gnome Desktop Screensaver"
CONF_FILE=configs/gnome_desktop_screensaver.dconf
DIR=/org/gnome/desktop/screensaver/
bin/dconf.sh $1 $CONF_FILE $DIR
