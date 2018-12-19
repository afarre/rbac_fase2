#!/bin/bash

CHROOT="/users/$2/$1"

if [ ! -d "$CHROOT/home/$1" ]; then
	mkdir -p "$CHROOT/home/$1"
fi

for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $CHROOT
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$CHROOT
fi

`chown $1:$1 $CHROOT/home/$1`
echo $1:$1 $CHROOT/home/$1 >> /tmp/aux
clear
cd
echo "Connected to RBAC server! Welcome `whoami`"
