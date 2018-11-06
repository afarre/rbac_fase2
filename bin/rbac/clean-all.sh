#!/bin/bash

while true; do
    read -p "Do you wish to clean all your home and enviroment?(Y/N) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Procedemos a limpiar todo el entorno y home


if groups $1 | grep &>/dev/null '\bbasic\b'; then

	exit 1
fi

if groups $1 | grep &>/dev/null '\bmedium\b'; then

	exit 1
fi

if groups $1 | grep &>/dev/null '\badvanced\b'; then

	exit 1
fi

if groups $1 | grep &>/dev/null '\bdatastore\b'; then

	exit 1
fi

if groups $1 | grep &>/dev/null '\bvisitor\b'; then

	exit 1
fi
