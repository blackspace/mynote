windows下创建数据库
--------------------------------------

pfile文件

```
orcl.__db_cache_size=444596224
orcl.__java_pool_size=8388608
orcl.__large_pool_size=8388608
orcl.__oracle_base='E:\app\Administrator'#ORACLE_BASE set from environment
orcl.__pga_aggregate_target=478150656
orcl.__sga_target=704643072
orcl.__shared_io_pool_size=0
orcl.__shared_pool_size=234881024
orcl.__streams_pool_size=0
*.audit_trail='db'
*.compatible='11.2.0.0.0'
*.db_block_size=8192
orcl.db_create_file_dest='d:\my_oracle_data'
orcl.db_create_online_log_dest_1='d:\my_oracle_ctl_log_1'
orcl.db_create_online_log_dest_2='d:\my_oracle_ctl_log_2'
*.db_domain=''
*.db_name='orcl'
*.db_recovery_file_dest_size=4039114752
*.diagnostic_dest='E:\app\Administrator'
*.dispatchers='(PROTOCOL=TCP) (SERVICE=orclXDB)'
*.local_listener='LISTENER_ORCL'
*.memory_target=1180696576
*.nls_language='SIMPLIFIED CHINESE'
*.nls_territory='CHINA'
*.open_cursors=300
*.processes=150
*.remote_login_passwordfile='EXCLUSIVE'

```


```
C:\Users\Administrator>oradim -delete -sid orcl
实例已删除。

C:\Users\Administrator>oradim -new -sid orcl -startmode manual -pfile d:\initorc
l.ora
实例已创建。

C:\Users\Administrator>sqlplus / as sysdba

SQL*Plus: Release 11.2.0.1.0 Production on 星期日 12月 18 23:26:53 2016

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

已连接到空闲例程。

SQL> startup pfile='d:\initorcl.ora' nomount
ORACLE 例程已经启动。

Total System Global Area  711430144 bytes
Fixed Size                  1374584 bytes
Variable Size             260048520 bytes
Database Buffers          444596224 bytes
Redo Buffers                5410816 bytes
SQL> create database orcl;

数据库已创建。

SQL>
```

设置oracle管理文件

```
SQL> show parameters db_create

NAME                                 TYPE
------------------------------------ ----------------------
VALUE
------------------------------
db_create_file_dest                  string
d:\my_oracle_data
db_create_online_log_dest_1          string
d:\my_oracle_ctl_log_1
db_create_online_log_dest_2          string
d:\my_oracle_ctl_log_2
db_create_online_log_dest_3          string
d:\my_oracle_ctl_log_3
db_create_online_log_dest_4          string

NAME                                 TYPE
------------------------------------ ----------------------
VALUE
------------------------------

db_create_online_log_dest_5          string

```

使用如下命令修改参数

alter system set db_crete_online_log_dest_1 = 'd:/my_oracle_ctl_log_1'

这个命令即时有效,重启保留设置.


表空间管理
------------------------------------------

创建表空间
```
create tablespace development;
create temporary tablespace temp_1;
create undo tablespace undotbs_1;
````

删除表空间
```
drop tablespace development;
drop tablespace temp_1;
drop tablespace undotbs_1;

```

用户管理
------------------------------------------------

创建用户

```
SQL> create user apple identified by 123456 default tablespace development;

用户已创建。
````

此时用户没有create session权限,无法登陆.授予connect角色:

```
SQL> grant connect to apple;

授权成功。
```

此时sqlplus能登陆.如果之前Oracle Sql Developer使用sys帐户登陆,需要再次修改设置连接属性,使apple能够登陆.


此时不能创建新的表,授予apple resource角色

```
SQL> grant resource to apple;

授权成功。
```

删除用户,需要用户退出数据库

``
SQL> drop user apple;

用户已删除。
```



