#!/bin/bash

PLAYBOOK=${1:-configs.yml}
HOST=127.0.0.1
VAULT_PW_FILE=vault-pw

ansible-playbook --ask-become-pass --vault-id @$VAULT_PW_FILE --connection=local --inventory $HOST, $PLAYBOOK
