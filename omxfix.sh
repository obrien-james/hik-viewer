
#! /bin/bash
##########################################################
## Created by James O'Brien                             ##
## Date Created 11/01/2022                              ##
## OMXPlay fix.                                         ##
##########################################################

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
