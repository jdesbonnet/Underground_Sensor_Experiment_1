
set title 'Freezer temperature sensor experiment (433MHz LoRa).' textcolor rgb 'white'
set xlabel 'Time (year 2018)' textcolor rgb 'white'
set ylabel 'Temperature °C ' textcolor rgb 'white'

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "red"
set style line 2 linecolor rgb "blue"


set terminal pngcairo size 1024,600 background rgb 'black'
set output "temperature-freezer.png"
set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

#set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
#set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"

set tmargin at screen 0.87
#set bmargin at screen 0.25
#set rmargin at screen 0.95
#set lmargin at screen 0.15


set xdata time
set timefmt "%Y%m%d-%H%M%S"
set format x "%d %b"
set format x "%d %b\n%H:%M"
set grid
#set xtics "%H:%M"
set ylabel "Temperature °C" textcolor rgb 'white'
#set yrange [0:12]
#set xrange ["20180207-1600":*]
plot \
'../data/sensor_freezer.dat' using 1:2 with linespoints lt 1 lw 2 title ""
