#!/bin/bash
DBUSER=$1
DBPW=$2
DBHOST=danu2.it.nuigalway.ie
DBNAME=mydb586
STORM=elenor
START_TIME="20180102"
WEATHER_COLUMNS="DateTime,Temperature,RelativeHumidity,WindSpeed,WindDirection,Gust,BarometricPressure,TotalSolar,DiffuseSolar,BatteryOfWeatherStation"
mysql --user=$DBUSER --password=$DBPW --host=$DBHOST $DBNAME -e "SELECT DateTime,Rainfall FROM hour where DateTime > $START_TIME ORDER BY DateTime"  | java ConvertTimeFormat - > ../data/storm_${STORM}_precip.dat
mysql --user=$DBUSER --password=$DBPW --host=$DBHOST $DBNAME -e "SELECT $WEATHER_COLUMNS FROM minute where DateTime > $START_TIME ORDER BY DateTime"  | java ConvertTimeFormat - > ../data/storm_${STORM}.dat


