#!/bin/bash

#Used to re-write input with timestamps output

#/path/to/my/command.sh 2>&1 | /path/to/timestap.sh >> /var/log/cron/my_log.log

while read x; do
    echo -n `date +%d/%m/%Y\ %H:%M:%S`;
    echo -n " ";
    echo $x;
done
