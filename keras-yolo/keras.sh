#!/bin/sh
OPEN="/home/kirby/cloud/kirby/files/Documents/*"
STORE="/mnt/windows/mirai/"
KERAS="/home/kirby/keras-yolo/raw/"
CON=1

cd /home/kirby/keras-yolo/

while true ; do
if [ -e $OPEN ]; then
  sleep 4

  cp $OPEN /home/kirby/keras-yolo/raw/
  rm $OPEN

  if [ -e $KERAS ]; then
    cd /home/kirby/keras-yolo/
    chown -R kirby:kirby /home/kirby/keras-yolo/raw
    chown -R kirby:kirby /home/kirby/keras-yolo
    while true ; do
      if [ -e $KERAS ]; then
        su - kirby -c 'python3 /home/kirby/keras-yolo/yolo_video.py --image -img /home/kirby/keras-yolo/raw/1.jpg'
        mv /home/kirby/keras-yolo/tmp/tmp.jpg /home/kirby/keras-yolo/tmp/$CON.jpg
        rm /home/kirby/keras-yolo/raw/$CON.jpg
        echo `expr $CON + 1`
      fi
    done
  fi



  cp /home/kirby/keras-yolo/tmp/* $STORE
  rm /home/kirby/keras-yolo/tmp/*
fi
echo "nothing"
sleep 5

done
