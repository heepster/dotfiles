#!/bin/bash

echo "Syncing WM Keybindings"
CONF_FILE=configs/wm_keybindings.dconf
DIR=/org/gnome/desktop/wm/keybindings/
./bin/dconf.sh "load" $CONF_FILE $DIR

echo "Syncing Gnome Terminal Settings"
CONF_FILE=configs/gnome-terminal.dconf
DIR=/org/gnome/terminal/
./bin/dconf.sh "load" $CONF_FILE $DIR
