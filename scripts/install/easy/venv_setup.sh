#!/bin/bash

# Checks for python package
command -v "python3" >/dev/null 2>&1 || {
    sudo apt-get install "python3"
}
# Checks for virtual environment package
command -v "python3-venv" >/dev/null 2>&1 || {
    sudo apt-get install "python3-venv"
}

# Creates virtual environment and enables it
path=$HOME/.virtualenvs/augur_env

python3 -m venv path
echo "Your virtual environment was setup here:"
echo "$path"; echo "";

source $HOME/.virtualenvs/augur_env/bin/activate