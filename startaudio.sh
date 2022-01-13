#! /bin/bash

##########################################
## Created by: James O'Brien            ##
## Created date: 13/01/2022             ##
## RaspberryPi Hikvision Camera Viewer  ##
##  - Used to start specific audio.     ##
##########################################

## Get stream window size from passed parameter
## Passed parameters: dispay, window, base, camera number, stream name. 
## $1=Display; $2=Base; $3=Camera; $4=Name for SCreen

echo "Starting Audio Stream"
echo "          Camera - ""$4" 
screen -dmS "$4" sh -c 'omxplayer --avdict rtsp_transport:tcp --win "'"0 0 1 1"'" --layer 0 --vol 10 --live --threshold 0 --timeout 30 --display '"$1"' '"$2""$3"
