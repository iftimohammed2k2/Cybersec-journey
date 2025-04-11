#!/data/data/com.termux/files/usr/bin/bash

#This miniproject will : scan a network range,Identify live hosts,perform a detailed scan on each host,save results in a log file


network="192.168.1.0/24" #Editable

timestamp=$(date +"%Y%m%d_%H%M%S")

output_file="nmap_scan_$timestamp.txt"

echo "starting network scan on $network..."
echo "Results will be saved in $output_file"

echo "[*] Discovering live hosts..."
nmap -sn $network -oG - | awk ' /Up$/{print $2}' > live_hosts.txt

echo "[*] Starting detailed scan on live hosts..."
for ip in $(cat live_hosts.txt); do 
  echo "[+] Scanning $ip" | tee -a $output_file

  nmap -A -T4 $ip | tee -a $output_file 
  echo 
"--------------------------------" >> $output_file
done

rm live_hosts.txt

echo "[*] Scan completed! check $output_file for results."

