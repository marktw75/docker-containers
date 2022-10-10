docker build -t samba:latest .

docker run --detach --publish 139:139 --publish 445:445 --volume /home/mark/dev/docker-containers/samba/etc:/etc/samba --volume /mnt/16tdisk/PublicShare:/usr/local/share --restart unless-stopped --name samba dperson/samba

