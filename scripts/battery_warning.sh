#!/bin/bash
bat_files="/sys/class/power_supply/BAT0"
bat_status=$(cat ${bat_files}/status)
capacity=$(cat "${bat_files}/capacity")
if [[ ${bat_status}=="Discharging" && ${capacity} -ge 20 ]]; then
    echo "Battery alert - ${capacity}%"
    notify-send \
        "Low battery" \
        "Only ${capacity}% battery remaining"
fi
