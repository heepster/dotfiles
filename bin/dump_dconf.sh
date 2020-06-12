#!/bin/bash

DUMP_FILE="configs/dump.dconf"

rm -f $DUMP_FILE

_1=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ 
_2=/org/gnome/terminal/
DIR=$_2

dconf dump $DIR >> $DUMP_FILE
