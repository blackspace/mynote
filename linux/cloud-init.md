
Ubuntu server 更换主机名
-------------------------------------------------------------



编辑
/var/lib/cloud/seed/nocloud-net/user-data 

```
#cloud-config
growpart: {mode: 'off'}
hostname: cloud-init
locale: en_US.UTF-8
resize_rootfs: false
ssh_pwauth: true
users:
- gecos: apple
  groups: [adm, cdrom, dip, plugdev, lxd, sudo]
  lock-passwd: false
  name: apple
  passwd: $6$MqOIKjnm/E6e2xCA$ZC8iYQ4.tZMkHA4F6fIR43ZIOJ8dw/QdyXglKqzCZ4yuXRyzMVCpTK5ayrTtL0bTkDpUcW3Svt3FLs0t1/vic.
  shell: /bin/bash
```



Ubuntu Server 配置ip
----------------------------------------------------------------

编辑
/etc/cloud/cloud.cfg.d/50-curtin-networking.cfg 


```
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses: [192.168.56.3/24]
      gateway4: 192.168.56.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4] 
```

sudo cloud-init clean
sudo cloud-init init
sudo netplan apply
