#! /bin/bash
#####################################################
## Created by James O'Brien                        ##
## Date Created 11/07/202p                         ##
## check web control server running                ##
#####################################################

if pgrep hik-server.py >/dev/null

then
     echo "Hik-server process is running."
else
     echo "Hik-server process is not running."
     runuser -l james -c 'cd ~/hik'
     runuser -l james -c 'nohup python3 hik-server.py 2>&1 | logger.sh >> hik-server.log &'
fi 
