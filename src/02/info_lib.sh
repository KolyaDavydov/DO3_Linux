#!/bin/bash

function info {
    echo 'HOSTNAME = '$(hostname)
    echo 'TIMEZONE = '$(cat /etc/timezone) $(date -u +%Z) $(date +%:::z)
    echo 'USER = '$(whoami)
    echo 'OS = '$(awk '{print $1, $2, $3}' /etc/issue)
    echo 'DATE = '$(date +"%d %b %Y %T")
    echo 'UPTIME = '$(uptime -p)
    echo 'UPTIME_SEC = '$(awk '{print $1}' /proc/uptime)
    echo 'IP = '$(hostname -I)
    echo 'MASK = '$(ifconfig | grep $(hostname -I) | awk '{print $4}')
    echo 'GATEWAY = '$(ip r | grep default | awk '{print $3}')
    echo 'RAM_TOTAL = '$(free -tm | grep Total: | awk '{printf "%.3f GB", $2/1024}')
	echo 'RAM_USED = '$(free -tm | grep Total: | awk '{printf "%.3f GB", $3/1024}')
	echo 'RAM_FREE = '$(free -tm | grep Total: | awk '{printf "%.3f GB", $4/1024}')
    echo 'SPACE_ROOT = '$(df -k | grep "\/$" | awk '{printf "%.2f\n MB", $2/1024}')
	echo 'SPACE_ROOT_USED = '$(df -k | grep "\/$" | awk '{printf "%.2f\n MB", $3/1024}')
	echo 'SPACE_ROOT_FREE = '$(df -k | grep "\/$" | awk '{printf "%.2f\n MB", $4/1024}')

}