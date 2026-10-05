#!/bin/bash

FILE_PATH="/home/investigator/Desktop/Forensics Question 1.txt"

# Check if file exists
if [[ ! -f "$FILE_PATH" ]]; then
    exit 1
fi

# Read and compare answer
user_answer=$(sed -nE 's/.*ANSWER:[[:space:]]*(.*)/\1/p' "$FILE_PATH")
user_answer=$(echo "$user_answer" | xargs | tr '[:upper:]' '[:lower:]')

if [[ "$user_answer" == "david" ]]; then
    exit 0
else 
    exit 1
fi