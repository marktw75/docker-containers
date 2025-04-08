FROM ghcr.io/alexta69/metube:latest

# 安裝 NFS 和 Samba 服務
RUN apt-get update && apt-get install -y \
    nfs-kernel-server \
    samba \
    && rm -rf /var/lib/apt/lists/*

# 配置 NFS
RUN mkdir -p /exports/downloads
RUN echo "/exports/downloads *(rw,sync,no_subtree_check,no_root_squash)" > /etc/exports

# 配置 Samba
RUN echo "[downloads]" >> /etc/samba/smb.conf
RUN echo "   path = /downloads" >> /etc/samba/smb.conf
RUN echo "   browseable = yes" >> /etc/samba/smb.conf
RUN echo "   read only = no" >> /etc/samba/smb.conf
RUN echo "   guest ok = yes" >> /etc/samba/smb.conf

# 啟動腳本
COPY start-services.sh /start-services.sh
RUN chmod +x /start-services.sh

CMD ["/start-services.sh"] 