#!/bin/bash

JOHN_BAD_HASH=$(awk -F: '$1=="john" {print $2}' /var/tmp/.bad-hashes)
CATHERINE_BAD_HASH=$(awk -F: '$1=="catherine" {print $2}' /var/tmp/.bad-hashes)

JOHN_CURRENT_HASH=$(awk -F: '$1=="john" {print $2}' /etc/shadow)
CATHERINE_CURRENT_HASH=$(awk -F: '$1=="catherine" {print $2}' /etc/shadow)

if [[ "$JOHN_BAD_HASH" == "$JOHN_CURRENT_HASH" || "$CATHERINE_BAD_HASH" == "$CATHERINE_CURRENT_HASH" ]]; then
    exit 1
fi

exit 0