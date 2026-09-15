#!/usr/bin/env bash

echo "=================================="
echo "        System Information        "
echo "=================================="
echo

hostname=$(hostname)
os=$(uname)
kernal=$(uname -s)
cpu=$(top -bn1 | awk -F "id," '/Cpu/ {print $1}' | awk -F "," '{print 100-$NF}')
mem=$(free -m | awk ' /Mem:/ {printf "%.2f\n", $3/$2*100}')
disk=$(df -h | awk ' /C:\\/  { print $5}')
uptime=$(uptime -p | awk '{sub(/^up /, ""); print $0}')
ip=$(hostname -I)

printf "%-12s: %s\n" "Host" "$hostname"
printf "%-12s: %s\n" "OS" "$os"
printf "%-12s: %s\n" "Kernal" "$kernal"
printf "%-12s: %s\n" "CPU Usage" "$cpu"
printf "%-12s: %s\n" "Memory Usage" "$cpu"
printf "%-12s: %s\n" "Disk Usage" "$disk"
printf "%-12s: %s\n" "Uptime" "$uptime"
printf "%-12s: %s\n" "IP Address" "$ip"

echo
echo "=================================="
