#!/bin/bash

RECORDED_FILE_NAME=${BROWSER:-record}

Xvfb $DISPLAY -ac -screen 0 ${RESOLUTION}x24 >& /tmp/Xvfb.log &
sleep 1 && fluxbox >& /tmp/fluxbox.log &
sleep 1 && x11vnc >& /tmp/x11vnc.log &
sleep 1 && ffmpeg -f x11grab -video_size $RESOLUTION -i $DISPLAY -codec:v libx264 -r 12 -y "${VIDEO_DIRECTORY}/${RECORDED_FILE_NAME}.mkv" >& /tmp/ffmpeg.log &
sleep 1 && exec "$@"