#!/bin/bash
echo "Insert user name:"
read userName
echo "Insert user group:"
read userGroup
sudo adduser --home /users/$userGroup/$userName/home/$userName $userName
sudo usermod -g $userGroup $userName
sudo chown $userName:$userName /users/$userGroup/$userName
#sudo chroot /users/$2/$1 /bin/bash
