#!/bin/bash
JAVA=/opt/java/current/bin/java
${JAVA} -cp . DS18B20 ../data/ugsensor.log 0x53 > ../data/ugsensor.dat
${JAVA} -cp . DS18B20 ../data/ugsensor_onagh.log 0x56 > ../data/ugsensor_onagh.dat
${JAVA} -cp . DS18B20 ../data/ugsensor.log 0x57 > ../data/sensor_freezer.dat

cd ../charts
gnuplot temperature.gnuplot
gnuplot temperature-recent.gnuplot
gnuplot radio-rssi-snr.gnuplot
gnuplot radio-rssi-snr-recent.gnuplot
gnuplot radio-rssi-snr-onagh.gnuplot

gnuplot temperature-onagh.gnuplot
gnuplot temperature-freezer.gnuplot

