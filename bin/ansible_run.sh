#!/bin/bash

PLAYBOOK=${1:-configs.yml}
HOST=127.0.0.1
VAULT_PW_FILE=vault-pw
COMMAND=ansible-playbook

if [ "$(uname)" == "Darwin" ]; then

  if [ -d "$HOME/Library/Python/3.8/" ]; then
    PYTHON_DIR="$HOME/Library/Python/3.8"
  elif [ -d "$HOME/Library/Python/3.9/" ]; then
    PYTHON_DIR="$HOME/Library/Python/3.9"
  else
    echo "Python not found"
    exit 1
  fi

  PREFIX=$PYTHON_DIR/bin/
  COMMAND="$PREFIX$COMMAND"
fi

if [ "$(uname)" == "Linux" ]; then
  PREFIX=~/.local/bin/
  COMMAND="$PREFIX$COMMAND"
fi


$COMMAND \
  --ask-become-pass \
  --vault-id @$VAULT_PW_FILE \
  --connection=local \
  --inventory $HOST, $PLAYBOOK \
  -e 'ansible_python_interpreter=/usr/bin/python3'
