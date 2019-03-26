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


swarm
---------------------------------------------------

```
$ sudo docker swarm init --advertise-addr 192.168.56.3
[sudo] password for apple: 
Swarm initialized: current node (oeb32bcwvqeguzfqdekt73lzz) is now a manager.
```


```
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-282v9otxn1hulg06kyl5rvww3mp6wgnyoima1gttdm3ux8rr4y-7xauiqgr9r0jxbnryklbtpu86 192.168.56.3:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

```
sudo docker service create   --replicas 3   --name nginx   --update-delay 10s   nginx:stable
```

$ sudo docker service ls

$ sudo docker service rm j


证书
-----------------------------------------------------



```
$ openssl genrsa --writerand .rnd -out "root-ca.key" 4096


$ openssl req \
          -new -key "root-ca.key" \
          -out "root-ca.csr" -sha256 \
          -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=Swarm Secret Example CA'
```



```
root-ca.cnf文件
[root_ca]
basicConstraints = critical,CA:TRUE,pathlen:1
keyUsage = critical, nonRepudiation, cRLSign, keyCertSign
subjectKeyIdentifier=hash


$ openssl x509 -req -days 3650 -in "root-ca.csr" \
               -signkey "root-ca.key" -sha256 -out "root-ca.crt" \
               -extfile "root-ca.cnf" -extensions \
               root_ca
```

```
$ openssl genrsa -out "site.key" 4096


$ openssl req -new -key "site.key" -out "site.csr" -sha256 \
          -subj '/C=US/ST=CA/L=San Francisco/O=Docker/CN=localhost'

site.cnf文件

[server]
authorityKeyIdentifier=keyid,issuer
basicConstraints = critical,CA:FALSE
extendedKeyUsage=serverAuth
keyUsage = critical, digitalSignature, keyEncipherment
subjectAltName = DNS:localhost, IP:127.0.0.1
subjectKeyIdentifier=hash

$ openssl x509 -req -days 750 -in "site.csr" -sha256 \
    -CA "root-ca.crt" -CAkey "root-ca.key" -CAcreateserial \
    -out "site.crt" -extfile "site.cnf" -extensions server
		  
```	



docker-machine设置默认Registry
export ENGINE_REGISTRY_MIRROR=http://192.168.99.1:5000



File "site-packages/dockerpycreds/store.py", line 25, in __init__
dockerpycreds.errors.InitializationError: docker-credential-secretservice not installed or not available in PATH


$ cat .docker/config.json 
{
	"auths": {
		"https://index.docker.io/v1/": {}
	},
	"HttpHeaders": {
		"User-Agent": "Docker-Client/18.09.2 (linux)"
	},
	"credsStore": "secretservice"
}

https://github.com/docker/docker-credential-helpers/releases

下载相应的包复制到相应的bin目录。



vbox修复uuid问题
--------------------------------------------------------------
删除vbox文件，重新用vdi文件建立虚拟机
