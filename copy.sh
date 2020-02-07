#! /bin/sh
OPEN="/home/kirby/raw/get.txt"
KERAS="/home/kirby/keras-yolo/raw/"
KERAS2="/home/kirby/keras-yolo/raw/"
CON=1
while true ; do

  if [ -e $OPEN ]; then
      sleep 4
sudo cp /home/kirby/raw/* /home/kirby/keras-yolo/raw << EOF
kirby
EOF

sudo chown -R kirby /home/kirby/keras-yolo/raw << EOF
kirby
EOF

sudo chmod -R 777 /home/kirby/keras-yolo/raw << EOF
kirby
EOF
rm /home/kirby/keras-yolo/raw/get.txt
ls $KERAS
      if [ -e $KERAS ]; then
        while true ; do
          if [ -e $KERAS$CON.jpg ]; then

            cd  /home/kirby/keras-yolo/
            echo $CON
            python3 /home/kirby/keras-yolo/yolo_video.py --image -img raw/$CON.jpg
            rm /home/kirby/keras-yolo/raw/$CON.jpg
            mv /home/kirby/keras-yolo/tmp/tmp.jpg /home/kirby/keras-yolo/tmp/$CON.jpg
            echo `expr $CON + 1`
            CON=`expr $CON + 1`
          else
            break
          fi
        done
      fi

sudo rm /home/kirby/raw/* << EOF
kirby
EOF

      rm /home/kirby/keras-yolo/raw/*

sudo cp /home/kirby/keras-yolo/tmp/*  /mnt/windows/mirai/ << EOF
kirby
EOF

rm /home/kirby/keras-yolo/tmp/*

CON=1
  fi
  echo "nothing"
  sleep 5
done

