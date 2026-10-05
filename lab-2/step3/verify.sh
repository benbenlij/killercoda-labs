#!/bin/bash

if [ -n "$(ls -A /home/investigator/Downloads)" ]; then
    exit 1
elif [ -z "$(ls -A /home/investigator/quarantine)" ]; then
    exit 1
elif [[ ! -f "/home/investigator/critical_info.txt" || ! -f "/home/investigator/critical_info.backup" ]]; then
    exit 1
else
    exit 0
fi