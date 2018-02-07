#!/bin/bash
UART=/dev/ttyUSB0
./cfg_uart.sh $UART
cat $UART | bash time_tag.sh  >> ../data/ugsensor.log 

