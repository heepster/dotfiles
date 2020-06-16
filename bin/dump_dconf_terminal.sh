#!/bin/bash

DUMP_FILE="configs/gnome-terminal.dconf"

rm -f $DUMP_FILE

DIR=/org/gnome/terminal/

dconf dump $DIR >> $DUMP_FILE
