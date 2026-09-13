#!/bin/bash

# Verify new file
if [[ ! -f "/home/investigator/compromised_services.log" ]]; then
    echo "Make sure to add the new file and remove the image."
    exit 1
fi

# Verify removed image
if [[ ! -f "/home/investigator/unauthorized_image.jpg" ]]; then
    echo "Good job!"
    exit 0
else 
    echo "Make sure to add the new file and remove the image."
    exit 1
fi