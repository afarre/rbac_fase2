#!/bin/bash

BASE="/data/docker/"

mkdir "$BASE/advanced; $BASE/medium; $BASE/basic; $BASE/visitor; $BASE/datastore"

#-----------ADVANCED----------
PATH="$BASE/advanced"
for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $PATH
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$PATH
fi

#-----------MEDIUM----------
PATH="$BASE/medium"
for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $PATH
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$PATH
fi

#-----------BASIC----------
PATH="$BASE/basic"
for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $PATH
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$PATH
fi

#-----------VISITOR----------
PATH="$BASE/visitor"
for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $PATH
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$PATH
fi

#-----------DATASTORE----------
PATH="$BASE/datastore"
for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
	do
		cp --parents $i $PATH
	done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$PATH
fi
#`chown $1:$1 $CHROOT/home/$1`
#echo $1:$1 $CHROOT/home/$1 >> /tmp/aux
#cd $CHROOT

#`tar -czvf $1.tar.gz .`
#`cat $1.tar.gz | docker import --change "CMD ["/bin/bash"]" - $1`
#`docker create $1`
#mv "$1.tar.gz" /etc/usersTarballs

#clear
#echo "Docker image of user $1 generated correctly."
