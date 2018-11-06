#!/bin/bash
#./userGroup "$UID"
if [ -d "/users/$1/`whoami`/home" ]; then
	:
else
	echo "Generating enviroment..."
	
	#mkdir -p $HOME/{bin,lib,home,lib64}
	#cd $HOME/lib
	#mkdir -p x86_64-linux-gnu
	#cd ..
	#cd $HOME
	#cp /bin/{bash,ls} $HOME/bin
	#cp /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libc.so.6 $HOME/lib/
	#cp /lib64/ld-linux-x86-64.so.2 $HOME/lib64/
	#list="$(ldd /bin/ls | egrep -o '/lib.*\.[0-9]')"
	#for i in $list; do cp "$i" "$HOME${i}"; done

	
fi
	echo $HOME
	echo $HOME/bin/bash
	#sudo chroot $HOME /bin/bash
