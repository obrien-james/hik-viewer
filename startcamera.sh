#! /bin/bash

##########################################
## Created by: James O'Brien            ##
## Created date: xx/xx/xxxx             ##
## RaspberryPi Hikvision Camera Viewer  ##
##  - Used to start specific streams    ##
##########################################

## Get stream window size from passed parameter
## Passed parameters: dispay, window, base, camera number, stream name. 
## $1=Display; $2=Window; $3=Base; $4=Camera; $5=Name for SCREEN

echo "Starting Stream"
echo "          Camera - ""$4" 
# screen -dmS "$5" sh -c 'omxplayer --avdict rtsp_transport:tcp --win "'"$2"'" --display '"$1"' '"$3""$4"'02'
screen -dmS "$5" sh -c 'omxplayer --avdict rtsp_transport:tcp --dbus_name "org.mpris.MediaPlayer2.omxplayer-'"$5"'" --win "'"$2"'" --layer 1 --live --threshold 0 --timeout 30 --display '"$1"' '"$3""$4"
