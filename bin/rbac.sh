#!/bin/bash

#Comprobamos que el numero de parámetros sea correcto
if [[ $# -ne 1 ]]; then
    echo "Numero incorrecto de parametros"
    cat ./rbac/help.txt
    exit -1
fi

username=`whoami`

#clean-all
if [[ "$1" = "clean-all" ]]; then
    exec ./rbac/clean-all.sh $username
    exit 1
fi

#reset
if [[ "$1" = "reset" ]]; then
    exec ./rbac/reset.sh $username
    exit 1
fi

#help
if [[ "$1" = "help" ]]; then
    echo "Has usado el comando de ayuda"
    cat ./rbac/help.txt
    exit 1
fi

#list-commands
if [[ "$1" = "list-commands" ]]; then
    exec ./rbac/list-commands.sh $username
    exit 1
fi

#request-commands
if [[ "$1" = "request-command" ]]; then
    exec ./rbac/request-command.sh $username
    exit 1
fi

cat ./rbac/help.txt
exit 1
