# systemd-web
The system provides users with an intuitive and convenient way to manage system services through a web interface. Users do not need to remember complex command line parameters and command formats. They can easily start, stop, restart, and view the status of services by simply clicking and filling out forms.

该系统通过 Web 界面，为用户提供了一个直观、便捷的方式来管理系统服务。用户无需记住复杂的命令行参数和命令格式，只需通过简单的点击和填写表单，即可轻松实现服务的启动、停止、重启、查看状态等操作。

```
# 服务端口
webPort: ":9002"
# 是否只允许局域网访问
onlyLocalNet: true

# systemd systemctl service 列表
service: [ "nginx","redis","jiacrontab_admin","jiacrontabd", "gfapp","gfapp2","aaaaa" ]

# 登录用户 {"username":"password"}
adminUser: { "admin": "123456","user": "abcd" }

```
