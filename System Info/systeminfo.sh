#!/usr/bin/env bash

echo "====System Information===="

hostname=$(hostname)
os=$(uname)
kernal=$(uname -s)
cpu=$(top -bn1 | awk -F "id," '/Cpu/ {print $1}' | awk -F "," '{print 100-$NF}')
mem=$(free -m | awk ' /Mem:/ {printf "%.2f\n", $3/$2*100}')

echo "host $hostname"
echo "os $os"
echo "kernal $kernal"
echo "Cpu% $cpu"
echo "Mem% $mem"
