### Introduction

This folder contains the files that are used for the 'make easy-install' command.  Currently, the command doesn't function correctly and exits prematurely due to an error during the installation of one of the workers.  This error seems to originate for outside of these scripts, but there could just be something wrong in the [installer script](./Installer.sh).  For these scripts to function properly, please install them in the home directory.

If there is ever a change to the required packages for Augur please amend them to the dependancy array [here](./dependency_installer.sh).
