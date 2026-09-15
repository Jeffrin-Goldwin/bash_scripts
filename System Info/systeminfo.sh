#!/usr/bin/env bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RESET='\033[0m'

echo -e "${CYAN}==================================${RESET}"
echo -e "${GREEN}        System Information${RESET}"
echo -e "${CYAN}==================================${RESET}"
echo

hostname=$(hostname)
os=$(uname)
kernal=$(uname -s)
cpu=$(top -bn1 | awk -F "id," '/Cpu/ {print $1}' | awk -F "," '{print 100-$NF}')
mem=$(free -m | awk ' /Mem:/ {printf "%.2f\n", $3/$2*100}')
disk=$(df -h | awk ' /C:\\/  { print $5}')
uptime=$(uptime -p | awk '{sub(/^up /, ""); print $0}')
ip=$(hostname -I)

printf "${YELLOW}%-12s${RESET}: ${WHITE}%s${RESET}\n" "Host" "$hostname"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s${RESET}\n" "OS" "$os"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s${RESET}\n" "Kernel" "$kernal"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s%%${RESET}\n" "CPU Usage" "$cpu"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s%%${RESET}\n" "Memory Usage" "$mem"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s${RESET}\n" "Disk Usage" "$disk"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s${RESET}\n" "Uptime" "$uptime"
printf "${YELLOW}%-12s${RESET}: ${WHITE}%s${RESET}\n" "IP Address" "$ip"

echo
echo -e "${CYAN}==================================${RESET}"
