#!/bin/bash

PLAYBOOK=$1

ansible-playbook -k -K -i hosts $PLAYBOOK
