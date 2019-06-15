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
cd $CHROOT
echo "current path:" $CHROOT

`tar -czvf $1.tar.gz .`
`cat $1.tar.gz | docker import --change "CMD ["/bin/bash"]" - $1`
`docker create $1`

clear
echo "Docker image of user $1 generated correctly."
