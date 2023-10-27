#!/bin/bash

#Version-1.0
#Created by Mitesh Panchal.
#Script is about Checking server connectivity & If Server Goes Down It Will Nofify You.

#Define server name.

servername="www.name.com"

#Checking Connectivity If then.

if ping -c 3 $servername > /dev/null ; then
	echo "Server is Running Good and Is UP"
else
	notify-send -u critical "Server Down" "$servername is Not Reachable"
fi
