#!/bin/bash

#If you Want to Create user use this script

#Define groups name and username and dirname in variable

group="hradmin"
user="saloni"
dir="/home/$user"
shell="/bin/bash"
comment="junior hr"

#Check If this Script is using under root/sudo privilege.

if [[ ${UID} -eq 0 ]];then
	echo "Yes Your Are root"
else
	echo "You are not Root Please Do not Use"
fi

sleep 1s

#If you are not using Root/sudo Privilege then Script will exit

if [[ ! ${UID} -eq 0 ]];then
	exit 1
fi



#Check if group is Already Exist or not.

if getent group "$group" ;then 
	echo "group exist"
else
	groupadd "$group"
fi

sleep 2s

cat /etc/group | grep "$group"

sleep 1s

#Check If User Exist or not.

if id "$user" &>/dev/null ; then
	echo "User id Already exist"
else

	#Create the user with their shell and home directory.
	useradd -g "$group" -s "$shell" -c "$comment" -m -d "$dir" "$user"

sleep 1s
	#Generate Password It will Generate on Today Date.
	date=$(date +"%Y%m")

	password=$(echo -n "$date")

	echo "$user:$password" | chpasswd
	echo "Generated Password: $password"

fi

sleep 2s

#Check Is User Created.

if [[ $? -eq 0 ]];then
	echo "Use has been created"
else
	echo "Failed To Create"
fi
