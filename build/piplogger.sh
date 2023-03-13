#!/bin/bash
# Delete logs over 30 days old
find '/piplogger/logs' -mtime +30 -exec rm {} \

# Get the egress public ip and if it's changes log output to a dated log file
prev=""
while true; do
    logdate=$(date +%Y-%m-%d)
    cur=$(curl -sS https://ipinfo.io)
    if [ "$prev" != "$cur" ]; then
        prev="$cur"
        echo "$(date)
$cur" | tee -a /piplogger/logs/$logdate.txt
        fi
        sleep 90
done