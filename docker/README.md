docker初体验
==================================

* docker是一种基于容器的计算模型
* docker容器是一个沙盒中的进程

docker的模型是非常实用的模型，能把现有的技术融合在一起解决问题。

docker容器就是主机里的一个进程，这个进程被隔离了，可以在host主机通过如下指令查询这个进程
```
apple@apple-System:~$ ps aux|grep  $(docker inspect -f '{{.State.Pid}}' container-id)
root      5356  0.0  0.0   1188     4 pts/17   Ss+  11:14   0:00 sh
apple     5433  0.0  0.0  15964  1036 pts/21   S+   11:16   0:00 grep --color=auto 5356
apple@apple-System:~$ 
```

docker镜像
--------------------------------------------------------------------------


```
apple@apple-System:/etc/docker$ cat daemon.json 
{"registry-mirrors": ["http://2b5283a6.m.daocloud.io"]}
```
