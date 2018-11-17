#!/bin/bash
echo "Entro al sshLogin."
echo "Printo whoami: `whoami`"
userName=`whoami`

if groups $userName | grep &>/dev/null '\bvisitor\b'; then
	if [ ! -d "users/visitor/$userName/home" ]; then
		bash commands.sh $userName "visitor" /bin/{ls,rm,bash,nano,mkdir} /usr/bin/{vim,touch} # "ll"
	fi
	#/bin/bash enviroment "visitor"
else
	if groups $userName | grep &>/dev/null '\badvanced\b'; then
		if [ ! -d "users/advanced/$userName/home" ]; then	
			bash commands.sh $userName "advanced" /bin/{ls,rm,bash,nano,mkdir,kill,ln,ps,grep,sed,chmod,chown} /usr/bin/{vim,touch,java,python,gcc,awk,strace,make} # /usr/lib/valgrind # "ll" "pip" "pip3"
		fi
		#/bin/bash enviroment "advanced"
	else
		if groups $userName | grep &>/dev/null '\bbasic\b'; then
			if [ ! -d "users/basic/$userName/home" ]; then
				bash commands.sh $userName "basic" /bin/{ls,rm,bash,nano,mkdir,gcc,kill} /usr/bin/{vim,touch} # "ll" "make"
			fi
			#/bin/bash enviroment "basic"
		else
			if groups $userName | grep &>/dev/null '\bdatastore\b'; then
				if [ ! -d "users/datastore/$userName/home" ]; then
					bash commands.sh $userName "datastore"
				fi
				#/bin/bash enviroment "datastore"
			else
				if groups $userName | grep &>/dev/null '\bmedium\b'; then
					if [ ! -d "users/medium/$userName/home" ]; then
						bash commands.sh $userName "medium" /bin/{ls,rm,bash,nano,mkdir,ln,ps,grep,sed} /usr/bin/{vim,touch,java,python,awk,make} #/usr/lib/valgrind # "ll" "pip" "pip3"
					fi
					#/bin/bash enviroment "medium"
				fi
			fi
		fi
	fi
fi
#/bin/bash enviroment.sh
/bin/bash
