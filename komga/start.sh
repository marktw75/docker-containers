docker run -d --name=komga \
-p 8341:25600 \
-e TZ=Asia/Taipei \
-v /mnt/mark15000A/docker/komga/config:/config \
-v /mnt/mark15000A/docker/komga/data:/data \
--user 1000:1000 \
--restart always \
gotson/komga
