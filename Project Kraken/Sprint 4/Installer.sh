#!/bin/sh
cd ~
mkdir clones
read -p 'Enter database password: ' pass
read -p 'Enter valid GitHub API key: ' key
sudo apt -y update
sudo apt -y install software-properties-common
sudo apt -y make
sudo apt -y install postgresql postgresql-contrib
sudo apt -y install build-essential
sudo apt -y install expect
sudo apt -y install nodejs
sudo apt -y install npm
sudo apt -y install firefox-geckodriver
npm init vue@latest
npm install -g @vue/cli
touch database.sh
echo "#!/bin/sh" >> database.sh
echo "sudo -u postgres psql -h localhost -U postgres -p 5432 -c '\q'" >> database.sh
echo "printf '\n'"
sudo chmod +x database.sh
touch new.sh
echo "#!/usr/bin/expect" >> new.sh
echo "set timeout -1" >> new.sh
echo "spawn ./database.sh" >> new.sh
echo 'expect "Password for user postgres:"' >> new.sh
echo 'send "'"$pass"'\r"' >> new.sh
sudo chmod +x new.sh
./new.sh
sudo -u postgres psql postgres -c "CREATE DATABASE augur;"
sudo -u postgres psql postgres -c "CREATE USER augur WITH ENCRYPTED PASSWORD '$pass';"
sudo -u postgres psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE augur TO augur;"
git config --global diff.renames true
git config --global diff.renameLimit 200000
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=9999999999999'
git clone https://github.com/chaoss/augur.git
cd augur/
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt -y install python3.8
sudo apt-get -y install python3-venv
python3 -m venv $HOME/.virtualenvs/augur_env
source $HOME/.virtualenvs/augur_env/bin/activate
sudo apt -y install python3-pip
sudo apt -y install pythonpy
python3.8 -m pip install --upgrade pip
pip install tensorflow==2.5.0
#pip install git+https://chromium.googlesource.com/external/gyp
wget -c https://dl.google.com/go/go1.16.2.linux-amd64.tar.gz
sudo tar -xvf  go1.16.2.linux-amd64.tar.gz 
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/augur
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
touch maker.sh
echo "#!/bin/sh" >> maker.sh
echo "make install-dev" >> maker.sh
sudo chmod +x maker.sh
touch expector.sh
echo "#!/usr/bin/expect" >> expector.sh
echo "set timeout -1" >> expector.sh
echo "spawn ./maker.sh" >> expector.sh
echo 'expect "Your choice: "' >> expector.sh
echo 'send "2\r"' >> expector.sh
echo 'expect "Database: "' >> expector.sh
echo 'send "augur\r"' >> expector.sh
echo 'expect "User: "' >> expector.sh
echo 'send "augur\r"' >> expector.sh
echo 'expect "Password: "' >> expector.sh
echo 'send "'"$pass"'\r"' >> expector.sh
echo 'expect "Host: "' >> expector.sh
echo 'send "localhost\r"' >> expector.sh
echo 'expect "Port: "' >> expector.sh
echo 'send "5432\r"' >> expector.sh
echo 'expect "GitHub API Key: "' >> expector.sh
echo 'send "'"$key"'\r"' >> expector.sh
echo 'expect "GitLab API Key: "' >> expector.sh
echo 'send "'"$key"'\r"' >> expector.sh
echo 'expect "Your choice: "' >> expector.sh
echo 'send "1\r"' >> expector.sh
echo 'expect "Facade repo path: "' >> expector.sh
echo 'send "'"$HOME"'/clones\r"' >> expector.sh
#echo 'expect "Would you like to install Augur'"'"'s frontend dependencies?* "' >> expector.sh
#echo 'send "y\r"' >> expector.sh
echo 'expect "We noticed you have an Augur API key already. Would you like to overwrite it with a new one?*"' >> expector.sh
echo 'send "n\r"' >> expector.sh
echo 'expect "Would you like to install required NLTK word lists for machine learning workers?*"' >> expector.sh
echo 'send "y\r"' >> expector.sh
echo 'expect eof' >> expector.sh
sudo chmod +x expector.sh
./expector.sh


