#!/bin/bash

admins=("ubuntu" "investigator" "john" "catherine" "stanley")

for admin in "${admins[@]}"; do
    if ! id -nG "$admin" | grep -qw "sudo"; then
        exit 1
    fi
done

if id -nG "michael" | grep -qw "sudo"; then
        exit 1
fi

exit 0