#!/bin/bash
# Script to read from stdin and append timestamp
# to the start of line and output to stdout.
while read line ; do
    echo `date +%Y%m%d-%H%M%S` $line
done

