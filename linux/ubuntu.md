
Ubuntu
===================================================


更换源
```
apple@apple:~$ cat /etc/apt/sources.list|grep -E -v  ^\#

deb https://mirrors.aliyun.com/ubuntu/ eoan main restricted

deb https://mirrors.aliyun.com/ubuntu/ eoan-updates main restricted

deb https://mirrors.aliyun.com/ubuntu/ eoan universe
deb https://mirrors.aliyun.com/ubuntu/ eoan-updates universe

deb https://mirrors.aliyun.com/ubuntu/ eoan multiverse
deb https://mirrors.aliyun.com/ubuntu/ eoan-updates multiverse

deb https://mirrors.aliyun.com/ubuntu/ eoan-backports main restricted universe multiverse


deb https://mirrors.aliyun.com/ubuntu/ eoan-security main restricted
deb https://mirrors.aliyun.com/ubuntu/ eoan-security universe
deb https://mirrors.aliyun.com/ubuntu/ eoan-security multiverse

```


包管理
-------------------------------------------------
查询所有已经安装的包

```
dpkg -l
```

查询一个已经安装包的文件

```
dpkg -L  <包名>
```


查询可以安装的包,例如emacs

```
apt-cache search emacs|grep ^emacs
```

查询某个包是否安装

```
 dpkg -l|grep emacs
```

查看加入的PPA

```
ls /etc/apt/sources.list.d/
```

删除PPA
```
sudo apt-add-repository -r ppa:alexey-smirnov/deadbeef 
```


状态板放置系统监视扩展
-----------------------------------------------------------

```
sudo apt install gnome-shell-extension-system-monitor 
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com
```



去掉启动logo
-------------------------------------------------------------

```
GRUB_CMDLINE_LINUX_DEFAULT="text"
sudo update-grub
```

grub启动恢复
------------------------------------------------------------

```
grub-install --root-diretory=./tmp /dev/sda
```

Ubuntu server 启动修复模式
------------------------------------------------------------


Esc进入Grub


mc修改默认的文本编辑器
--------------------------------------------------------------
select-editor
