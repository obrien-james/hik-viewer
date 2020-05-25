#! /bin/bash
########################################################
## Created by James O'Brien                           ##
## Date Created 17/05/2020                            ##
## Script to run Hikvision streams on Raspberry Pi    ##
##  - Update file - use: Run after update repository  ##
########################################################

echo "Updating Hik-Viewer ..."

#Move all but config file:
SOURCE = ./
TARGET = ~/hik/
find $SOURCE -type f ! -name "cameras.config" -exec mv {} $TARGET \;

#Remove uncecessary files
rm ~/hik/install.sh
rm ~/hik/update.sh
rm ~/hik/README.md

#Edit file permissions to allow scripts to run:
chmod 744 ~/hik/*.sh
chmod 744 ~/hik/*.py

#End of install.
echo "Installation complete"
echo "Please edit ~/hik/cameras.config with necessary files"
echo "Once cameras.config has been configured - run ~/hik/hik.sh start"
