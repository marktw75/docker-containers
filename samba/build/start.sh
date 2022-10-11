#!/bin/bash

USER="mark"
PASSWORD="mark1234"

echo "Add ${USER} user"
useradd ${USER} -p ${PASSWORD} -d /home/${USER}
echo "${USER}:${PASSWORD}" | chpasswd

chown -R ${USER}:${USER} /home/${USER}
chmod -R 775 /home/${USER}

echo "Create samba user and setup password"
echo -ne "${PASSWORD}\n${PASSWORD}" |  smbpasswd -a -s ${USER}

