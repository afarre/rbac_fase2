#!/bin/bash
cp /bin/sshLogin.sh bin/
cp /bin/commands.sh bin/
cp /etc/ssh/sshd_config etc/ssh/
cp /bin/addUser.sh /bin

git add -A
echo "Introduce el mensaje de commit:"; read mensaje
git commit -m "$mensaje"
git push origin master
