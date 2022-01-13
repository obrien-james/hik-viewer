#! /bin/bash
#####################################################
## Created by James O'Brien                        ##
## Date Created 28/12/18                           ##
## Script to run Hikvision streams on Raspberry Pi ##
##  - Service file - controls start/stop/reload    ##
#####################################################

##Output script to console
#set -x

##Read config file
. cameras.config

##Quit script now, if started as autorun:
if [ "$2" = "auto" ]; then
	if [ "$AUTORUN" = "0" ]; then
		echo "Quitting ..."
		exit 0
	fi
fi

## Get preset string
PRESET=PRESET${DISPAYPRESET}
STREAMSTRING=${!PRESET}

AUDIO=AUDIO${AUDIOPRESET}
AUDIOSTRING=${!AUDIO}

STREAMCOUNT="$(cut -d':' -f2 <<<"$STREAMSTRING" | cut -d'|' -f1)"

##  Calculate screen size and display based on number of streams to display
case "$STREAMCOUNT" in
1)
	WIN1='0 0 '"$WIDTH"' '"$HEIGHT"
	;;
4)
	WIN1='0 0 '"$((WIDTH/2))"' '"$((HEIGHT/2))"
	WIN2="$((WIDTH/2))"' 0 '"$WIDTH"' '"$((HEIGHT/2))"
	WIN3='0 '"$((HEIGHT/2))"' '"$((WIDTH/2))"' '"$HEIGHT"
	WIN4="$((WIDTH/2))"' '"$((HEIGHT/2))"' '"$WIDTH"' '"$HEIGHT"
	;;

6)
	WIN1='0 0 '"$(((WIDTH/3) * 2))"' '"$(((HEIGHT/3) * 2))"

        WIN2="$(((WIDTH/3) * 2))"' 0 '"$WIDTH"' '"$((HEIGHT/3))"
        WIN3="$(((WIDTH/3) * 2))"' '"$((HEIGHT/3))"' '"$WIDTH"' '"$(((HEIGHT/3) * 2))"

        WIN4='0 '"$(((HEIGHT/3) * 2))"' '"$((WIDTH/3))"' '"$HEIGHT"
        WIN5="$((WIDTH/3))"' '"$(((HEIGHT/3) * 2))"' '"$(((WIDTH/3) * 2))"' '"$HEIGHT"
        WIN6="$(((WIDTH/3) * 2))"' '"$(((HEIGHT/3) * 2))"' '"$WIDTH"' '"$HEIGHT"
	;;

8)
        WIN1='0 0 '"$(((WIDTH/4) * 3))"' '"$(((HEIGHT/4) * 3))"

        WIN2="$(((WIDTH/4) * 3))"' 0 '"$WIDTH"' '"$((HEIGHT/4))"
        WIN3="$(((WIDTH/4) * 3))"' '"$((HEIGHT/4))"' '"$WIDTH"' '"$(((HEIGHT/4) * 2))"
        WIN4="$(((WIDTH/4) * 3))"' '"$(((HEIGHT/4) * 2))"' '"$WIDTH"' '"$(((HEIGHT/4) * 3))"

        WIN5='0 '"$(((HEIGHT/4) * 3))"' '"$((WIDTH/4))"' '"$HEIGHT"
        WIN6="$((WIDTH/4))"' '"$(((HEIGHT/4) * 3))"' '"$(((WIDTH/4) * 2))"' '"$HEIGHT"
        WIN7="$(((WIDTH/4) * 2))"' '"$(((HEIGHT/4) * 3))"' '"$(((WIDTH/4) * 3))"' '"$HEIGHT"
        WIN8="$(((WIDTH/4) * 3))"' '"$(((HEIGHT/4) * 3))"' '"$WIDTH"' '"$HEIGHT"
	;;

9)
	WIN1='0 0 '"$((WIDTH/3))"' '"$((HEIGHT/3))"
        WIN2="$((WIDTH/3))"' 0 '"$(((WIDTH/3) * 2))"' '"$((HEIGHT/3))"
        WIN3="$(((WIDTH/3) * 2))"' 0 '"$WIDTH"' '"$((HEIGHT/3))"

	WIN4='0 '"$((HEIGHT/3))"' '"$((WIDTH/3))"' '"$(((HEIGHT/3) * 2))"
        WIN5="$((WIDTH/3))"' '"$((HEIGHT/3))"' '"$(((WIDTH/3) * 2))"' '"$(((HEIGHT/3) * 2))"
        WIN6="$(((WIDTH/3) * 2))"' '"$((HEIGHT/3))"' '"$WIDTH"' '"$(((HEIGHT/3) * 2))"

	WIN7='0 '"$(((HEIGHT/3) * 2))"' '"$((WIDTH/3))"' '"$HEIGHT"
        WIN8="$((WIDTH/3))"' '"$(((HEIGHT/3) * 2))"' '"$(((WIDTH/3) * 2))"' '"$HEIGHT"
        WIN9="$(((WIDTH/3) * 2))"' '"$(((HEIGHT/3) * 2))"' '"$WIDTH"' '"$HEIGHT"
	;;
esac

## Service commands - start, stop, reload (restarts entire service), restart (restars specific sream)
case "$1" in
start)
	## Starts camera streams from scratch
	echo "starting"
	case "$STREAMCOUNT" in
	1)
                B="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN1" "${!B}" "$C" "HIK-Stream-1"
		;;
	4)
		B="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f1)"
		C="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f2)"
		. startcamera.sh "$DIS" "$WIN1" "${!B}" "$C" "HIK-Stream-1"
		B="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f2)"
		. startcamera.sh "$DIS" "$WIN2" "${!B}" "$C" "HIK-Stream-2"
		B="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN3" "${!B}" "$C" "HIK-Stream-3"
		B="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN4" "${!B}" "$C" "HIK-Stream-4"
		;;
	6)
		B="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN1" "${!B}" "$C" "HIK-Stream-1"
                B="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN2" "${!B}" "$C" "HIK-Stream-2"
                B="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN3" "${!B}" "$C" "HIK-Stream-3"
                B="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN4" "${!B}" "$C" "HIK-Stream-4"
                B="$(cut -d'|' -f6 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f6 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN5" "${!B}" "$C" "HIK-Stream-5"
                B="$(cut -d'|' -f7 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f7 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN6" "${!B}" "$C" "HIK-Stream-6"
		;;
	8)
		B="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f2)"
		. startcamera.sh "$DIS" "$WIN1" "${!B}" "$C" "HIK-Stream-1"
		B="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f1)"
		C="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f2)"
		. startcamera.sh "$DIS" "$WIN2" "${!B}" "$C" "HIK-Stream-2"
		B="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f1)"
		C="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN3" "${!B}" "$C" "HIK-Stream-3"
                B="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN4" "${!B}" "$C" "HIK-Stream-4"
                B="$(cut -d'|' -f6 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f6 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN5" "${!B}" "$C" "HIK-Stream-5"
                B="$(cut -d'|' -f7 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f7 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN6" "${!B}" "$C" "HIK-Stream-6"
                B="$(cut -d'|' -f8 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f8 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN7" "${!B}" "$C" "HIK-Stream-7"
                B="$(cut -d'|' -f9 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f9 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN8" "${!B}" "$C" "HIK-Stream-8"
		;;
	9)
		B="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f2 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN1" "${!B}" "$C" "HIK-Stream-1"
                B="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f3 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN2" "${!B}" "$C" "HIK-Stream-2"
		B="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f4 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN3" "${!B}" "$C" "HIK-Stream-3"
		B="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f5 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN4" "${!B}" "$C" "HIK-Stream-4"
                B="$(cut -d'|' -f6 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f6 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN5" "${!B}" "$C" "HIK-Stream-5"
                B="$(cut -d'|' -f7 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f7 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN6" "${!B}" "$C" "HIK-Stream-6"
		B="$(cut -d'|' -f8 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f8 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN7" "${!B}" "$C" "HIK-Stream-7"
                B="$(cut -d'|' -f9 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f9 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN8" "${!B}" "$C" "HIK-Stream-8"
                B="$(cut -d'|' -f10 <<<"$STREAMSTRING" | cut -d':' -f1)"
                C="$(cut -d'|' -f10 <<<"$STREAMSTRING" | cut -d':' -f2)"
                . startcamera.sh "$DIS" "$WIN9" "${!B}" "$C" "HIK-Stream-9"
		;;
	esac
	echo "starting audio"
	D="$(cut -d'|' -f2 <<<"$AUDIOSTRING" | cut -d':' -f1)"
        E="$(cut -d':' -f2 <<<"$AUDIOSTRING" | cut -d':' -f2)"
	. startaudio.sh "$DIS" "${!D}" "$E" "HIK-Audio-Stream"
	;;
stop)
	## Stops camera streams
	killall screen
	;;

reload)
	## Used if change preset configuration - stop then start
	killall screen
	./hik.sh start
	;;

restart)
	## Checks that all streams are running as they should - if not restarts specific stream. 
	for i in $(eval echo "{1..$STREAMCOUNT}")
	do
		ST=$(screen -list | grep "HIK-Stream-${i}"|cut -d'.' -f2|cut -d$'\t' -f1)
		if [ "$ST" != "HIK-Stream-""$i" ]; then
			echo "Stream ""$i"" is not wokring - reload"
			#Restart stream
			B="$(cut -d'|' -f""$((i + 1)) <<<"$STREAMSTRING" | cut -d':' -f1)"
                	C="$(cut -d'|' -f""$((i + 1)) <<<"$STREAMSTRING" | cut -d':' -f2)"
			W="WIN$i"
                	. startcamera.sh "$DIS" "${!W}" "${!B}" "$C" "HIK-Stream-""$i"
		fi
	done
	if ["${AUDIOPRESET}" != 0]; then
		AS=$(screen -list | grep "HIK-Audio-Stream"|cut -d'.' -f2|cut -d$'\t' -f1)
		if [ "$AS" != "HIK-Audio-Stream" ]; then
			echo "Audio stream not working"
			echo "restarting audio"
			D="$(cut -d'|' -f2 <<<"$AUDIOSTRING" | cut -d':' -f1)"
			E="$(cut -d':' -f2 <<<"$AUDIOSTRING" | cut -d':' -f2)"
			. startaudio.sh "$DIS" "${!D}" "$E" "HIK-Audio-Stream"
		fi
	fi
	;;
esac

