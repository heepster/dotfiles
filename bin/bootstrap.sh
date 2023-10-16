#!/bin/bash


UNAME="$(uname -s)"

if [ "$UNAME" == "Linux" ]; then 

  # if Pip doesn't exist, install it and ansible
  if ! python3 -m pip -V; then
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --user
    rm get-pip.py

    python3 -m pip install --user ansible-core
  fi
  
elif [ "$UNAME" == "Darwin" ]; then 

  if [[ ! -f /usr/local/bin/brew ]] && [[ ! -f /opt/homebrew/bin/brew ]]; then
    echo "Installing Brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  echo "Upgrading PIP"
  pip3 install --upgrade --user pip

  echo "Installing Ansible"
  pip3 install --user ansible
  export PATH=~/Library/Python/3.8/bin:$PATH

else

  echo "Can't run on this OS"
  exit 1

fi 

