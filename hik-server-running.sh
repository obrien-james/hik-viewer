#! /bin/bash
#####################################################
## Created by James O'Brien                        ##
## Date Created 11/07/2020                         ##
## check web control server running                ##
#####################################################

if pgrep -f hik-server.py &>/dev/null;

then
     echo "Hik-server process is running."
else
     echo "Hik-server process is not running."
     
     nohup python3 ~/hik/hik-server.py 2>&1 | ~/hik/logger.sh >> hik-server.log &
fi 
