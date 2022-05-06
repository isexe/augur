#!/bin/bash

echo "Setting default git configuration..."
scripts/install/easy/git_setup.sh
# ./git_setup.sh
echo "...Finished"; echo "";

echo "Checking dependencies..."
scripts/install/easy/dependency_installer.sh || {echo "You choose to manually install, please install the packages then answer y next time"; exit 0;}
# ./dependency_installer.sh
echo "...Finished"; echo "";

echo "Installing Augur..."
source scripts/install/easy/Installer.sh
echo "...Finished"; echo "";
