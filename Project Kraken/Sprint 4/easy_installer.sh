#!/bin/bash

echo "Setting default git configuration..."
# scripts/easy_install/git_setup.sh
./git_setup.sh
echo "...Finished"; echo "";

echo "Checking dependencies..."
# scripts/easy_install/dependency_installer.sh
./dependency_installer.sh
echo "...Finished"; echo "";
