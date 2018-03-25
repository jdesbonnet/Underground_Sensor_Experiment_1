#!/bin/bash
# Script to read from stdin and append timestamp
# to the start of line and output to stdout.
while read line ; do
    timestamp=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
    echo "$timestamp $line"
done

