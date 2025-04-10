#!/bin/bash

# This script finds world-writable files and gives you a chance to fix them
# It logs everything and includes audit mode for safe usage

# Create log directory
mkdir -p FileAuditLogs

# Log file with timestamp
log_file="FileAuditLogs/permissions_$(date +%Y%m%d_%H%M%S).log"

# Set audit mode (true = preview only, false = apply changes)
audit_mode=true

# Title for logging
echo "===== File Permission Audit Started at $(date) =====" >> "$log_file"

# Find all world-writable files (could be risky if exposed)
echo "Scanning for world-writable files..." | tee -a "$log_file"
files=$(find / -type f -perm -002 2>/dev/null)

# Loop through found files
for file in $files; do
  echo "[!] Found world-writable: $file" | tee -a "$log_file"
  
  if [ "$audit_mode" = false ]; then
    # Change permission to owner read/write only for safety
    chmod 600 "$file"
    echo "[+] Fixed permissions for: $file" | tee -a "$log_file"
  else
    echo "[AUDIT] No changes made. Preview only." | tee -a "$log_file"
  fi
done

# Footer for log
echo "===== Audit Completed at $(date) =====" >> "$log_file"

# Final message
if [ "$audit_mode" = true ]; then
  echo "Audit complete. No changes were made. View log: $log_file"
else
  echo "Permissions fixed. View log: $log_file"
fi
