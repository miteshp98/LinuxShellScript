#!/bin/bash

#To Backup log's

#Define Paths's In variable.

dir="/var/log/secure"
backupdir="/samba"

#Check if the user is root or not

if [[ ${UID} -eq 0 ]];then
	echo "You are root"
else
	exit 1
fi

#Check File Exist.

if [[ -f "$dir" ]]; then
	echo "It Exist"
else
	echo "There'isnt any File name secure"
fi


TIMESTAMP=$(date +"%d_%m_%Y_%H:%M")


#Use rsync to perform the backup

rsync -av --delete "$dir" "$backupdir/$TIMESTAMP/"
