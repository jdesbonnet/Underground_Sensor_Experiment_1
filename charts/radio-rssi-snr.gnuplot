
set title 'Underground temperature sensor experiment (433MHz LoRa transceiver)' textcolor rgb 'white'
set xlabel 'Time (year 2016/2017)' textcolor rgb 'white'

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "red"
set style line 2 linecolor rgb "blue"


set terminal pngcairo size 1024,600 background rgb 'black'
set output "radio-rssi-snr.png"
set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"

set xdata time
set timefmt "%Y%m%d-%H%M%S"
set grid
#set format x "%Y\n%m/%d"
set format x "%d %b"
set ylabel "RSSI / SNR (dB) / Precipitation (mm/hour x 5)" textcolor rgb 'white'
set boxwidth 3600
set style fill solid 1.0
set xrange ["20161206-0000":*]
plot '../data/ugsensor.dat' using 1:3 with lines lw 2 title "RSSI", '' using 1:4 with lines lw 2 title 'SNR dB', \
'../data/nuig_precipitation.dat' using 1:($2*5):(3600) with boxes lt 3 lc rgb "#8080ff" title "Precipitation (near by station, 6km away)"

