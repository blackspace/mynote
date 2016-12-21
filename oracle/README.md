sqlplus调整输出
---------------------------------------------------------

```
SQL> col name format a70
SQL> set linesize 300
SQL>
```

或者编辑E:\app\Administrator\product\11.2.0\dbhome_4\sqlplus\admin文件，加入

```
col name format a70
set linesize 300
```


设置oracle管理文件
--------------------------------------------------------------

```
SQL> show parameters db_create

NAME                                 TYPE                   VALUE
------------------------------------ ---------------------- ------------------------------
db_create_file_dest                  string                 d:\my_oracle_data
db_create_online_log_dest_1          string                 d:\my_oracle_ctl_log_1
db_create_online_log_dest_2          string                 d:\my_oracle_ctl_log_2
db_create_online_log_dest_3          string                 d:\my_oracle_ctl_log_3
db_create_online_log_dest_4          string
db_create_online_log_dest_5          string
SQL>

```

使用如下命令修改参数

alter system set db_crete_online_log_dest_1 = 'd:/my_oracle_ctl_log_1'

这个命令即时有效,重启保留设置.



启用归档日志
-----------------------------

查看归档模式

```
SQL> archive log list;
数据库日志模式             非存档模式
自动存档             禁用
存档终点            USE_DB_RECOVERY_FILE_DEST
最早的联机日志序列     7
当前日志序列           11
```

关闭数据库

```
SQL> shutdown immediate
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。
```

启动数据库到mount模式

```
SQL> startup mount
ORACLE 例程已经启动。

Total System Global Area  711430144 bytes
Fixed Size                  1374584 bytes
Variable Size             218105480 bytes
Database Buffers          486539264 bytes
Redo Buffers                5410816 bytes
数据库装载完毕。
```

更改归档模式，并打开数据库

```
SQL> alter database archivelog;

数据库已更改。

SQL> alter database open;

数据库已更改。
```

结果产生E:\app\Administrator\flash_recovery_area\orcl\ARCHIVELOG\2016_12_19\O1_MF_1_11_D5HGKLQK_.ARC文件，数据库已经改变为日志归档模式：


```
SQL> archive log list
数据库日志模式            存档模式
自动存档             启用
存档终点            USE_DB_RECOVERY_FILE_DEST
最早的联机日志序列     7
下一个存档日志序列   11
当前日志序列           11
```


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


```
SQL> drop user apple;

用户已删除。
```

查询用户创建的表

```
SQL> create table tbl1 (name varchar(10));

表已创建。

SQL> select table_name,tablespace_name from user_tables;

TABLE_NAME                                                   TABLESPACE_NAME
------------------------------------------------------------ ------------------------------------------------------------
TBL1                                                         DEVELOPMENT

SQL> select * from tbl1;

未选定行
```

Oracle里的几个号码
-----------------------------------------

日志序列号

```
SQL> select group#,sequence#,status from v$log;

    GROUP#  SEQUENCE# STATUS
---------- ---------- --------------------------------
         1          4 INACTIVE
         2          5 INACTIVE
         3          6 INACTIVE
         4          7 CURRENT
         5          0 UNUSED
```

每次切换日志,改变日志序列号:

```
SQL> alter system switch logfile;

系统已更改。

SQL> select group#,sequence#,status from v$log;

    GROUP#  SEQUENCE# STATUS
---------- ---------- --------------------------------
         1          4 INACTIVE
         2          5 INACTIVE
         3          6 INACTIVE
         4          7 ACTIVE
         5          8 CURRENT
```

系统改变号,


日志里面的SCN

```
SQL> select group#,sequence#,status,first_change# from v$log;

    GROUP#  SEQUENCE# STATUS                           FIRST_CHANGE#
---------- ---------- -------------------------------- -------------
         1          4 INACTIVE                                968669
         2          5 INACTIVE                                984568
         3          6 INACTIVE                               1010148
         4          7 INACTIVE                               1039661
         5          8 CURRENT                                1040091
```


数据文件里面的SCN


```
SQL> select file#,checkpoint_change#,name from v$datafile;

     FILE# CHECKPOINT_CHANGE# NAME
---------- ------------------ ------------------------------------------------------------
         1            1040091 E:\APP\ADMINISTRATOR\ORADATA\ORCL\SYSTEM01.DBF
         2            1040091 E:\APP\ADMINISTRATOR\ORADATA\ORCL\SYSAUX01.DBF
         3            1040091 E:\APP\ADMINISTRATOR\ORADATA\ORCL\UNDOTBS01.DBF
         4            1040091 E:\APP\ADMINISTRATOR\ORADATA\ORCL\USERS01.DBF
         5            1040091 D:\MY_ORACLE_DATA\ORCL\DATAFILE\O1_MF_DEVELOPM_D5GP4V7V_.DBF
```

数据库头的SCN


```
SQL> select name,dbid,checkpoint_change# from V$database;

NAME                                                                         DBID CHECKPOINT_CHANGE#
---------------------------------------------------------------------- ---------- ------------------
ORCL                                                                   1458714295            1041383

SQL>

```

Oracle的跟踪文件
----------------------------------------------------------

```
SQL> show parameters dump

NAME                                 TYPE                   VALUE
------------------------------------ ---------------------- ------------------------------
background_core_dump                 string                 partial
background_dump_dest                 string                 e:\app\administrator\diag\rdbm
                                                            s\orcl\orcl\trace
core_dump_dest                       string                 e:\app\administrator\diag\rdbm
                                                            s\orcl\orcl\cdump
max_dump_file_size                   string                 unlimited
shadow_core_dump                     string                 none
user_dump_dest                       string                 e:\app\administrator\diag\rdbm
                                                            s\orcl\orcl\trace
SQL>
```

Oracle的后台进程
--------------------------------------

```
SQL> show parameter processes;

NAME                                 TYPE                   VALUE
------------------------------------ ---------------------- ------------------------------
aq_tm_processes                      integer                0
db_writer_processes                  integer                1
gcs_server_processes                 integer                0
global_txn_processes                 integer                1
job_queue_processes                  integer                1000
log_archive_max_processes            integer                4
processes                            integer                150

```

sqlplus连接串

```
C:\Users\Administrator>sqlplus sys/123456@//localhost:1521/oracl as sysdba
```



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
