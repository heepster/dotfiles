#!/bin/bash

function checkExists {
  dpkg -l | grep $1 > /dev/null 2>&1 
}

function printInstall {
  echo "Installing $1..."
}

function printInstallSkip {
  echo "$1 is already installed...skipping."
}

sudo apt-get update

### ANSIBLE ###
checkExists "ansible"
if [ $? -eq 0 ]; then
  printInstallSkip "Ansible"
else
  printInstall "Annsible"
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible

  # This PPA doesn't have a release file for 20.02 Ubuntu
  # which 'breaks' apt updates, so just remove it
  sudo add-apt-repository --remove ppa:ansible/ansible
fi

ansible-galaxy install -r requirements.yml
