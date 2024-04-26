# systemd-web
The system provides users with an intuitive and convenient way to manage system services through a web interface. Users do not need to remember complex command line parameters and command formats. They can easily start, stop, restart, and view the status of services by simply clicking and filling out forms.

该系统通过 Web 界面，为用户提供了一个直观、便捷的方式来管理系统服务。用户无需记住复杂的命令行参数和命令格式，只需通过简单的点击和填写表单，即可轻松实现服务的启动、停止、重启、查看状态等操作。

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
