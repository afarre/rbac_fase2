#!/bin/bash
userName=`whoami`

if groups $userName | grep &>/dev/null '\bvisitor\b'; then
	if [ ! -d "users/visitor/$userName/home" ]; then
		bash commands.sh /bin/{ls,rm,bash,nano,mkdir} /usr/bin/{vim,touch} # "cd" "ll"
	fi
	#/bin/bash enviroment "visitor"
else
	if groups $userName | grep &>/dev/null '\badvanced\b'; then
		if [ ! -d "users/advanced/$userName/home" ]; then	
			bash commands.sh $userName "advanced" /bin/{ls,rm,bash,nano,mkdir,kill,ln,ps,grep,sed,chmod,chown} /usr/bin/{vim,touch,java,python,gcc,awk,strace} #/usr/lib/valgrind # "cd" "ll" "make" "pip" "pip3"
		fi
		#/bin/bash enviroment "advanced"
	else
		if groups $userName | grep &>/dev/null '\bbasic\b'; then
			if [ ! -d "users/basic/$userName/home" ]; then
				/bash commands.sh /bin/{ls,rm,bash,nano,mkdir,gcc,kill} /usr/bin/{vim,touch} # "cd" "ll" "make"
			fi
			#/bin/bash enviroment "basic"
		else
			if groups $userName | grep &>/dev/null '\bdatastore\b'; then
				if [ ! -d "users/datastore/$userName/home" ]; then
					/bin/bash commands.sh
				fi
				#/bin/bash enviroment "datastore"
			else
				if groups $userName | grep &>/dev/null '\bmedium\b'; then
					if [ ! -d "users/medium/$userName/home" ]; then
						/bash commands.sh /bin/{ls,rm,bash,nano,mkdir,ln,ps,grep,sed} /usr/bin/{vim,touch,java,python,valgrind,awk} # "cd" "ll" "make" "pip" "pip3"
					fi
					#/bin/bash enviroment "medium"
				fi
			fi
		fi
	fi
fi
cd
#/bin/bash enviroment.sh
/bin/bash
