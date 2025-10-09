#!/bin/bash

echo "=== RUNNING SERVICES ==="
# List all active services
systemctl list-units --type=service --state=running --no-pager | awk '{print $1, $4}'
echo

echo "=== SERVICES ENABLED ON BOOT ==="
systemctl list-unit-files --type=service | grep enabled
echo

echo "=== LISTENING PORTS & SERVICE MAPPING ==="
ss -tulnp | awk 'NR>1 {print $1, $5, $7}' | column -t
echo

