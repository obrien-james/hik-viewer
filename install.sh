#! /bin/bash
#####################################################
## Created by James O'Brien                        ##
## Date Created 17/05/2020                         ##
## Script to run Hikvision streams on Raspberry Pi ##
##  - Install file - use: on first install only    ##
#####################################################

echo "Installing Hik-Viewer ..."

#Make new directory:
echo "Making new directory"
mkdir ~/hik/

#Move files from to new directory:
echo "Copying files"
cp -r ./ ~/hik/

#Edit file permissions to allow scripts to run:
echo "Updating permissions ... "
chmod 744 ~/hik/*.sh
chmod 744 ~/hik/*.py

#Remove uncecessary files
echo "Remove unnecessary files"
rm ~/hik/install.sh
rm ~/hik/upgrade.sh
rm ~/hik/README.md

#Install tornado - to run websockets
echo "Install tornado"
sudo pip3 install tornado

#update crontab to check HikViewer running and reconnect to missing streams every minute

#start running server
echo "Start server"
~/hik/hik-server-running.sh

#End of install.
echo "Installation complete"
echo "Please edit ~/hik/cameras.config with necessary files"
echo "Once cameras.config has been configured - run ~/hik/hik.sh start"
