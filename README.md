# Docker 容器管理系統

這個專案提供了一個完整的 Docker 環境設置腳本，以及多個預配置的 Docker 服務。

## 目錄結構

- `install.sh`: 主要的安裝腳本
- `portainer/`: Portainer 容器管理工具的配置
- `samba/`: Samba 文件共享服務
- `komga/`: Komga 漫畫管理服務
- `metube/`: Metube 下載服務
- `photoshow/`: Photoshow 相冊服務
- `php/`: PHP 開發環境
- `emby/`: Emby 媒體服務

## 安裝說明

1. 下載專案：
```bash
git clone https://github.com/yourusername/docker-containers.git
cd docker-containers
```

2. 執行安裝腳本：
```bash
chmod +x install.sh
sudo ./install.sh
```

3. 安裝完成後，可以通過以下地址訪問 Portainer：
   - https://localhost:9443

## 服務說明

每個服務都有其獨立的目錄，包含：
- Docker Compose 配置文件
- 必要的環境變量設置
- 數據卷配置

## 注意事項

- 請確保系統有足夠的磁盤空間
- 建議使用 Ubuntu 20.04 或更高版本
- 需要 root 權限執行安裝腳本

My practice to setup docker in my linux server
1) Containers are built by {container directory}/build.sh
2) Each container directory has some files:
  - ./Dockerfile
  - ./build.sh - scripts run within container to perform build and configuration 
  - ./start.sh - Container start scripts
  - other folders and files - those are copied to docker container and use to create the container.
