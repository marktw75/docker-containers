#!/bin/bash

# 啟動 NFS 服務
service nfs-kernel-server start

# 啟動 Samba 服務
service smbd start

# 啟動 Metube
exec python3 /app/metube.py 