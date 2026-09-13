#!/bin/bash

FILE_PATH = "/home/investigator/Desktop/Forensics Question 1.txt"

# Check if file exists
if [[ ! -f "$FILE_PATH" ]]; then
    echo "Uh oh! You deleted the forensics question file."
    exit 1
fi

# Read and compare answer
if [[ $(cat "$FILE_PATH") =~ ANSWER:[[:space:]]*(.*) ]]; then
    user_answer = "${BASH_REMATCH[1]}"
    user_answer = $(echo "$user_answer" | xargs | tr '[:upper:]' '[:lower:]')
    if [[ "$user_answer" == "david"]]; then
        echo "Correct!"
        exit 0
    else 
        echo "Incorrect"
        exit 1
    fi
else
    echo "No line starting with 'ANSWER'."
    exit 0
fi