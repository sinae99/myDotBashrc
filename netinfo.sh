#!/bin/bash

echo "=== NETWORK INTERFACES & IPs ==="
ip -brief a
echo

echo "=== ROUTING TABLE ==="
ip route
echo

echo "=== FIREWALL RULES ==="
if command -v ufw >/dev/null; then ufw status verbose; fi
if command -v firewall-cmd >/dev/null; then firewall-cmd --list-all; fi
echo

echo "=== ACTIVE CONNECTIONS (top 20) ==="
netstat -tunap | head -n 20 2>/dev/null
echo

echo "=== ESSENTIAL LISTENING PORTS & SERVICES ==="
printf "%-7s %-7s %-7s %-20s\n" "PROTO" "PORT" "PID" "PROCESS"

# Only show unique listening TCP/UDP ports with PID & process
ss -tulnp 2>/dev/null | tail -n +2 | awk '
{
    split($5,a,":");
    port=a[length(a)];
    if($1 && port && $6 != "-") print $1, port, $6
}' | sort -u | while read proto port pid; do
    pname=$(ps -p ${pid//,*} -o comm= 2>/dev/null)
    printf "%-7s %-7s %-7s %-20s\n" "$proto" "$port" "$pid" "$pname"
done

