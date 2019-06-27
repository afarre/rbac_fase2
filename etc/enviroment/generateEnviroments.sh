#!/bin/bash

rm -rf /data/docker

source /etc/users/advanced.cfg
bash commands.sh "advanced" "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"

source /etc/users/medium.cfg
#bash commands.sh "medium" "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"

source /etc/users/basic.cfg
#bash commands.sh "basic" "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"

source /etc/users/datastore.cfg
#bash commands.sh "datastore" "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"

source /etc/users/visitor.cfg
#bash commands.sh "visitor" "${PERMISSIONS_BIN[@]}" "${PERMISSIONS_USR_BIN[@]}"
