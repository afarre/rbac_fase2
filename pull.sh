#!/bin/bash
git pull

sudo cp bin/sshLogin.sh /bin
sudo cp bin/commands.sh /bin
sudo cp etc/ssh/sshd_config /etc/ssh
sudo cp bin/addUser.sh /bin
sudo cp etc/pam.d/sshd /etc/pam.d
sudo cp etc/users/* /etc/users/*
