#!/bin/bash

# 檢查是否為 root 用戶
if [ "$EUID" -ne 0 ]; then 
    echo "請使用 root 權限執行此腳本"
    exit 1
fi

# 檢查是否指定了必要的目錄
if [ -z "$EMBY_CONFIG_DIR" ] || [ -z "$EMBY_MEDIA_DIR" ]; then
    echo "錯誤：請指定配置和媒體目錄"
    echo ""
    echo "使用方法："
    echo "方法 1: 直接指定環境變量"
    echo "  EMBY_CONFIG_DIR=/path/to/config EMBY_MEDIA_DIR=/path/to/media [其他參數] ./start.sh"
    echo ""
    echo "方法 2: 使用 .env 文件"
    echo "  1. 複製 .env.example 為 .env"
    echo "  2. 編輯 .env 文件設置您的配置"
    echo "  3. 運行 ./start.sh"
    echo ""
    echo "參數說明："
    echo "  基本設定："
    echo "    EMBY_CONFIG_DIR:    Emby 的配置目錄，用於存儲設置和數據庫"
    echo "    EMBY_MEDIA_DIR:     Emby 的媒體目錄，用於存儲影音檔案"
    echo ""
    echo "  用戶和組設定："
    echo "    EMBY_UID:           Emby 運行的用戶 ID (默認: 1000)"
    echo "    EMBY_GID:           Emby 運行的組 ID (默認: 100)"
    echo "    EMBY_GIDLIST:       額外的組 ID (默認: 100)"
    echo ""
    echo "  網絡設定："
    echo "    EMBY_HTTP_PORT:     HTTP 端口 (默認: 8096)"
    echo "    EMBY_HTTPS_PORT:    HTTPS 端口 (默認: 8920)"
    echo ""
    echo "  系統設定："
    echo "    TZ:                 時區設置 (默認: Asia/Taipei)"
    echo "    EMBY_DEVICE_NAME:   設備名稱 (默認: EmbyServer)"
    echo "    EMBY_SERVER_NAME:   服務器名稱 (默認: EmbyServer)"
    echo "    EMBY_PUBLISHED_SERVER_URL: 公開服務器 URL"
    echo ""
    echo "  資源限制（可選）："
    echo "    EMBY_CPU_LIMIT:     CPU 限制 (默認: 2)"
    echo "    EMBY_MEMORY_LIMIT:  內存限制 (默認: 4G)"
    echo "    EMBY_CPU_RESERVATION: CPU 預留 (默認: 1)"
    echo "    EMBY_MEMORY_RESERVATION: 內存預留 (默認: 2G)"
    echo ""
    echo "例如："
    echo "  EMBY_CONFIG_DIR=/home/user/emby/config EMBY_MEDIA_DIR=/mnt/nas/media ./start.sh"
    echo "  EMBY_CONFIG_DIR=/mnt/ssd/emby/config EMBY_MEDIA_DIR=/mnt/hdd/media EMBY_HTTP_PORT=8080 ./start.sh"
    exit 1
fi

# 創建必要的目錄
echo "創建配置目錄：$EMBY_CONFIG_DIR"
mkdir -p "$EMBY_CONFIG_DIR"
chown ${EMBY_UID:-1000}:${EMBY_GID:-100} "$EMBY_CONFIG_DIR"

echo "創建媒體目錄：$EMBY_MEDIA_DIR"
mkdir -p "$EMBY_MEDIA_DIR"
chown ${EMBY_UID:-1000}:${EMBY_GID:-100} "$EMBY_MEDIA_DIR"

# 使用 docker-compose 啟動 Emby
EMBY_CONFIG_DIR=$EMBY_CONFIG_DIR \
EMBY_MEDIA_DIR=$EMBY_MEDIA_DIR \
EMBY_UID=${EMBY_UID:-1000} \
EMBY_GID=${EMBY_GID:-100} \
EMBY_GIDLIST=${EMBY_GIDLIST:-100} \
EMBY_HTTP_PORT=${EMBY_HTTP_PORT:-8096} \
EMBY_HTTPS_PORT=${EMBY_HTTPS_PORT:-8920} \
TZ=${TZ:-Asia/Taipei} \
EMBY_DEVICE_NAME=${EMBY_DEVICE_NAME:-EmbyServer} \
EMBY_SERVER_NAME=${EMBY_SERVER_NAME:-EmbyServer} \
EMBY_PUBLISHED_SERVER_URL=${EMBY_PUBLISHED_SERVER_URL} \
EMBY_CPU_LIMIT=${EMBY_CPU_LIMIT:-2} \
EMBY_MEMORY_LIMIT=${EMBY_MEMORY_LIMIT:-4G} \
EMBY_CPU_RESERVATION=${EMBY_CPU_RESERVATION:-1} \
EMBY_MEMORY_RESERVATION=${EMBY_MEMORY_RESERVATION:-2G} \
docker-compose up -d

echo ""
echo "Emby 已啟動，可以通過以下地址訪問："
echo "  HTTP:  http://localhost:${EMBY_HTTP_PORT:-8096}"
echo "  HTTPS: https://localhost:${EMBY_HTTPS_PORT:-8920}"
echo ""
echo "目錄位置："
echo "  配置目錄：$EMBY_CONFIG_DIR"
echo "  媒體目錄：$EMBY_MEDIA_DIR"
echo ""
echo "使用提示："
echo "  1. 首次訪問時需要設置管理員帳號"
echo "  2. 在設置中添加媒體庫，選擇對應的媒體目錄"
echo "  3. 等待 Emby 掃描完成媒體檔案"
echo "  4. 可以通過手機 App 或網頁瀏覽器訪問"
echo ""
echo "進階設定："
echo "  1. 如需修改設定，可以編輯 .env 文件"
echo "  2. 修改後重新運行此腳本即可"
echo "  3. 如需備份，請備份配置目錄" 