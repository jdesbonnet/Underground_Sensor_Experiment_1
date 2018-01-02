#
# Plot sleep summary. Plotting stacked bar chart with timeo on x axis
# is a little tricky. See:
# https://stackoverflow.com/questions/23749093/stacked-histogram-over-time-via-gnuplot
#

start_time="20180102-1200"
end_time="20180103-1200"

set terminal pngcairo size 1800,1200 background rgb 'black'
set output "storm_elenor.png"

set key opaque right bottom 


set multiplot layout 4, 1  title "Storm Elenor from NUIG weather station (3 Jan 2018)" font ",18" 

# Not possible to set textcolor in multiplot title
# Ref: https://stackoverflow.com/questions/38981511/how-to-specify-color-of-multiplot-title
# Use set label as workaround.
set label 1 "Storm Elenor data from NUIG weather station (3 Jan 2018). Time in Irish local time (IST)." \
center at graph 0.5,1.12 font ",18" tc rgb "white"

set tmargin 1
set bmargin 1.8
set lmargin 10

set border lc rgb "white"
set key tc rgb "white"


set grid linecolor rgb "white"
set xdata time
set format x "%H:%M"

# 
# Wind/gust speed
#
unset title
set timefmt "%Y%m%d-%H%M"
set xrange[start_time:end_time]
set ylabel "km/h"  textcolor rgb "white"
plot '../data/storm_elenor.dat' using 1:($4*3.6) with lines linewidth 2 title "Wind speed", \
'../data/storm_elenor.dat' using 1:($6*3.6) with lines linewidth 2 linecolor rgb "blue" title "Gust speed"


unset label 1

# 
# Wind direction 
#
set xrange [start_time:end_time]
set ylabel "Degrees (0 = wind from north)"  textcolor rgb "white"
plot '../data/storm_elenor.dat' using 1:5 with lines linewidth 2 linecolor rgb "green" title "Wind direction" 

#
#
#
set xrange[start_time:end_time]
set ylabel "hPa"  textcolor rgb "white"
#set xlabel "Time (IST)" textcolor rgb "white"
set yrange [960:1010]
plot '../data/storm_elenor.dat' using 1:7 with lines linewidth 2 linecolor rgb "violet" title "Atmospheric pressure" 

#
# Precip
#
set xrange[start_time:end_time]
set ylabel "mm / hour"  textcolor rgb "white"
set yrange [0:4]
set style fill solid 1.0
plot '../data/storm_elenor_precip.dat' using 1:2 with boxes linewidth 2 linecolor rgb "blue" title "Precipitation" 

#
# Temperature
#
#set xrange[start_time:end_time]
#set ylabel "°C"  textcolor rgb "white"
#set yrange [*:*]
#plot '../data/ophelia.dat' using 1:2 with lines linewidth 2 linecolor rgb "yellow" title "Temperature" 


