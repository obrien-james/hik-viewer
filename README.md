Hikvision Viewer

cameras.config contains config settings; need to set base to RTSP stream string. 

Update crontab to check every minute for dropped streams:
* * * * * cd ~/hik && ./hik.sh restart auto >/dev/null 2>&1

Make sure user executing hik.sh script is memeber of video group

Update cameras.config and insert presets; set default preset
- - - - - - - - - - - - - - - - - - - - - - - - 

Requirements: 
Screen (apt-get install screen)
Pip3 (apt-get install python3-pip)
OMXplayer (apt-get install omxplayer)
- - - - - - - - - - - - - - - - - - - - - - - - 

OMXplayer fix:
run:  

cd /usr/lib/arm-linux-gnueabihf

ln -s libmmal_core.so.0 libmmal_core.so

ln -s libmmal_util.so.0 libmmal_util.so

ln -s libmmal_vc_client.so.0 libmmal_vc_client.so

ln -s libbcm_host.so.0 libbcm_host.so

ln -s libvcsm.so.0 libvcsm.so

ln -s libvchiq_arm.so.0 libvchiq_arm.so

ln -s libvcos.so.0 libvcos.so

sudo curl -sSfLO 'https://raw.githubusercontent.com/raspberrypi/firmware/master/opt/vc/lib/libbrcmEGL.so'

sudo curl -sSfLO 'https://raw.githubusercontent.com/raspberrypi/firmware/master/opt/vc/lib/libbrcmGLESv2.so'

sudo curl -sSfLO 'https://raw.githubusercontent.com/raspberrypi/firmware/master/opt/vc/lib/libopenmaxil.so'

## Need to comment out:
#dtoverlay=vc4-kms-v3d 
in /boot/config.txt

