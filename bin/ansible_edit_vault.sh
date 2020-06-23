#!/bin/bash

VAULT_PW_FILE=vault-pw
ansible-vault edit --vault-id @$VAULT_PW_FILE $1
