#!/bin/bash

#Version-1.0
#Created by Mitesh Panchal.
#Script is about Checking server connectivity & If Server Goes Down It Will Nofify You.

#Define server name.
servername="www.name.com"
#Define Directory To save Status log.
logdir="/path/to/server.log"

#Checking Connectivity If then.

if ping -c 3 $servername > /dev/null ; then
	echo "Server is Running Good and is UP: $(date '+%d-%m-%Y_%H:%M')" >> "$logdir"  2>&1
else
	echo "Server is Down and Not Reachable: $(date '+%d-%m-%Y_%H:%M')" >> "$logdir" 2>&1
	notify-send -u critical "Server Down" "$servername is Not Reachable"
fi
