#!/bin/bash

DUMP_FILE="configs/gnome-terminal.dconf"

DIR=/org/gnome/terminal/

dconf load $DIR < $DUMP_FILE
