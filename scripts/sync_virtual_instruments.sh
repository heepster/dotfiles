#!/bin/bash

set -o errexit -o errtrace

HOME=/home/kevin
ARCHIVE_DIR=$HOME/Archive

function error_notify {
  XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -u critical "Cron Task Failed" "Could not sync Virtual Instruments folder"
}
trap 'error_notify' ERR

rsync -a --progress $ARCHIVE_DIR/VirtualInstruments $ARCHIVE_DIR/Data