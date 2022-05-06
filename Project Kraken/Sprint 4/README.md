# Sprint 4

## Introduction

During this sprint, we wrapped up the development of the scripts.  Unfortunately, due to falling behind schedule, we did not get to develop the documentation of these scripts on the website.  The scripts we added check for dependencies and then install Augur.  The make file was altered to add an easy-install option.  Using the 'make easy-install' command, a script will run the dependency_checker script and then the installer script.

## Issues

The biggest issue is that the Augur View scripts were never developed.  The two members that were designated to create the installer never delivered their work and because of that, we were unable to add it to the final project.

Currently, the Augur script has a lot of bugs and the scripts aren't that efficient.  For the dependency installer, there are a lot of false positives for missing packages.  This will cause the script to attempt to re-install them though this issue is minimal since it will notice they're installed and move on.  The installer script is a little broken at the moment and there are quite a few error messages when running it.  This may be do to some bug unrelated to our project as a version of this script was originally working, but now is having issues during the worker setup of the Augur install.

## Reflection

During the course of this project, we learned the importance of time management and team communication.  At the beginning of this project, we were unsure if the scope of our requirements met the expectations of a final project and felt as though we may have been aiming too low.  Although that is how we felt at the beginning, this worry became irrelevant due to our poor communication and some people's failure to deliver their work.

## Improvements

The first obvious improvement would be fixing the errors and creating a functional feature for Augur.  This would most likely be done during the 5th Sprint if there was one.  Ideally, we would have finished these scripts last week and worked on bug fixing this week, but that didn't happen so nothing can be done.  Another improvement would have been documenting our features on the official Augur documentation.  This is a quick and easy way of advertising our project to people and describing how to use it.  The next big improvement would have been adding the Augur View scripts for an easy installer.  This wouldn't have been too difficult since some of the Augur scripts could have been converted to work with Augur View, but with the amount of time we had and the issue of some team members not contributing prevented this from happening.