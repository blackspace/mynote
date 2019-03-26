
修改microk8s的镜像
----------------------------------------------------------

$ ls /var/snap/microk8s/437/args
dockerd             etcd                     kubelet
docker-daemon.json  kube-apiserver           kube-proxy
dockerd-env         kube-controller-manager  kube-scheduler

注意：这里路径是/var


sudo vi docker-daemon.json 

$ cat docker-daemon.json 
{
  "insecure-registries" : ["localhost:32000"],
  "registry-mirrors": [ "https://kfwkfulq.mirror.aliyuncs.com",
  "https://2lqq34jg.mirror.aliyuncs.com",
  "https://pee6w651.mirror.aliyuncs.com",
  "https://registry.docker-cn.com",
  "http://hub-mirror.c.163.com" ],
  "dns": ["8.8.8.8","8.8.4.4"]
}

$ sudo systemctl start snap.microk8s.daemon-docker

$ microk8s.docker pull ubuntu



部署
--------------------------------------------------------------------
microk8s.kubectl run nginx --image nginx --replicas 3


创建一个service
---------------------------------------------------------------------
microk8s.kubectl expose deployment nginx --port 80 --target-port 80 --type ClusterIP --selector=run=nginx --name nginx 

```
-A KUBE-PORTALS-CONTAINER -d 10.152.183.180/32 -p tcp -m comment --comment "default/nginx:" -m tcp --dport 80 -j REDIRECT --to-ports 38715
```

修改microk8s.docker的监听地址
-------------------------------------------------------------------------------

编辑
/var/snap/microk8s/437/args/dockerd

```
--add-runtime nvidia=${SNAP}/usr/bin/nvidia-container-runtime
-H unix://${SNAP_DATA}/docker.sock
-H tcp://127.0.0.1:2375
--exec-root ${SNAP_COMMON}/var/run/docker
--graph ${SNAP_COMMON}/var/lib/docker
--pidfile ${SNAP_COMMON}/docker-pid
--config-file=${SNAP_DATA}/args/docker-daemon.json
```

export DOCKER_HOST=tcp://127.0.0.1:2375
