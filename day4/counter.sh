#!/data/data/com.termux/files/usr/bin/bash

count=1
while [ $count -le 5 ]
do
    echo "Count: $count"
    count=$((count + 1))
    sleep 1
done
