#!/data/data/com.termux/files/usr/bin/bash

while true
do 
     if ping -c 1 google.com > /dev/null 2>&1; then


      echo "Internet is up" 
  else 
      echo "Internet is down"

  fi
  sleep 10
done
