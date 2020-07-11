#! /bin/bash
##############################################################
## Created by James O'Brien                                 ##
## Date Created 17/05/2020                                  ##
## Script to run Hikvision streams on Raspberry Pi          ##
##  - Update file - use: Run to update code and run upgrade ##
##############################################################

echo "Updating Hik-Viewer ..."
git clone https://github.com/obrien-james/hik-viewer

chmod 744 ./hik-viewer/upgrade.sh

#Backup cameras.config
mv cameras.config cameras.config.original

echo "running upgrade script ... "
./hik-viewer/upgrade.sh
