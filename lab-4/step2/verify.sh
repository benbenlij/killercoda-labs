#!/bin/bash

if dpkg -s "nmap" &> /dev/null; then
    exit 1
fi

exit 0