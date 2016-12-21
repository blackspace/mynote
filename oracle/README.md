sqlplus�������
---------------------------------------------------------

```
SQL> col name format a70
SQL> set linesize 300
SQL>
```

���߱༭E:\app\Administrator\product\11.2.0\dbhome_4\sqlplus\admin�ļ�������

```
col name format a70
set linesize 300
```


����oracle�����ļ�
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

ʹ�����������޸Ĳ���

alter system set db_crete_online_log_dest_1 = 'd:/my_oracle_ctl_log_1'

������ʱ��Ч,������������.



���ù鵵��־
-----------------------------

�鿴�鵵ģʽ

```
SQL> archive log list;
���ݿ���־ģʽ             �Ǵ浵ģʽ
�Զ��浵             ����
�浵�յ�            USE_DB_RECOVERY_FILE_DEST
�����������־����     7
��ǰ��־����           11
```

�ر����ݿ�

```
SQL> shutdown immediate
���ݿ��Ѿ��رա�
�Ѿ�ж�����ݿ⡣
ORACLE �����Ѿ��رա�
```

�������ݿ⵽mountģʽ

```
SQL> startup mount
ORACLE �����Ѿ�������

Total System Global Area  711430144 bytes
Fixed Size                  1374584 bytes
Variable Size             218105480 bytes
Database Buffers          486539264 bytes
Redo Buffers                5410816 bytes
���ݿ�װ����ϡ�
```

���Ĺ鵵ģʽ���������ݿ�

```
SQL> alter database archivelog;

���ݿ��Ѹ��ġ�

SQL> alter database open;

���ݿ��Ѹ��ġ�
```

�������E:\app\Administrator\flash_recovery_area\orcl\ARCHIVELOG\2016_12_19\O1_MF_1_11_D5HGKLQK_.ARC�ļ������ݿ��Ѿ��ı�Ϊ��־�鵵ģʽ��


```
SQL> archive log list
���ݿ���־ģʽ            �浵ģʽ
�Զ��浵             ����
�浵�յ�            USE_DB_RECOVERY_FILE_DEST
�����������־����     7
��һ���浵��־����   11
��ǰ��־����           11
```


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


```
SQL> drop user apple;

�û���ɾ����
```

��ѯ�û������ı�

```
SQL> create table tbl1 (name varchar(10));

���Ѵ�����

SQL> select table_name,tablespace_name from user_tables;

TABLE_NAME                                                   TABLESPACE_NAME
------------------------------------------------------------ ------------------------------------------------------------
TBL1                                                         DEVELOPMENT

SQL> select * from tbl1;

δѡ����
```

Oracle��ļ�������
-----------------------------------------

��־���к�

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

ÿ���л���־,�ı���־���к�:

```
SQL> alter system switch logfile;

ϵͳ�Ѹ��ġ�

SQL> select group#,sequence#,status from v$log;

    GROUP#  SEQUENCE# STATUS
---------- ---------- --------------------------------
         1          4 INACTIVE
         2          5 INACTIVE
         3          6 INACTIVE
         4          7 ACTIVE
         5          8 CURRENT
```

ϵͳ�ı��,


��־�����SCN

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


�����ļ������SCN


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

���ݿ�ͷ��SCN


```
SQL> select name,dbid,checkpoint_change# from V$database;

NAME                                                                         DBID CHECKPOINT_CHANGE#
---------------------------------------------------------------------- ---------- ------------------
ORCL                                                                   1458714295            1041383

SQL>

```

Oracle�ĸ����ļ�
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

Oracle�ĺ�̨����
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

sqlplus���Ӵ�

```
C:\Users\Administrator>sqlplus sys/123456@//localhost:1521/oracl as sysdba
```



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
