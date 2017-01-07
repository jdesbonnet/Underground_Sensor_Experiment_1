#!/bin/bash
# Condition UART port so that it can be used with 'cat' command.
# Example bash cfg_uart.sh /dev/ttyUSB0
stty -F $1 min 1 time 0 speed 115200 line 0 -echo -icrnl

