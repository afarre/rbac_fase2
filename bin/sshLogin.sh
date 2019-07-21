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

userExists=$(docker ps -a | grep $1)
userRunning=$(docker ps | grep $1)

if [ -z $userExists ]; then
	source /etc/users/$GROUP.cfg
	docker run -dit --name $1 --memory-swap=$SWAP --memory=$FISICA --cpus=$CPUQ --cpu-quota=$CPUP -v /data/users/$GROUP/$1:/home/$1 $GROUP bash

elif [ -z $userRunning ]; then

	docker start $1
fi

docker exec -it --user $1 --workdir /home/$1 $1 bash