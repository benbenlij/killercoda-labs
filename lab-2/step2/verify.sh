#!/bin/bash

# Verify new file
if [[ ! -f "/home/investigator/compromised_services.log" ]]; then
    exit 1
fi

# Verify removed image
if [[ ! -f "/home/investigator/unauthorized_image.jpg" ]]; then
    exit 0
else 
    exit 1
fi