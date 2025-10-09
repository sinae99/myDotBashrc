#!/bin/bash
# sysinfo.sh - Complete system overview

echo "=== HOST & OS INFO ==="
hostnamectl
echo
echo "=== UPTIME & LOAD ==="
uptime
echo
echo "=== MEMORY USAGE ==="
free -h
echo
echo "=== DISK USAGE & INODES ==="
df -hT
echo
echo "=== LOGGED-IN USERS ==="
who
echo
echo "=== LAST BOOT ==="
who -b
echo
echo "=== SYSTEM TIMELINE (last 5 reboots) ==="
last -x | head -n 10
