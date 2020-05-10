#! /bin/bash
##########################################################
## Created by James O'Brien                             ##
## Date Created 10/05/20                                ##
## Script to run Hikvision streams on Raspberry Pi      ##
##  - Service file - Changes default preset + reload    ##
##########################################################

sed --debug -i -E "s/DISPAYPRESET=[0-9]{1,2}/DISPAYPRESET=$1/g" cameras.config

./hik.sh reload
