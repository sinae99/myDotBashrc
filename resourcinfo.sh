#!/bin/bash


echo "=== CPU USAGE ==="
top -b -n1 | head -n5
echo

echo "=== MEMORY USAGE ==="
free -h
echo

echo "=== DISK USAGE ==="
df -h --total | grep -v tmpfs
echo

echo "=== I/O STATS (top 5 devices) ==="
iostat -x 1 1 | awk 'NR>6 {print $1, $3, $4, $5}' | head -n5
echo

echo "=== TOP 5 MEMORY-CONSUMING PROCESSES ==="
ps -eo pid,comm,%mem --sort=-%mem | head -n6
echo

echo "=== TOP 5 CPU-CONSUMING PROCESSES ==="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n6
echo
