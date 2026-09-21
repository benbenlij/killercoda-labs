#!/bin/bash

if getent passwd hacker >/dev/null 2>&1; then
    exit 1
fi

if ! getent passwd david >/dev/null 2>&1; then
    exit 1
fi

exit 0