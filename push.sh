#!/bin/bash
cp /bin/sshLogin.sh bin/
cp /bin/commands.sh bin/
cp /etc/ssh/sshd_config etc/ssh/

git add -A
git commit -m $1
git push origin master
