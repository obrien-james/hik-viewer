#! /bin/bash
#####################################################
## Created by James O'Brien                        ##
## Date Created 17/05/2020                         ##
## Script to run Hikvision streams on Raspberry Pi ##
##  - Install file - use: on first install only    ##
#####################################################

echo "Installing Hik-Viewer ..."

#Make new directory:
mkdir ~/hik/

#Move files from to new directory:
cp ./ ~/hik/

#Remove uncecessary files
rm ~/hik/install.sh
rm ~/hik/README.md

#Edit file permissions to allow scripts to run:
chmod 744 ~/hik/*.sh

#End of install.
echo "Installation complete"
echo "Please edit ~/hik/cameras.config with necessary files"
echo "Once cameras.config has been configured - run ~/hik/hik.sh start"
