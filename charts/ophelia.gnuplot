#
# Plot sleep summary. Plotting stacked bar chart with timeo on x axis
# is a little tricky. See:
# https://stackoverflow.com/questions/23749093/stacked-histogram-over-time-via-gnuplot
#

set terminal pngcairo size 1400,850
set output "ophelia.png"

set key opaque right bottom 

#set title "Sleep summary (data from Mi Band 2)"
set multiplot layout 3, 1  title "Ophelia from NUIG weather station (16 Oct 2017)" font ",18"

set tmargin 1
set bmargin 1
set lmargin 10


#set grid ytics noxtics
set grid
set xdata time
set format x "%H:%M"

# 
# Wind/gust speed
#
set timefmt "%Y%m%d-%H%M"
set ylabel "km/h"
set xrange["20171016-0700":*]
plot '../data/ophelia.dat' using 1:($4*3.6) with lines linewidth 2 title "Wind speed", \
'../data/ophelia.dat' using 1:($6*3.6) with lines linewidth 2 title "Gust speed"


# 
# Wind direction 
#
set ylabel "Degrees"
#set xrange ["20171016-0700":*]
plot '../data/ophelia.dat' using 1:5 with lines linewidth 2 title "Wind direction"

#
#
#
set ylabel "hPa"
plot '../data/nuig_weather.dat' using 1:7 with lines linewidth 2 title "Atmospheric pressure"

