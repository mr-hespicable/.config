#!/usr/bin/env bash

current_governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
current_temp=$(sensors | grep Package | awk '{print $2}' | sed 's/+//')
cpu_ppt=$(sudo s-tui -j | grep package-0 | awk '{print $2}' | sed 's/"//g' | sed 's/,//')

notify-send -i $HOME/.local/bin/icons/notifications/alert.png "Ryzen 7 5800X" "${currenunicode gpu symbol`t_temp}, ${cpu_ppt}W, $current_governor governor"
