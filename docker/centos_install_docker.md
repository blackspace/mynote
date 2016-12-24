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

普通用户使用docker client
----------------------------------------------------------------------------------------------------------------
如下面所示：

```
$ sudo ls -l /var/run/docker.sock 
srw-rw---- 1 root root 0 12月 24 13:00 /var/run/docker.sock
```

centos监听的unix socket用户组是root，所以普通用户需要sudo才能和dockerd通信。


###dockerd用组为docker的unix socket监听

编辑/etc/sysconfig/docker文件,在OPTIONS中加入--group=docker

```
OPTIONS='--selinux-enabled --log-driver=journald --group=docker'
```

重起dockerd

```
# systemctl restart docker-latest
# systemctl status docker-latest
● docker-latest.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker-latest.service; enabled; vendor preset: disabled)
   Active: active (running) since 六 2016-12-24 18:49:18 CST; 10s ago
     Docs: http://docs.docker.com
 Main PID: 6099 (dockerd-latest)
   CGroup: /system.slice/docker-latest.service
           ├─6099 /usr/bin/dockerd-latest --add-runtime docker-runc=/usr/libexec/docker/docker-runc --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd -g /var/lib/d...
           └─6107 docker-containerd -l unix:///var/run/docker/libcontainerd/docker-containerd.sock --shim docker-containerd-shim --metrics-interval=0 --start-timeout 2m --state-dir /...

12月 24 18:49:15 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:15.841458974+08:00" level=warning msg="Docker could not enable SELinux on the host system"
12月 24 18:49:15 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:15.869505934+08:00" level=info msg="Graph migration to content-addressability took 0.00 seconds"
12月 24 18:49:15 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:15.872004552+08:00" level=info msg="Loading containers: start."
12月 24 18:49:15 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:15.908037482+08:00" level=info msg="Firewalld running: true"
12月 24 18:49:17 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:17.734740771+08:00" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17....IP address"
12月 24 18:49:18 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:18.392804549+08:00" level=info msg="Loading containers: done."
12月 24 18:49:18 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:18.392965797+08:00" level=info msg="Daemon has completed initialization"
12月 24 18:49:18 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:18.393015789+08:00" level=info msg="Docker daemon" commit=71b8cd3 graphdriver=devicemapper version=1.12.3
12月 24 18:49:18 mycentos dockerd-latest[6099]: time="2016-12-24T18:49:18.408724048+08:00" level=info msg="API listen on /var/run/docker.sock"
12月 24 18:49:18 mycentos systemd[1]: Started Docker Application Container Engine.
Hint: Some lines were ellipsized, use -l to show in full.
```

这时dockerd已经在docker组监听unix socket

```
# ls /var/run/docker.sock  -l
srw-rw---- 1 root docker 0 12月 24 18:49 /var/run/docker.sock
```
普通用户加入docker组
```
# usermod -G docker -a apple
```

注销普通用户，重新登陆。普通用户不用sudo就可以使用docker了

```
$ groups
apple wheel docker
$ docker info
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 1
Server Version: 1.12.3
Storage Driver: devicemapper
 Pool Name: docker-253:0-67160874-pool
 Pool Blocksize: 65.54 kB
 Base Device Size: 10.74 GB
 Backing Filesystem: xfs
 Data file: /dev/loop0
 Metadata file: /dev/loop1
 Data Space Used: 16.91 MB
 Data Space Total: 107.4 GB
 Data Space Available: 48.34 GB
 Metadata Space Used: 585.7 kB
 Metadata Space Total: 2.147 GB
 Metadata Space Available: 2.147 GB
 Thin Pool Minimum Free Space: 10.74 GB
 Udev Sync Supported: true
 Deferred Removal Enabled: false
 Deferred Deletion Enabled: false
 Deferred Deleted Device Count: 0
 Data loop file: /var/lib/docker-latest/devicemapper/devicemapper/data
 WARNING: Usage of loopback devices is strongly discouraged for production use. Use `--storage-opt dm.thinpooldev` to specify a custom block storage device.
 Metadata loop file: /var/lib/docker-latest/devicemapper/devicemapper/metadata
 Library Version: 1.02.135-RHEL7 (2016-09-28)
Logging Driver: journald
Cgroup Driver: systemd
Plugins:
 Volume: local
 Network: null bridge host overlay
Swarm: inactive
Runtimes: docker-runc runc
Default Runtime: docker-runc
Security Options: seccomp
Kernel Version: 4.4.39-1.el7.centos.x86_64
Operating System: CentOS Linux 7 (Core)
OSType: linux
Architecture: x86_64
Number of Docker Hooks: 2
CPUs: 2
Total Memory: 2.691 GiB
Name: mycentos
ID: D47B:PCXG:3XMF:4T43:5ULX:UDFP:XZ6O:XFWP:66AU:UFDT:3DLI:XNIG
Docker Root Dir: /var/lib/docker-latest
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
Insecure Registries:
 127.0.0.0/8
Registries: docker.io (secure)
```






