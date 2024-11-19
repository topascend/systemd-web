#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 设置systemd-web目录（相对于脚本所在的目录）的权限
# 注意：777权限通常不安全，请根据需要调整
chmod -R 777 "$script_dir/systemd-web"

# 切换到/etc/systemd/system目录并创建符号链接
cd /etc/systemd/system
ln -sf "$script_dir/systemd-web/service/systemd-web.service" systemd-web.service

# 重新加载systemd守护进程并启动服务
sudo systemctl daemon-reload
sudo systemctl start systemd-web.service

# 可选：检查服务状态
# sudo systemctl status systemd-web.service

echo "systemd-web服务已启动（如果之前未启动）。"