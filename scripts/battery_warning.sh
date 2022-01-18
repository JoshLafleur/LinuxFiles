#!/bin/bash
bat_files="/sys/class/power_supply/BAT0"
bat_status=$(/bin/cat ${bat_files}/status)
capacity=$(/bin/cat "${bat_files}/capacity")
if [[ ${bat_status}=="Discharging" && ${capacity} -le 20 && ${capacity} -gt 10 ]]; then
    env DISPLAY=:0.0 sudo -u josh /usr/bin/libnotify-notify-send \
        -t 5000 "Low battery" \
        "Only ${capacity}% battery remaining"
elif [[ ${bat_status}=="Discharging" && ${capacity} -le 10 ]]; then
    env DISPLAY=:0.0 sudo -u josh /usr/bin/libnotify-notify-send \
        -t 60000 -u critical "Low battery" \
        "Only ${capacity}% battery remaining"
fi
