Hikvision Viewer

cameras.config contains config settings; need to set base to RTSP stream string. 

Update crontab to check every minute for dropped streams:
* * * * * cd ~/hik && ./hik.sh restart auto >/dev/null 2>&1
