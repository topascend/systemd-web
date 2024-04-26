# systemd-web
Systemd 是 Linux 系统工具，用来启动守护进程，已成为大多数发行版的标准配置。然而，对于许多用户来说，命令行操作可能会显得有些繁琐和复杂。这时，Systemd Web便应运而生。它是一个Systemd的Web UI管理系统，通过直观的界面和易用的操作，让用户能够轻松地管理Linux系统和服务。
 
systemctl 是 Systemd 的主命令，用于管理系统。 Systemd Web提供了与systemctl命令相似的功能，包括提供 start(启动), stop(停止), restart(重启), status(查看运行状态), enable(添加到开机启动项), disable(将程序从开机启动中移除)。用户只需在Web界面上点击相应的按钮或输入简单的命令，即可实现对系统和服务的快速管理。
 
 
除了基本的操作功能外，Systemd Web还提供了日志管理功能。通过journalctl命令，用户可以实时滚动显示最新的Unit日志数据，了解系统和服务的运行状态。同时，用户还可以通过Web界面查看历史日志，默认查看1小时前的日志数据，也可以自由修改查看日志的时间范围。具体来说，用户只需在浏览器中输入“http://127.0.0.1:9002/log?app=systemd_web&hourAgo=-1”即可查看历史日志。通过调整URL中的“hourAgo”参数，用户可以方便地查看不同时间段的日志数据。
 
<img src="https://raw.githubusercontent.com/topascend/systemd-web/main/1.png" />
<img src="https://raw.githubusercontent.com/topascend/systemd-web/main/2.png" />
<img src="https://raw.githubusercontent.com/topascend/systemd-web/main/3.png" />
## 使用方法
### 1.systemd-web.yaml 为配置文件,和 systemd-web 放在同一目录下即可。
### 2.  ./systemd-web 即可运行,浏览器访问 http://127.0.0.1:9002
### 建议 systemd-web 配置为 systemd 启动

```
[Unit]
# 单元描述
Description=systemd-web
# 在什么服务启动之后再执行本程序
#After=mysql.service

[Service]
Type=simple
# 程序执行的目录
WorkingDirectory=/mydev/bin/systemd-web
# 启动的脚本命令
ExecStart=/mydev/bin/systemd-web/systemd-web
# 重启条件
Restart=always
# 几秒后重启
RestartSec=5

[Install]
WantedBy=multi-user.target
```
## systemd-web.yaml 配置文件

```
# 服务端口
webPort: ":9002"
# 是否只允许局域网访问
onlyLocalNet: true

# systemd systemctl service 列表
service: [ "systemd-web","nginx","redis","laravel_queue","phpcronjob", "gfapp" ]

# 登录用户 {"username":"password"}
adminUser: { "admin": "123456","user": "abcd" }


```
