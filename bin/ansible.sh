#!/bin/bash

PLAYBOOK=${1:-configs.yml}
HOST=127.0.0.1

ansible-playbook --ask-become-pass --connection=local --inventory $HOST, $PLAYBOOK
