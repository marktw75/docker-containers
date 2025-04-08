#!/bin/bash

# 檢查是否為 root 用戶
if [ "$EUID" -ne 0 ]; then 
    echo "請使用 root 權限執行此腳本"
    exit 1
fi

# 安裝必要的套件
echo "安裝必要的套件..."
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 添加 Docker 官方 GPG 密鑰
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 設置 Docker 倉庫
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# 安裝 Docker
echo "安裝 Docker..."
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# 啟動 Docker 服務
systemctl start docker
systemctl enable docker

# 創建 Docker 網絡
echo "創建 Docker 網絡..."
docker network create docker_network

# 安裝 Portainer
echo "安裝 Portainer..."
docker volume create portainer_data
docker run -d \
    -p 9000:9000 \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

echo "安裝完成！"
echo "Portainer 管理界面可以在 https://localhost:9443 訪問" 