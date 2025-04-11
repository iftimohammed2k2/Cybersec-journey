#!/data/data/com.termux/files/usr/bin/bash
# Termux-safe network scan script

# Ask user for network to scan
read -p "Enter network/subnet to scan (e.g., 192.168.1.0/24): " network

# Create a timestamp for the output file
timestamp=$(date +"%Y%m%d_%H%M%S")

# Define output file
output_file="nmap_scan_$timestamp.txt"

# Start message
echo "Starting network scan on $network..."
echo "Results will be saved in $output_file"

# Step 1: Ping Scan to find live hosts
echo "[*] Discovering live hosts..."
nmap -sn "$network" -oG - | awk '/Up$/{print $2}' > live_hosts.txt

# Step 2: Loop through each live host
echo "[*] Starting detailed scan on live hosts..."
for ip in $(cat live_hosts.txt); do
  echo "[+] Scanning $ip" | tee -a "$output_file"

  nmap -A -T4 "$ip" | tee -a "$output_file"

  echo "-------------------------------------------" >> "$output_file"
done

# Cleanup temporary file
rm -f live_hosts.txt

# Finish
echo "[*] Scan completed! Check $output_file for results."
