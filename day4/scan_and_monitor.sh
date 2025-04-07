#!/data/data/com.termux/files/usr/bin/bash

# Define target
TARGET="google.com"
PORTS=(22 80 443 3306)

# Create log file
LOGFILE="scan_log.txt"
echo "Scan started on $(date)" > $LOGFILE

# Internet check
if ping -c 1 $TARGET > /dev/null 2>&1; then
    echo "[+] Internet is up" | tee -a $LOGFILE
else
    echo "[!] Internet is down" | tee -a $LOGFILE
fi

# Port scan loop
for port in "${PORTS[@]}"
do
    timeout 1 bash -c "</dev/tcp/$TARGET/$port" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "[+] Port $port is open on $TARGET" | tee -a $LOGFILE
    else
        echo "[-] Port $port is closed on $TARGET" | tee -a $LOGFILE
    fi
done

echo "Scan completed on $(date)" >> $LOGFILE
