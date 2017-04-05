
set title 'Underground temperature sensor experiment (433MHz LoRa transceiver)' textcolor rgb 'white'
set xlabel 'Time (year 2016/2017)' textcolor rgb 'white'

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "red"
set style line 2 linecolor rgb "blue"


set terminal pngcairo size 1024,600 background rgb 'black'
set output "precip-vs-lqi.png"
set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"
set xlabel "Precipitation mm"
set ylabel "RSSI"

set grid
set boxwidth 3600
set style fill solid 1.0
plot 'precip-vs-lqi.dat' using 2:4 with points pt 3 , '' using 2:($5 - 100) with points pt 4
