#!/bin/bash

#docker pull portainer/portainer
docker-compose up -d

# 或者使用以下命令直接啟動（如果不想使用 docker-compose）
# docker run \
# -d \
# --restart always \
# --name portainer \
# -p 9000:9000 \
# -p 9443:9443 \
# -v /var/run/docker.sock:/var/run/docker.sock \
# -v portainer_data:/data \
# portainer/portainer-ce:latest
