#!/bin/bash
GROUP=`id -Gn $PAM_USER`
echo "Header" > /tmp/aux
echo $GROUP >> /tmp/aux
echo "importo /etc/users/$GROUP.cfg" >> /tmp/aux
source /etc/users/$GROUP.cfg
#source /etc/users/basic.cfg
#source /etc/users/medium.cfg
#source /etc/users/visitor.cfg

if [ ! -d "users/$GROUP/$PAM_USER/home" ]; then
	echo "entro al primer if" >> /tmp/aux
	bash commands.sh $PAM_USER $GROUP "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"
fi

#if groups $PAM_USER | grep &>/dev/null '\bdatastore\b'; then
#	if [ ! -d "users/datastore/$PAM_USER/home" ]; then
#		bash commands.sh $PAM_USER "datastore"
#	fi
#else
#	if `id -Gn $PAM_USER` == "medium"; then
#		if [ ! -d "users/$GROUP/$PAM_USER/home" ]; then
#					bash commands.sh $PAM_USER "medium" "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}" #/usr/lib/valgrind # "ll" "pip" "pip3"
#		fi
#	fi
#fi
