docker run --detach --publish 139:139 --publish 445:445 \
--volume /home/mark/dev/docker-containers/samba/build:/etc/samba \
--volume /mnt/mark15000:/mnt/mark15000 \
--volume /mnt/mark15000A:/mnt/mark15000A \
--volume /mnt/mark750:/mnt/mark750 \
--volume /mnt/mark315:/mnt/mark315 \
--name samba \
--restart unless-stopped samba-hk

