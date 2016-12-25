Centos笔记
=============================================================================


启动界面选择
-----------------------------------------------------------------------------

###默认进入控制台界面


```
sudo systemctl set-default multi-user.target 
```

从控制台使用startx命令进入图形界面，centos7默认进入gnome classic模式，如果想进入gnome shell，执行下面命令：

```
echo "exec gnome-session" >> ~/.xinitrc
```


###默认进入图形界面

```
sudo systemctl set-default graphical.target
```

##调节主题


```
In case you are confused over the difference between the Gnome Shell theme and the GTK 3.x theme:

    GTK 3.x theme – the main theme that governs the panel/window border, color, background etc
    Gnome shell theme – the theme that governs the display in the Activity mode (when you click on the Activity button at the top left corner).
```

```
$ gnome-tweak-tool 
```


##按照ntfs支持


```
$ sudo wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
$ sudo yum update
$ sudo yum install ntfs-3g
```

##查询一个已经安装包的安装的文件

```
$  rpm -ql $(rpm -qa|grep jdk1.8.0)
```


##查询一个包文件的文件内容 

```
$ rpm -qlp jdk-8u111-linux-x64.rpm 
```




