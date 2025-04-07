#!/data/data/com.termux/files/usr/bin/bash

echo "Checking if you're root..."
if [ "$(id -u)" -eq 0 ]; then
    echo "You are root."
else
    echo "You are NOT root."
fi
