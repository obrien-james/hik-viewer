#! /bin/bash
#####################################################
## Created by James O'Brien                        ##
## Date Created 11/07/202p                         ##
## check web control server running                ##
#####################################################

if pgrep hik-server.py >/dev/null

then
     echo "Process is running."
else
     echo "Process is not running."
fi 
