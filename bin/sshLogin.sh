#!/bin/bash
GROUP=id -g -n $PAM_USER
source /etc/users/config.cfg
echo "permisos medium=$MEDIUM_PERMISSIONS_BIN" > /tmp/aux

if groups $PAM_USER | grep &>/dev/null '\bvisitor\b'; then
	if [ ! -d "users/visitor/$PAM_USER/home" ]; then
		bash commands.sh $userName "visitor" /bin/{ls,rm,bash,nano,mkdir} /usr/bin/{vim,touch} # "ll"
	fi
else
	if groups $PAM_USER | grep &>/dev/null '\badvanced\b'; then
		if [ ! -d "users/advanced/$PAM_USER/home" ]; then	
			bash commands.sh $PAM_USER "advanced" /bin/{ls,rm,bash,nano,mkdir,kill,ln,ps,grep,sed,chmod,chown} /usr/bin/{vim,touch,java,python,gcc,awk,strace,make} # /usr/lib/valgrind # "ll" "pip" "pip3"
		fi
	else
		if groups $PAM_USER | grep &>/dev/null '\bbasic\b'; then
			if [ ! -d "users/basic/$PAM_USER/home" ]; then
				bash commands.sh $PAM_USER "basic" /bin/{ls,rm,bash,nano,mkdir,gcc,kill} /usr/bin/{vim,touch} # "ll" "make"
			fi
		else
			if groups $PAM_USER | grep &>/dev/null '\bdatastore\b'; then
				if [ ! -d "users/datastore/$PAM_USER/home" ]; then
					bash commands.sh $PAM_USER "datastore"
				fi
			else
				#if groups $PAM_USER | grep &>/dev/null '\bmedium\b'; then
					if [ ! -d "users/$GROUP/$PAM_USER/home" ]; then
						#bash commands.sh $PAM_USER "medium" $MEDIUM_PERMISSIONS_BIN $MEDIUM_PERMISSIONS_BIN_USR #/usr/lib/valgrind # "ll" "pip" "pip3"
						bash commands.sh $PAM_USER "medium" /bin/{ls,rm,bash,nano,mkdir,kill,ln,ps,grep,sed} /usr/bin/{vim,touch,java,python,gcc,awk,make} #/usr/lib/valgrind # "ll" "pip" "pip3"
				#	fi
				fi
			fi
		fi
	fi
fi
