#!/bin/sh

# 前置检查 config.yaml 是否存在
if [ ! -f "config.yaml" ]; then
    echo "config.yaml 文件不存在"
    exit 1
fi

# 确保 clash 配置目录存在
clash_config_path="/etc/clash/"
if [ ! -d "$clash_config_path" ]; then
    echo "clash 配置目录 $clash_config_path 不存在，将自动创建该目录"
    sudo mkdir -p "$clash_config_path"
fi

# 将 clash 作为可执行程序放到公共目录中
echo "将 clash 作为可执行程序放到公共目录中"
sudo cp ./clash /usr/local/bin/
sudo chmod +x /usr/local/bin/clash

# 复制相关配置文件到配置目录中
echo "复制相关配置文件到配置目录中..."
sudo cp ./config.yaml /etc/clash/
sudo cp ./Country.mmdb /etc/clash/

# 将 clash 作为 service 开机启动
echo "将 clash 作为 service 开机启动..."
sudo cp ./clash.service /etc/systemd/system/clash.service
sudo systemctl daemon-reload
sudo systemctl enable clash
sudo systemctl start clash

echo "作为 service 成功，状态信息如下："
sudo systemctl status clash
