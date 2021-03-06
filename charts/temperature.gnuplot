
set title 'Underground temperature sensor experiment (433MHz LoRa transceiver)' textcolor rgb 'white'
set xlabel 'Time (year 2016 - 2018)' textcolor rgb 'white'
set ylabel 'Underground Temperature °C / Precipitation mm/hour' textcolor rgb 'white'

set style fill transparent solid 0.3 noborder
set style fill noborder

set style line 1 linecolor rgb "red"
set style line 2 linecolor rgb "blue"


set terminal pngcairo size 1024,600 background rgb 'black'
set output "temperature-precipitation.png"
set border lc rgb 'white'
set key tc rgb 'white'

set grid lc rgb 'white'

set label "Joe Desbonnet" at graph -0.05,-0.07 font ",8" tc rgb "white"
set label "http://jdesbonnet.blogspot.com" at graph -0.05,-0.10 font ",8" tc rgb "white"

set xdata time
set timefmt "%Y%m%d-%H%M%S"
set format x "%d %b"
set grid
#set xtics "%H:%M"
set ylabel "Temperature °C" textcolor rgb 'white'
set y2label "Precipitation mm/hour" textcolor rgb 'white'
set y2tics
set ytics nomirror
set autoscale y2
set yrange [0:25]
set xrange ["20161206-0000":*]
plot \
'../data/nuig_precipitation.dat' using 1:2 axes x1y2 with impulses lt 3 title "Precipitation (nearby station, 6km away)", \
'../data/nuig_weather.dat' using 1:2 with lines lt 2 linecolor rgb "#ffff00" title "Air temperature (nearby station, 6km away)", \
'../data/ugsensor.dat' using 1:2 with lines lt 1 lw 2 title "Temperature at 0.4m depth" 

