#!/bin/bash
echo "Entro a commands" >> /tmp/aux
echo "Valor de 1: $1" >> /tmp/aux
echo "Valor de 2: $2" >> /tmp/aux
CHROOT="/users/$2/$1" >> /tmp/aux
if [ ! -d $CHROOT ]; then
	mkdir $CHROOT
fi

for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $CHROOT
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$CHROOT
fi

#ARCH i386
if [ -f /lib/ld-linux.so.2 ]; then
	cp --parents /lib/ld-linux.so.2 /$CHROOT
fi

clear
cd
echo "Connected to RBAC server! Welcome `whoami`"
