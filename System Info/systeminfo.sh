#!/usr/bin/env bash

echo "====System Information===="

hostname=$(hostname)
os=$(uname)
kernal=$(uname -s)
cpu=$(top -bn1 | awk -F "id," '/Cpu/ {print $1}' | awk -F "," '{print 100-$NF}')

echo "host $hostname"
echo "os $os"
echo "kernal $kernal"
echo "CPU% $cpu"
