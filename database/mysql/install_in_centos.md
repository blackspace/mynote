Centos安装myql
======================================================================

Centos默认没有mysql-server包，需要先按照mysql-community-release


```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
```

然后再安装mysql-server

```
sudo yum install mysql-server
sudo systemctl start mysqld
```
