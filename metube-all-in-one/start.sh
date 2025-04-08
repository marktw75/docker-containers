#!/bin/bash

# 構建容器
docker-compose build

# 啟動服務
docker-compose up -d

echo "Metube All-in-One 已啟動"
echo "Metube 網頁界面：http://localhost:5992"
echo "NFS 共享：nfs://<server-ip>/exports/downloads"
echo "Samba 共享：smb://<server-ip>/downloads" 