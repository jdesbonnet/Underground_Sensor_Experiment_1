#!/usr/bin/env octave -q
#
# Apply fourier transform to underground sensor LQI (RSSI, SNR)
#
# Command line:
# octave lqi-fourier.m  hourly-mean-lqi.dat > /dev/null
#
# Joe Desbonnet,
# jdesbonnet@gmail.com
# 2 Jul 2017

datain = argv(){1}
dataout = argv(){2}

# Skip header by skipping first 24 lines
#ugs_matrix = dlmread(datain, ",", 24, 0)
ugs_matrix = dlmread(datain, " ")

# Column 1 : date/time
# Column 2 : temperature
# Column 3 : RSSI
# Column 4 : SNR
lqi = ugs_matrix( : , 2)


Ts = 3600
fs = 1/Ts

fa = abs(fft(lqi))
N = rows (fa)

n = [1 : 1 : N/2];

# ./ operator is element by element division
period  = N * Ts ./ n ;
freq = n * fs / N;

length (n)
length (freq)
length (fa(1:end/2))

#plot (freq(2:end),fa(2:end/2))

out = horzcat (freq' , fa(1:end/2))
dlmwrite (dataout, out, " " )

#pause()

