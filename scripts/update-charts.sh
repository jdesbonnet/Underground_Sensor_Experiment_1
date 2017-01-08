java -cp . DS18B20 ../data/ugsensor.log > ../data/ugsensor.dat
cd ../charts
gnuplot temperature.gnuplot
gnuplot radio-rssi-snr.gnuplot

