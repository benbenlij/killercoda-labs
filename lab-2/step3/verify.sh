#!/bin/bash

if [ -n "$(ls -A /home/investigator/Downloads)" ]; then
    echo "Remember to rename and move the download"
    exit 1
elif [ -z "$(ls -A /path/to/dir)" ]; then
    echo "Make sure to move the download to the quarantine diredctory"
    exit 1
elif [[ ! -f "/path/to/file1.txt" || ! -f "/path/to/file2.txt" ]]; then
    echo "You must have the original file and its backup"
    exit 1
else
    echo "Well Done!!"
    exit 0
fi