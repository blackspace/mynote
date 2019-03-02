
Ubuntu
===================================================


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


状态板放置系统监视扩展
-----------------------------------------------------------

```
sudo apt install gnome-shell-extension-system-monitor 
gnome-shell-extension-tool --enable-extension
Alt+F2, then r
```







