#!/bin/bash

set -aex

USER="mark"
PASSWORD="mark1234"

echo "Add ${USER} user"
useradd ${USER} -p ${PASSWORD} -d /home/${USER}
echo "${USER}:${PASSWORD}" | chpasswd

echo "Create directories used by Samba Server"
mkdir -p /mnt/mark15000
mkdir -p /mnt/mark15000A
mkdir -p /mnt/mark750
mkdir -p /mnt/mark315
mkdir -p /home/${USER}

chown -R ${USER}:${USER} /home/${USER}
chmod -R 775 /home/${USER}

echo "Create samba user and setup password"
echo -ne "${PASSWORD}\n${PASSWORD}" |  smbpasswd -a -s ${USER}
