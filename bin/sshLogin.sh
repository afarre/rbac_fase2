#!/bin/bash
#if [ "$PAM_USER" = "root" ]; then
#	exit
#fi
GROUP=`id -Gn $PAM_USER`
source /etc/users/$GROUP.cfg

if [ ! -d "users/$GROUP/$PAM_USER/home" ]; then
	bash commands.sh $PAM_USER $GROUP "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"
fi
