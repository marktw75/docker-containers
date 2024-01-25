docker run -d --name=photoshow \
-p 8039:80 \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Asia/Taipei \
-v /mnt/mark15000A/docker/photoshow/config:/config \
-v /mnt/mark15000A/docker/photoshow/thumbs:/Thumbs \
-v /mnt/mark15000A/docker/photoshow/photo:/Pictures:ro \
--restart always \
lscr.io/linuxserver/photoshow
