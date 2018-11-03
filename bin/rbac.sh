#!bin/bash

rbac_help=""

#Comprobamos que el numero de parámetros sea correcto
if [[ $# -ne "2" ]]; then
    echo $rbac_help
    exit -1
fir

#clean-all
if [[ $1 -eq "clean-all" ]]; then
    ./rbac/clean-all.sh
fi

#reset
if [[ $1 -eq "reset" ]]; then
    ./rbac/reset.sh
fi

#help
if [[ $1 -eq "help" ]]; then
    echo $rbac_help
    exit 1
fi

#list-commands
if [[ $1 -eq "list-commands" ]]; then
    ./rbac/list-commands.sh
    exit 1
fi

#request-commands
if [[ $1 -eq "request-command" ]]; then
    ./rbac/request-command.sh
    exit 1
fi