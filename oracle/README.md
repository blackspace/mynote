windows�´������ݿ�
--------------------------------------

pfile�ļ�

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
ʵ����ɾ����

C:\Users\Administrator>oradim -new -sid orcl -startmode manual -pfile d:\initorc
l.ora
ʵ���Ѵ�����

C:\Users\Administrator>sqlplus / as sysdba

SQL*Plus: Release 11.2.0.1.0 Production on ������ 12�� 18 23:26:53 2016

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

�����ӵ��������̡�

SQL> startup pfile='d:\initorcl.ora' nomount
ORACLE �����Ѿ�������

Total System Global Area  711430144 bytes
Fixed Size                  1374584 bytes
Variable Size             260048520 bytes
Database Buffers          444596224 bytes
Redo Buffers                5410816 bytes
SQL> create database orcl;

���ݿ��Ѵ�����

SQL>
```

����oracle�����ļ�

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

ʹ�����������޸Ĳ���

alter system set db_crete_online_log_dest_1 = 'd:/my_oracle_ctl_log_1'

������ʱ��Ч,������������.


��ռ����
------------------------------------------

������ռ�
```
create tablespace development;
create temporary tablespace temp_1;
create undo tablespace undotbs_1;
````

ɾ����ռ�
```
drop tablespace development;
drop tablespace temp_1;
drop tablespace undotbs_1;

```

�û�����
------------------------------------------------

�����û�

```
SQL> create user apple identified by 123456 default tablespace development;

�û��Ѵ�����
````

��ʱ�û�û��create sessionȨ��,�޷���½.����connect��ɫ:

```
SQL> grant connect to apple;

��Ȩ�ɹ���
```

��ʱsqlplus�ܵ�½.���֮ǰOracle Sql Developerʹ��sys�ʻ���½,��Ҫ�ٴ��޸�������������,ʹapple�ܹ���½.


��ʱ���ܴ����µı�,����apple resource��ɫ

```
SQL> grant resource to apple;

��Ȩ�ɹ���
```

ɾ���û�,��Ҫ�û��˳����ݿ�

``
SQL> drop user apple;

�û���ɾ����
```



