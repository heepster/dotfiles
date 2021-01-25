#!/bin/bash

PLAYBOOK=${1:-configs.yml}
HOST=127.0.0.1
VAULT_PW_FILE=vault-pw
COMMAND=ansible-playbook

if [ "$(uname)" == "Darwin" ]; then
  PREFIX=~/Library/Python/3.8/bin/
  COMMAND="$PREFIX$COMMAND"
fi

$COMMAND --ask-become-pass --vault-id @$VAULT_PW_FILE --connection=local --inventory $HOST, $PLAYBOOK
