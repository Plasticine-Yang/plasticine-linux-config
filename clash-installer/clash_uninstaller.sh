#!/bin/sh

# 将 clash 移出 service
echo "将 clash 移出 service..."
sudo systemctl stop clash
sudo systemctl disable clash
sudo rm -rf /etc/systemd/system/clash.service
sudo systemctl daemon-reload

# 移除 clash 可执行文件 & 配置目录
echo "移除 clash 可执行文件 & 配置目录..."
sudo rm -rf /etc/clash/
sudo rm -rf /usr/local/bin/clash

echo "clash 卸载成功"
