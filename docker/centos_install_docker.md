centos安装docker
========================================================


安装aufs
------------------------------------------------------------------------------------------------------------------------

centos7默认的内核不支持aufs，参照下面的地址

```
https://github.com/bnied/kernel-ml-aufs
```

安装支持aufs的内核。设置启动默认内核 

```
$ sudo grub2-set-default kernel-lt-aufs
```


安装docker
------------------------------------------------------------------------------------------------------------------------
使用yum安装下面的包

```
docker-latest.x86_64 : Automates deployment of containerized applications
```


关闭Selinux
-------------------------------------------------------------------------------------------------------------------

```
$ sudo setenforce 0
```

或者配置
```
[apple@USER-20160810CK selinux]$ cat config 

# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted 
```


hello world
---------------------------------------------------------

```
$ sudo docker run -it busybox echo hello world
hello world
```

NB:centos不能像ubuntu一样，把用户加入docker组，就可以省去上面命令的sudo。

因为centos监听的unix socket用户组是root，如下面所示：

```
[apple@mycentos mynote]$ sudo netstat -lnxp|grep docker
unix  2      [ ACC ]     STREAM     LISTENING     24081    1108/dockerd-latest  /run/docker/libnetwork/4cc5ae0a69787dbf44ac2897452571bd96e170b77cc33045f330d3733131211d.sock
unix  2      [ ACC ]     STREAM     LISTENING     23594    1108/dockerd-latest  /var/run/docker.sock
unix  2      [ ACC ]     STREAM     LISTENING     23093    2138/docker-contain  /var/run/docker/libcontainerd/docker-containerd.sock
[apple@mycentos mynote]$ sudo ls -l /var/run/docker.sock 
srw-rw---- 1 root root 0 12月 24 13:00 /var/run/docker.sock
```


