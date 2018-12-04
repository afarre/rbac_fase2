#!/bin/bash
echo "hello" >> /tmp/aux
echo "group: $2" >> /tmp/aux
echo "user: $1" >> /tmp/aux

CHROOT="/users/$2/$1"

if [ ! -d "$CHROOT/home/$1" ]; then
	echo "creo la carpeta home del usuari" >> /tmp/aux
	mkdir -p "$CHROOT/home/$1"
fi

for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		echo "Copio el permis: $i" >> /tmp/aux
		cp -v --parents $i $CHROOT
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$CHROOT
fi

clear
cd
echo "Connected to RBAC server! Welcome `whoami`"
