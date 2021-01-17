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

UNAME="$(uname -s)"

if [ "$UNAME" == "Linux" ]; then 

  sudo apt-get update
  
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

elif [ "$UNAME" == "Darwin" ]; then 

  if [ ! -f /usr/local/bin/brew ]; then
    echo "Installing Brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  echo "Installing Ansible"
  pip3 install --user ansible
  export PATH=~/Library/Python/3.7/bin:$PATH

else

  echo "Can't run on this OS"
  exit 1

fi 

mkdir -p galaxy
ansible-galaxy install --roles-path galaxy -r requirements.yml
ansible-galaxy collection install community.general
