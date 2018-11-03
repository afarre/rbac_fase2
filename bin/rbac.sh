#!bin/bash

#Comprobamos que el numero de parámetros sea correcto
if [[ $# -lt "3" ]]; then
    cat ./rbac/help.txt
    exit -1
fir

#clean-all
if [[ $1 -eq "clean-all" ]]; then
    exec ./rbac/clean-all.sh $2
    exit 1
fi

#reset
if [[ $1 -eq "reset" ]]; then
    exec ./rbac/reset.sh $2
    exit 1
fi

#help
if [[ $1 -eq "help" ]]; then
    cat ./rbac/help.txt
    exit 1
fi

#list-commands
if [[ $1 -eq "list-commands" ]]; then
    exec ./rbac/list-commands.sh $2
    exit 1
fi

#request-commands
if [[ $1 -eq "request-command" ]]; then
    exec ./rbac/request-command.sh $2
    exit 1
fi