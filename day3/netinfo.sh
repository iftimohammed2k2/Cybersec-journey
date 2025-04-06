#!/data/data/com.termux/files/usr/bin/bash

echo "====== Network Identity Report ======"

# Public IP Address
echo "[+] Public IP Address: $(curl -s https://ipinfo.io/ip)"

# Check if on Wi-Fi before trying to get info
echo "[+] Checking Wi-Fi Info..."
WIFI_INFO=$(termux-wifi-connectioninfo)

if echo "$WIFI_INFO" | grep -q "SSID"; then
  echo "[+] Wi-Fi Info:"
  echo "$WIFI_INFO" | jq '.'
else
  echo "[-] Wi-Fi Info not available or you are not connected to Wi-Fi."
fi

# DNS Server
echo "[+] DNS Server: $(getprop net.dns1)"

# Hostname
echo "[+] Hostname: $(getprop net.hostname)"

echo "====== Done ======"
