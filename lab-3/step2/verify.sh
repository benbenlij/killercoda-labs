#!/bin/bash

JOHN_BAD_HASH=$(awk -F: '$1=="john" {print $2}' /var/tmp/.bad-hashes)
STANLEY_BAD_HASH=$(awk -F: '$1=="stanley" {print $2}' /var/tmp/.bad-hashes)

JOHN_CURRENT_HASH=$(awk -F: '$1=="john" {print $2}' /etc/shadow)
STANLEY_CURRENT_HASH=$(awk -F: '$1=="stanley" {print $2}' /etc/shadow)

if [[ "$JOHN_BAD_HASH" == "$JOHN_CURRENT_HASH" || "$STANLEY_BAD_HASH" == "$STANLEY_CURRENT_HASH" ]]; then
    exit 1
fi

if getent passwd jeff >/dev/null 2>&1; then
    if [[ "$(id -u "jeff")" == 0 ]]; then
        exit 1
    fi
else
    exit 1
fi

exit 0