#!/bin/bash

echo "Setting default git configuration..."
scripts/install/easy/git_setup.sh
# ./git_setup.sh
echo "...Finished"; echo "";

echo "Setting up virtual environment..."
scripts/install/easy/venv_setup.sh
source $HOME/.virtualenvs/augur_env/bin/activate
echo "...Finished"; echo "";

echo "Checking dependencies..."
scripts/install/easy/dependency_installer.sh
# ./dependency_installer.sh
echo "...Finished"; echo "";
