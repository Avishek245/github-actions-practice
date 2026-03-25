#!/bin/bash

echo "===== SYSTEM HEALTH REPORT ====="

echo "Date: $(date)"
echo "Hostname: $(hostname)"

# Check disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "Disk usage is too high!"
  exit 1
fi

echo "Disk usage is normal"

echo "Health check passed successfully!"
exit 0