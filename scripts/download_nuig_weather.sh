#!/bin/bash
DBUSER=$1
DBPW=$2
DBHOST=danu2.it.nuigalway.ie
DBNAME=mydb586
mysql --user=weatherro --password=$DBUSER --host=$DBHOST $DBNAME -e "SELECT DateTime,Rainfall FROM hour where DateTime > 20161201 ORDER BY DateTime"  | java ConvertTimeFormat - 

