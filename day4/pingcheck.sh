#!/data/data/com.termux/files/usr/bin/bash

echo "Pinging google.com..."
ping -c 4 google.com > pinglog.txt

echo "Done! output saved to pinglog.txt"
# check the output by command cat pinglog.txt
