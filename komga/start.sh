#!/bin/bash

# 檢查是否為 root 用戶
if [ "$EUID" -ne 0 ]; then 
    echo "請使用 root 權限執行此腳本"
    exit 1
fi

# 檢查是否指定了必要的目錄
if [ -z "$KOMPGA_CONFIG_DIR" ] || [ -z "$KOMPGA_DATA_DIR" ]; then
    echo "錯誤：請指定配置和數據目錄"
    echo ""
    echo "使用方法："
    echo "KOMPGA_CONFIG_DIR=/path/to/config KOMPGA_DATA_DIR=/path/to/data ./start.sh"
    echo ""
    echo "參數說明："
    echo "  KOMPGA_CONFIG_DIR: Komga 的配置目錄，用於存儲設置和數據庫"
    echo "  KOMPGA_DATA_DIR:   Komga 的數據目錄，用於存儲漫畫檔案"
    echo ""
    echo "例如："
    echo "  KOMPGA_CONFIG_DIR=/home/user/komga/config KOMPGA_DATA_DIR=/home/user/komga/data ./start.sh"
    echo "  KOMPGA_CONFIG_DIR=/mnt/nas/komga/config KOMPGA_DATA_DIR=/mnt/nas/komga/data ./start.sh"
    exit 1
fi

# 創建必要的目錄
echo "創建配置目錄：$KOMPGA_CONFIG_DIR"
mkdir -p "$KOMPGA_CONFIG_DIR"
chown 1000:1000 "$KOMPGA_CONFIG_DIR"

echo "創建數據目錄：$KOMPGA_DATA_DIR"
mkdir -p "$KOMPGA_DATA_DIR"
chown 1000:1000 "$KOMPGA_DATA_DIR"

# 使用 docker-compose 啟動 Komga
KOMPGA_CONFIG_DIR=$KOMPGA_CONFIG_DIR KOMPGA_DATA_DIR=$KOMPGA_DATA_DIR docker-compose up -d

echo ""
echo "Komga 已啟動，可以通過 http://localhost:8341 訪問"
echo ""
echo "目錄位置："
echo "  配置目錄：$KOMPGA_CONFIG_DIR"
echo "  數據目錄：$KOMPGA_DATA_DIR"
echo ""
echo "使用提示："
echo "  1. 將漫畫檔案（zip/cbr/cbz）放入數據目錄"
echo "  2. 在 Komga 網頁界面中點擊 '添加圖書館'"
echo "  3. 選擇數據目錄作為圖書館位置"
echo "  4. 等待 Komga 掃描完成"
