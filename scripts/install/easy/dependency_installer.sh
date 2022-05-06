#!/bin/bash

# Currently, this does nothing.  Wanted to make optional flag to say yes
# to apt-get install -y but for now it's hard coded.
## flag=$1

# https://askubuntu.com/questions/519/how-do-i-write-a-shell-script-to-install-a-list-of-applications
# reports fails
# removed e flag to prevent early termination of script with errors from commands
set -u -o pipefail

# Check sudo status
# will run program without requiring sudo password.
# Shouldn't need since will be running with sudo and if not will just prompt later during install
## sudo -n true
# This ensures user has sudo
test $? -eq 0 || exit 1 "You need sudo privileges to run this script."

# https://stackoverflow.com/questions/18921350/shell-script-correct-way-to-declare-an-empty-array
# empty array for missing dependencies
# will be 1 or 0 to declare that index in depArray is found
declare -a foundDepArray=()
declare -a errorArray=()

# https://gist.github.com/montanaflynn/e1e754784749fd2aaca7#file-check_for_dependencies-sh
# Insert each required package in this array as string
# Example array ( "python" "python3" "pip" )
depArray=( "software-properties-common" "python3-dev" "postgresql" "postgresql-contrib" "postgresql-client" "build-essential" "snapd" "make" "python3-pip" "pythonpy" "expect" "nodejs" "npm")

# Loops through packages and detects if they are missing
index=0
for i in "${depArray[@]}"
do
    errorArray[$index]=0
    foundDepArray[$index]=1
    command -v $i >/dev/null 2>&1 || {
        # if missing set foundDepArray[index] value to 0
        foundDepArray[$index]=0
    }
    # https://linuxize.com/post/bash-increment-decrement-variable/
    ((index+=1))
done

echo "--- Dependencies Status ---"
echo "Just because it says it is missing doesn't"
echo "mean it actually is, just a heads up."
echo "If a dependency is already installed but not found"
echo "using the automatic install should not cause any errors."
echo "0 = Not Found, 1 = Found"
echo ""

# loop through dep. array
index=0
for i in "${depArray[@]}"
do
    # show status of dep
    echo "$i: ${foundDepArray[$index]}"
    ((index+=1))
done

echo ""

# explain to user dependencies are required and must now be installed manually
noResponse () {
    echo "You chose to forgo the automatic installation process."
    echo "You must install these packages for Augur to work properly."
    echo "Please manually install the dependencies that are missing."
    exit 1
}

# start installing missing packages
yesResponse () {
    # loop through dep array
    index=0
    for i in "${depArray[@]}"
    do
        # if dep is missing...
        if [ ${foundDepArray[$index]} = 0 ] 
        then
            # ...install dep
            # should add parameter that allows -y instead of hard coding it
            sudo apt-get install -y $i || errorArray[$index]=1
        fi
        ((index+=1))
    done

    # Special dependencies that rely on previous dependencies to install

    command -v "go" >/dev/null 2>&1 || {
        # sudo snap install go --classic
    }
    
    command -v "pip" >/dev/null 2>&1 || {
        python -m pip install --upgrade pip
    }
    # sudo npm init vue@latest
    # sudo npm install -g @vue/cli
    # sudo pip install tensorflow==2.5.0
    # may need to add error handling using the error array here 
}

# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
# Prompts user for valid response
while true ;
do
    read -p 'Would you like to install the *possibly* missing dependencies (y/n): ' response
    case $response in
        [Yy]* ) echo ""; yesResponse; break;;
        [Nn]* ) echo ""; noResponse; break;;
        *) echo "Please answer with y/n";;
    esac
done
