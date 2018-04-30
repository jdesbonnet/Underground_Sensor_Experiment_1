#!/bin/bash
export TZ=UTC
UART=$1
./cfg_uart.sh $UART
cat $UART | bash time_tag.sh  >> ../data/ugsensor.log 

