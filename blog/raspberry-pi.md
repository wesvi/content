---

title: 树莓派使用
date: 2019-03-01 19:37:38
tags: [raspberry]
categories: [hardware]
description: "树莓派安装使用"
draft: false

---

# 树莓派使用

## 开启root权限

```
sudo passwd root
```

```
sudo nano /etc/ssh/sshd_config
```

**Ctrl + W** 快捷键 搜索 PermitRootLogin without-password

修改 PermitRootLogin without-password 为 PermitRootLogin yes

**Ctrl + O** 快捷键 保存

**Ctrl + X** 快捷键 退出 Nano 编辑器

## 启动并配置WIFI

1. 查看树莓派已经识别的wifi

```
sudo iwlist wlan0 scan
```

2. 用nano工具配置wifi信息

```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```

添加如下代码：

```
network={
    ssid="XXX"
    key_mgmt=WPA-PSK
    psk="XXXXXXXX"
}

network={
    ssid="XXXX"
    key_mgmt=WPA-PSK
    psk="XXXXXXXX"
}
```

3. 最后重启树莓派

```
sudo reboot
```

4. 关闭树莓派

```
sudo poweroff
```

## 静态IP

```
vi /etc/dhcpcd.conf
```

```
# 指定接口 eth0
interface eth0
# 指定静态IP，/24表示子网掩码为 255.255.255.0
static ip_address=192.168.0.180/24
# 路由器/网关IP地址
static routers=192.168.0.1
# 手动自定义DNS服务器
static domain_name_servers=114.114.114.114 8.8.8.8

# 指定接口 wlan0
interface wlan0
# 指定静态IP，/24表示子网掩码为 255.255.255.0
static ip_address=192.168.0.190/24
# 路由器/网关IP地址
static routers=192.168.0.1
# 手动自定义DNS服务器
static domain_name_servers=114.114.114.114 8.8.8.8
```

## Frp配置

[官网](https://github.com/fatedier/frp/blob/master/README_zh.md)

### 服务器

环境为centos 7

[参考](https://diannaobos.com/post/639.html)

```
# 更新

yum update

# 安装

yum install -y wget ntpdate supervisor

# 创建目录

mkdir /etc/frp

#下载frp 0.24.1版本

linux_amd64.tar.gz(Linux64位)

wget https://github.com/fatedier/frp/releases/download/v0.24.1/frp_0.24.1_linux_amd64.tar.gz

# 解压

tar -xzvf frp_0.24.1_linux_amd64.tar.gz

# 复制frps到/etc/frp

cd frp_0.24.1_linux_amd64

cp -f frps /etc/frp

# 赋予执行权限

chmod +x /etc/frp/frps

# 创建frps.ini文件

touch /etc/frp/frps.ini

# 编写参数

vi /etc/frp/frps.ini

# frps.ini
[common]
bind_port = 7000

# 启动 frps

./frps -c ./frps.ini

```

### 客户端

环境为树莓派

```
# 更新

apt-get update

# 安装

apt-get install -y wget ntpdate supervisor

# 创建目录

mkdir /etc/frp

#下载frp 0.24.1版本

linux_arm.tar.gz(Linux64位)

wget https://github.com/fatedier/frp/releases/download/v0.24.1/frp_0.24.1_linux_arm.tar.gz

# 解压

tar -xzvf frp_0.24.1_linux_arm.tar.gz

# 复制frpc到/etc/frp

cd frp_0.24.1_linux_arm

cp -f frpc /etc/frp

# 赋予执行权限

chmod +x /etc/frp/frpc

# 创建frpc.ini文件

touch /etc/frp/frpc.ini

# 编写参数

vi /etc/frp/frpc.ini

# frpc.ini
[common]
server_addr = x.xx.xx.xx
server_port = 7000

[ssh]
type = tcp
local_ip = 192.168.0.190
local_port = 22
remote_port = 6000

[web]
type = http
local_port = 8080
custom_domains = note.wesvi.com
```

### 使用supervisor守护进程，来让frps开机自启、奔溃重启、后台运行

服务器端

```
# systemctl enable supervisord # 开机自启动
# systemctl start supervisord # 启动supervisord服务

# systemctl status supervisord # 查看supervisord服务状态
# ps -ef|grep supervisord # 查看是否存在supervisord进程

创建守护进程文件

touch /etc/supervisord.d/frps.ini

编辑文件

vi /etc/supervisord.d/frps.ini

添加以下参数

[program:frps]

user=root

process_name=%(program_name)s_%(process_num)s

command=/etc/frp/frps -c /etc/frp/frps.ini

startsecs=1

startretries=100

autostart=true

autorestart=true

redirect_stderr=true

stderr_logfile=/tmp/err-frps.log

stderr_logfile_maxbytes=50MB

stderr_logfile_backups=10

stdout_logfile=/tmp/out-frps.log

stdout_logfile_maxbytes=50MB

stdout_logfile_backups=10



启动服务

# systemctl enable supervisord

查看是否启动

# systemctl is-enabled supervisord
enabled

成功之后，就可以使用如下命令管理supervisor服务了

# systemctl stop supervisord
# systemctl start supervisord
# systemctl status supervisord
# systemctl reload supervisord
# systemctl restart supervisord
```

客户端

```
# systemctl enable supervisord # 开机自启动
# systemctl start supervisord # 启动supervisord服务

# systemctl status supervisord # 查看supervisord服务状态
# ps -ef|grep supervisord # 查看是否存在supervisord进程

创建守护进程文件

touch /etc/supervisor/conf.d/frpc.conf

编辑文件

nano /etc/supervisor/conf.d/frpc.conf

添加以下参数

[program:frpc]

user=root

command=/etc/frp/frpc -c /etc/frp/frpc.ini

startsecs=1

startretries=100

autostart=true

autorestart=true

stderr_logfile=/tmp/err-frpc.log

stderr_logfile_maxbytes=50MB

stderr_logfile_backups=10

stdout_logfile=/tmp/out-frpc.log

stdout_logfile_maxbytes=50MB

stdout_logfile_backups=10



保存后，需要对supervisor进行更新

命令：supervisorctl update all

启动（首次使用，请执行一次）

supervisorctl start frpc

重启

supervisorctl restart frpc

停止

supervisorctl stop frpc
```
