#!/bin/bash
BIN_SIZE=172800
#BIN_SIZE=86400
#BIN_SIZE=43200
cat ../data/ugsensor.dat  | java HourlyMeans - ${BIN_SIZE} > t.t
cat ../data/nuig_precipitation.dat | java PrecipMeans - ${BIN_SIZE} > p.p
java Join t.t p.p > precip-vs-lqi.dat
#rm t.t p.p
gnuplot precip-vs-lqi.gnuplot



