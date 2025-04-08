#!/bin/bash

# 檢查是否為 root 用戶
if [ "$EUID" -ne 0 ]; then 
    echo "請使用 root 權限執行此腳本"
    exit 1
fi

# 獲取容器 ID
CONTAINER_ID=$(docker ps -q --filter name=metube-all)

if [ -z "$CONTAINER_ID" ]; then
    echo "Metube All-in-One 容器未運行"
    exit 1
fi

# 顯示當前下載目錄的大小
echo "清理前下載目錄大小："
docker exec $CONTAINER_ID du -sh /downloads

# 清理下載目錄
echo "正在清理下載目錄..."
docker exec $CONTAINER_ID rm -rf /downloads/*

# 顯示清理後的目錄大小
echo "清理後下載目錄大小："
docker exec $CONTAINER_ID du -sh /downloads

echo "清理完成！" 