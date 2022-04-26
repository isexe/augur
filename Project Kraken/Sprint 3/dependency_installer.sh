#!/bin/bash

# Currently, this does nothing.  Wanted to make optional flag to say yes
# to apt-get install -y but for now it's hard coded.
## flag=$1

# https://askubuntu.com/questions/519/how-do-i-write-a-shell-script-to-install-a-list-of-applications
# reports fails
set -eu -o pipefail

# Check sudo status
# will run program without requiring sudo password.
# Shouldn't need since will be running with sudo and if not will just prompt later during install
## sudo -n true
# This ensures user has sudo
test $? -eq 0 || exit 1 "You need sudo privileges to run this script."

# https://stackoverflow.com/questions/18921350/shell-script-correct-way-to-declare-an-empty-array
# empty array for missing dependencies
declare -a missingDepArray=()

# https://gist.github.com/montanaflynn/e1e754784749fd2aaca7#file-check_for_dependencies-sh
# Insert each required package in this array as string
# Example array ( "python" "python3" "pip" )
depArray=( ) 

# Loops through packages and detects if they are missing
index=0
for i in "${depArray[@]}"
do
    missingDepArray[$index]=1
    command -v $i >/dev/null 2>&1 || {
        # if missing set missingDepArray[index] value to 1
        missingDepArray[$index]=0
    }
    # https://linuxize.com/post/bash-increment-decrement-variable/
    ((index+=1))
done

echo "--- Dependencies Status ---"
echo "0 = Missing, 1 = Found"

# loop through dep. array
index=0
for i in "${depArray[@]}"
do
    # show status of dep
    echo "$i: ${missingDepArray[$index]}"
    ((index+=1))
done

echo ""

# explain to user dependencies are required and must now be installed manually
noResponse () {
    echo "You chose to forgo the automatic installation process."
    echo "You must install these packages for Augur to work properly."
    echo "Please manually install the dependencies that were missing."
}

# start installing missing packages
yesResponse () {
    # loop through dep array
    index=0
    for i in "${depArray[@]}"
    do
        # if dep is missing...
        if [ ${missingDepArray[$index]} = 0 ] 
        then
            # ...install dep
            # should add parameter that allows -y instead of hard coding it
            sudo apt-get install -y $i
        fi
        ((index+=1))
    done
}

# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
# Prompts user for valid response
while true ;
do
    echo 'Would you like to install the missing dependencies? (y/n)' 
    read response
    case $response in
        [Yy]* ) echo ""; yesResponse; break;;
        [Nn]* ) echo ""; noResponse; break;;
        *) echo "Please answer with y/n";;
    esac
done