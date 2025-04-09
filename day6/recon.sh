#!/bin/bash

echo "Enter target domain (with https:// or http://):"
read domain

echo "Generating Recon Report for $domain"

mkdir -p ReconReports
timestamp=$(date +%Y%m%d_%H%M%S)
output_dir="ReconReports/${domain//[:\/]/_}_$timestamp"

# WHOIS and NSLOOKUP
output_txt="${output_dir}_report.txt"
mkdir -p "$output_dir"

echo "===== WHOIS =====" > "$output_txt"
whois "${domain#*//}" >> "$output_txt"

echo -e "\n===== NSLOOKUP =====" >> "$output_txt"
nslookup "${domain#*//}" >> "$output_txt"

# Photon
echo -e "\n===== Photon Scan (URLs only) =====" >> "$output_txt"
cd Photon || exit
python3 photon.py -u "$domain" -o "../$output_dir" -l 2 --only-urls >> "../$output_txt"
cd ..

echo "Recon report saved to $output_txt"
echo "Photon full scan saved to $output_dir"
