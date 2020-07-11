#! /bin/bash
########################################################
## Created by James O'Brien                           ##
## Date Created 11/07/2020                            ##
## Script to upgrade hik-viewer software              ##
##  - Upgrade file - use: Runs after repo update      ##
########################################################

echo "Upgrading Hik-Viewer ..."

#Remove uncesessary files
rm -rf ~/hik/hik-viewer/install.sh
rm -rf ~/hik/hik-viewer/README.md
rm -rf ~/hik/hik-viewer/cameras.config

#set permissions
chmod 744 ~/hik/hik-viewer/*.sh
chmod 744 ~/hik/hik-viewer/*.py

#update files
cp -r ~/hik/hik-viewer/* ~/hik/

#restore config settings
mv ~/hik/cameras.config.original cameras.config

#restart cameras streams
~/hik/hik.sh reload

#restart server
pkill -f hik-server.sh
~/hik/hik-server-running.sh

echo "Upgrade complete"
