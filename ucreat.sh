#!/bin/bash

echo group $2
echo name $1
echo "/users/$2/$1"
sudo adduser --home /users/$2/$1 $1
sudo usermod -g $2 $1
