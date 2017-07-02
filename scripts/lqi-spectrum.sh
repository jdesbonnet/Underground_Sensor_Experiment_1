#!/bin/bash

# 1 hours
BIN_SIZE=3600

cat ../data/ugsensor.dat  | java HourlyMeans - ${BIN_SIZE} > t.t
	



