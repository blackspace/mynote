Quick Start
=====================================================


改变镜像源
----------------------------------------------------------

```
sudo sh -c "cat >daemon.json" <<HEREDOC
{ 
  "registry-mirrors": [ "https://kfwkfulq.mirror.aliyuncs.com", 
  "https://2lqq34jg.mirror.aliyuncs.com", 
  "https://pee6w651.mirror.aliyuncs.com", 
  "https://registry.docker-cn.com",
  "http://hub-mirror.c.163.com" ], 
  "dns": ["8.8.8.8","8.8.4.4"] 
}
HEREDOC
sudo systemctl daemon-reload
sudo systemctl restart docker
```

拉取镜像

```
docker pull centos
```

创建容器
----------------------------------------------------------
```
docker run -it centos
```

查看主机里的容器
--------------------------------------------------------------
```
docker ps -a
```



重启已经退出的容器,执行命令
---------------------------------------------------


```
docker restart <CID>
docker exec <CID> <CMD>
```

之后容器状态
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
76a613c77cb1        centos              "/bin/bash"         12 minutes ago      Up 2 minutes                            heuristic_spence

```
