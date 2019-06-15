#!/bin/bash
#if [ "$PAM_USER" = "root" ]; then
#	exit
#fi
GROUP=$2

source /etc/users/$GROUP.cfg

if [ ! -d "users/$GROUP/$1/home" ]; then
	bash commands.sh $1 $GROUP "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"
fi
