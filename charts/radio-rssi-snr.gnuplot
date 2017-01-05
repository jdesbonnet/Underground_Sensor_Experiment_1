
set title 'What lies under 106 Tur Uisce' textcolor rgb 'white'
set xlabel 'Time' textcolor rgb 'white'
set ylabel 'Temperature °C' textcolor rgb 'white'

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "red"
set style line 2 linecolor rgb "blue"


set terminal pngcairo size 1024,600 background rgb 'black'
set output "ug2.png"
set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"

set xdata time
set timefmt "%Y%m%d-%H%M%S"
set grid
#set xtics "%m%d"
set format x "%Y/%m/%d"
set ylabel "Temperature °C"
plot 't.dat' using 1:3 with lines lw 2 title "RSSI", '' using 1:4 with lines lw 2 title 'SNR dB'

