#!/bin/bash

# This script performs OSINT reconnaissance using photon

# IT creates reports only if the domain is in the whitelist

# prompt user to enter a domain

echo "enter target domain:"
read domain

# set a list of approved domains (ethical use only! 

whitelist=("example.com" "testsite.org" "yourcompany.com") #Add your allowed domains here

# function to check if domain is in whitelist
is_whitelisted=false
for d in "${whitelist[@]}"; do
  if [[ "$domain" == "$d" ]]; then
    is_whitelisted=true
    break
  fi
done

#Exit if the domain is not allowed
if [[ "$is_whitelisted" = false ]];
then
  echo "Domain not whitelisted. Exiting for ethical compliance."
  exit 1
fi

# Create ReconReports folder if it doesn't exist
mkdir -p ReconReports

# create output files name
output="ReconReports/${domain}_photon_report.txt"

# Run photon and save the output
echo "Running Photon on $domain..."
mkdir -p photon_output

# Use Photon to gather information and store it in the specified folder

python3 photon/photon.py -u https://$domain -o photon_output -d 1 -t 5

# Save result summary
echo "===== Photon Report for $domain =====" > "$output"
cat photon_output/$domain/urls.txt >> "$output" 2>/dev/null

# Inform user
echo "Photon recon reports saved to $output"
