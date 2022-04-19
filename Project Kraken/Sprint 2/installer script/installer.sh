#!/bin/sh
cd ~
sudo apt update
sudo apt install software-properties-common
sudo apt install postgresql postgresql-contrib
sudo apt install build-essential
sudo apt install expect
./new.sh
sudo -u postgres psql postgres -c "CREATE DATABASE augur;"
sudo -u postgres psql postgres -c "CREATE USER augur WITH ENCRYPTED PASSWORD 'password';"
sudo -u postgres psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE augur TO augur;"
git config --global diff.renames true
git config --global diff.renameLimit 200000
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=9999999999999'
git clone https://github.com/chaoss/augur.git
cd augur/
sudo apt make
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8
sudo apt-get install python3-venv
python3 -m venv $HOME/.virtualenvs/augur_env
source $HOME/.virtualenvs/augur_env/bin/activate
sudo apt install python3-pip
sudo apt install pythonpy
python3.8 -m pip install --upgrade pip
pip install tensorflow==2.5.0
wget -c https://dl.google.com/go/go1.16.2.linux-amd64.tar.gz
sudo tar -xvf  go1.16.2.linux-amd64.tar.gz 
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/augur
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
make install-dev

