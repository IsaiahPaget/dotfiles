#!/bin/bash

# List processes and use rofi to select one to kill
ps -e -o pid,comm --sort=comm | tail -n +2 | \
    rofi -dmenu -i -p "Kill" | \
    awk '{print $1}' | \
    xargs -r kill
