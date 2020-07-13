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
rm ~/hik/upgrade.sh
rm ~/hik/README.md

#Install tornado - to run websockets
sudo pip3 install tornado

#update crontab to check HikViewer running and reconnect to missing streams every minute

#Install service file to run websocket server from start of Pi

#Edit file permissions to allow scripts to run:
chmod 744 ~/hik/*.sh
chmod 744 ~/hik/*.py

#End of install.
echo "Installation complete"
echo "Please edit ~/hik/cameras.config with necessary files"
echo "Once cameras.config has been configured - run ~/hik/hik.sh start"
