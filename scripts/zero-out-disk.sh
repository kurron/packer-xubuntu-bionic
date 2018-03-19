#!/usr/bin/env bash

# this script will run via sudo

echo 'Zeroing device to make space...'
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
