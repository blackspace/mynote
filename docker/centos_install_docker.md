#centos安装docker

##安装aufs

centos7默认的内核不支持aufs，参照下面的地址

```
https://github.com/bnied/kernel-ml-aufs
```

安装支持aufs的内核。设置启动默认内核 

```
$ sudo grub2-set-default kernel-lt-aufs
```


##安装docker

使用yum安装下面的包

```
docker-latest.x86_64 : Automates deployment of containerized applications
```


##关闭Selinux

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


##hello world


```
$ sudo docker run -it busybox echo hello world
hello world
```


