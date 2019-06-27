#!/bin/bash

echo $1
AUX="/data/docker/$1"
mkdir -p $AUX

echo "pre bucle 1" >> /tmp/aux

for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
do
	cp --parents $i $AUX
done

#ARCH amd64
if [ -f /lib64/ld-linux-x86-64.so.2 ]; then
	cp --parents /lib64/ld-linux-x86-64.so.2 /$AUX
fi

