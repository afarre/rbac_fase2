#!/bin/bash
#if [ "$PAM_USER" = "root" ]; then
#	exit
#fi
GROUP=$2

echo sshLoguin groups $GROUP > /tmp/aux
echo sshLoguin username $1 >> /tmp/aux

if [ ! -d "/data/users/$GROUP/$1/" ]; then
	echo creo el entorn del usuari >> /tmp/aux
	mkdir -p "/data/users/$GROUP/$1/home/$1"
fi

source /etc/users/$GROUP.cfg
echo post source >> /tmp/aux

#	echo vaig a crear el entorn i permisos del usuari >> /tmp/aux
#	bash commands.sh $1 $GROUP "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"

#if [ ! -d "/data/users/$GROUP/$1/home" ]; then	
#	echo vaig a crear el entorn i permisos del usuari >> /tmp/aux
#	bash commands.sh $1 $GROUP "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"
#fi
