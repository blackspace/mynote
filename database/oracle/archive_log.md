Oracle
==================================================================


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

```
SQL> alter system switch logfile;
```
