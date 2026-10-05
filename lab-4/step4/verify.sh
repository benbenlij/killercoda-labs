#!/bin/bash

cd /home/investigator/Desktop
files=("Q1" "Q2" "Q3")
answers=("/root/secrets.txt" "/home/jeramiah/random_data.bin" "/var/tmp/diary.txt")

for i in "${!files[@]}"; do
    # Check if file exists
    if [[ ! -f "${files[$i]}" ]]; then
        exit 1
    fi

    # Read and compare answer
    user_answer=$(sed -nE 's/.*Answer:[[:space:]]*(.*)/\1/p' "${files[$i]}")
    user_answer=$(echo "$user_answer" | xargs | tr '[:upper:]' '[:lower:]')

    if [[ ! "$user_answer" == "${answers[$i]}" ]]; then
        exit 1
    fi
done

exit 0