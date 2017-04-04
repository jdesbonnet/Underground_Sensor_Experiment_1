#!/bin/bash
#BIN_SIZE=172800
#BIN_SIZE=86400
BIN_SIZE=43200
cat ../data/ugsensor.dat  | java HourlyMeans - ${BIN_SIZE} > t.t
cat ../data/nuig_precipitation.dat | java PrecipMeans - ${BIN_SIZE} > p.p
for offset in $(seq -3 3); do
	echo "offset $offset"
	java Join t.t p.p $offset > precip-vs-lqi.dat
	gnuplot precip-vs-lqi.gnuplot
	mv precip-vs-lqi.png precip-vs-lqi.${offset}.png
done
	



