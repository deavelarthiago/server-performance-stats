#!/bin/bash

# server-stats.sh - Basic server performance analysis

echo "=== Server Stats ==="

# OS Version
echo -e "\nOS Version:"
cat /etc/os-release | grep -E "^PRETTY_NAME=" | cut -d= -f2 | tr -d '"'

# Uptime
echo -e "\nUptime:"
uptime -p

# Load Average
echo -e "\nLoad Average (1, 5, 15 min):"
uptime | awk -F'load average:' '{ print $2 }'

# Logged in Users
echo -e "\nLogged-in Users:"
who | awk '{print $1}' | sort | uniq -c

# CPU Usage
echo -e "\nTotal CPU Usage (%):"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2+$4 "%", "Idle: " $8 "%"}'

# Memory Usage
echo -e "\nTotal Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2 }'

# Disk Usage
echo -e "\nTotal Disk Usage:"
df -h --total | grep "total" | awk '{printf "Used: %s (%s), Free: %s\n", $3, $5, $4}'

# Top 5 processes by CPU usage
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Stretch Goal: Failed Login Attempts (optional)
echo -e "\nFailed Login Attempts:"
grep "Failed password" /var/log/auth.log 2>/dev/null | wc -l || echo "Log file not found or no failed attempts recorded."

echo -e "\n=== End of Stats ==="
