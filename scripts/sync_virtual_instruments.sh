#!/bin/bash

set -e

HOME=/home/kevin
ARCHIVE_DIR=$HOME/Archive

rsync -a --progress $ARCHIVE_DIR/VirtualInstruments $ARCHIVE_DIR/Data