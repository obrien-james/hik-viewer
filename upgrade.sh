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

#update files
cp ~/hik/hik-viewer/* ~/hik/

#restore config settings
mv ~/hik/cameras.config.original cameras.config

#restart cameras streams
~/hik/hik.sh reload

echo "Upgrade complete"
