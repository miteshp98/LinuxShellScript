#!/bin/bash

#This script is to create dir

#Define Name in here.

dir="/home/user/name"    #In Name Give Whatever you directory name you want to create.

#Check if dir exist or not.

if [ -d  "$dir" ];then
	echo "Directory Exist"
else
	echo "Directory Doesn't Exist"
fi

	sleep 2s

	#Create Dir.
	mkdir "$dir"
	echo "Directory Has been Created"
