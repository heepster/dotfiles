#!/bin/bash

echo "Dumping WM Keybindings"
CONF_FILE=configs/wm_keybindings.dconf
DIR=/org/gnome/desktop/wm/keybindings/
./bin/dconf.sh "dump" $CONF_FILE $DIR

echo "Dumping Gnome Terminal Settings"
CONF_FILE=configs/gnome-terminal.dconf
DIR=/org/gnome/terminal/
./bin/dconf.sh "dump" $CONF_FILE $DIR
