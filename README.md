Hikvision Viewer

cameras.config contains config settings; need to set base to RTSP stream string. 

Update crontab to check every minute for dropped streams:
* * * * * cd ~/hik && ./hik.sh restart auto >/dev/null 2>&1

Make sure user executing hik.sh script is memeber of video group

Update cameras.config and insert presets; set default preset

run as user comand for info

runuser -l james -c 
