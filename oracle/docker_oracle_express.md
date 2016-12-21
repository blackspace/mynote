###拉取镜像

```
apple@apple-System:~$ docker pull wnameless/oracle-xe-11g
Using default tag: latest
latest: Pulling from wnameless/oracle-xe-11g
af49a5ceb2a5: Already exists 
8f9757b472e7: Already exists 
e931b117db38: Already exists 
47b5e16c0811: Already exists 
9332eaf1a55b: Already exists 
c7acd40e5fcb: Pull complete 
a92639a21ac4: Pull complete 
Digest: sha256:c0e7d3f2b092aabfd6f606eaa20accf541596a749946bcf8b69af71270d88104
Status: Downloaded newer image for wnameless/oracle-xe-11g:latest

###启动XE

```
apple@apple-System:~$ docker run -it --rm wnameless/oracle-xe-11g
Starting Oracle Net Listener.
Starting Oracle Database 11g Express Edition instance.

/usr/sbin/startup.sh: ignoring /docker-entrypoint-initdb.d/*
```

数据库sys system密码默认oracle
操作系统root密码默认admin

###使用sqlcl连接

```
apple@apple-System:~/sqlcl-4.2.0.16.355.0402-no-jre/sqlcl/bin$ ./sql sys/oracle@//172.17.0.2:1521/xe as sysdba

SQLcl: 发行版 4.2.0 Production, 发行日期 星期四 十二月 22 01:34:34 2016

版权所有 (c) 1982, 2016, Oracle。保留所有权利。

已连接到:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production


SQL> select sysdate from dual;

SYSDATE  
---------
21-12月-16

SQL> 
```