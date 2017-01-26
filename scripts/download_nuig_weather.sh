#!/bin/bash
DBUSER=$1
DBPW=$2
DBHOST=danu2.it.nuigalway.ie
DBNAME=mydb586
START_TIME="20161205"
WEATHER_COLUMNS="DateTime,Temperature,RelativeHumidity,WindSpeed,WindDirection,Gust,BarometricPressure,TotalSolar,DiffuseSolar,BatteryOfWeatherStation"
mysql --user=$DBUSER --password=$DBPW --host=$DBHOST $DBNAME -e "SELECT DateTime,Rainfall FROM hour where DateTime > $START_TIME ORDER BY DateTime"  | java ConvertTimeFormat - > ../data/nuig_precipitation.dat
mysql --user=$DBUSER --password=$DBPW --host=$DBHOST $DBNAME -e "SELECT $WEATHER_COLUMNS FROM minute where DateTime > $START_TIME ORDER BY DateTime"  | java ConvertTimeFormat - > ../data/nuig_weather.dat


