#!bin/bash

while true; do
    read -p "Do you wish to clean all your home and enviroment?(Y/N) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Procedemos a limpiar todo el entorno y home

