#!/bin/bash

#Version:-1.0
#Created By MiteshPanchal.
#This script is to assign static ip address.

#Define Your( Ip, DNS, Gateway, Method)  In Variable's.

ip="192.168.68.175"  	#Change Ip According to You.
dns="8.8.8.8"		#Your DNS 
method="manual" 	#Keep Manual If You Are assigning Static.
gateway="192.168.68.1"  #Your gateway If  you have.
nic="enp0s8" 		#In Which NIC you want to Assign.

#Use This script as root/sudo Privilege.Might  Not be able to run as user.

if [[ ${UID} -eq 0 ]];then 
	echo "You are root"
else
	exit 1
fi

#Check If this Ip is available if not then use different Ip.

if ping  -c 1 -w 1 "$ip" ;then
	echo "Ip is not available Do not use" 		#If it's Reachable than You can not assign.
else
	echo "It is availaable You can use it" 		#If it's Not reachable then You can Assign to it.
fi

#Assign Ip Address Using nmcli utility.

nmcli connection modify "$nic" ipv4.address "$ip"

#Assign dns.

nmcli connection modify "$nic" ipv4.dns "$dns"

#Assign gateway.

nmcli connection modify "$nic" ipv4.gateway "$gateway"

#Assign Method Manual or Automatic"

nmcli connection modify "$nic" ipv4.method "$method"

#Restart Network Connection.
nmcli connection down "$nic"
nmcli connection up "$nic"

#Check the Assign Network and Exit status.
echo "Assigned Ip Address is: $ip"

ping -c 1 -w 1	"$ip"
ping_exit_status=$?	

#Check the exit status and display it.

if [[ $ping_exit_status -eq 0 ]];then
	echo "Ping to Target was Successfull"
else
	echo "Ping to Target is Unsccessfull"
fi

#Exit with ping Exit Status.
exit $ping_exit_status
