#!/bin/bash
echo "Insert user name:"
read userName
echo "Insert user group:"
read userGroup
if grep -q $userGroup /etc/group 
then
	echo "Group exists."
else
	echo "Group does not exists."
	if [[ "$userGroup" =~ ^(advanced|medium|basic|visitor|datastore)$ ]]; then
		echo "Group is correct. Creating group."
		`sudo groupadd $userGroup`
	else
		echo -e 'Group not correct. Group must be: \n\tadvanced \n\tmedium \n\tbasic \n\tvisitor \n\tdatastore'
		echo "Aborting user creation."
		exit
	fi
fi
sudo adduser --home /home/$userName $userName
sudo usermod -g $userGroup $userName
