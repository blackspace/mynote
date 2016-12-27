手动创建Oracle数据库
===============================================================

1. 配置环境变量


		```
		export ORACLE_OWNER=apple
		export ORACLE_HOME=/home/apple/app/apple/product/12.1.0/dbhome_1
		export ORACLE_SID=oracl
		export PATH=$ORACLE_HOME/bin:$PATH
		```

2. 创建参数文件


		```
		$ echo db_name=oracl > /home/apple/app/apple/product/12.1.0/dbhome_1/dbs/initoracl.ora
		```

3. 启动数据失利

		```
		SQL> startup nomount
		```

4. 创建数据库

		```
		SQL> create database;
		```


5. 查询数据库状态

		```
		SQL> select instance_name,status from v$instance;

		INSTANCE_NAME	 STATUS
		---------------- ------------
		oracl		 OPEN
		```

6. 查询物理文件

		```
		SQL> select name from v$datafile;

		NAME
		--------------------------------------------------------------------------------
		/home/apple/app/apple/product/12.1.0/dbhome_1/dbs/dbs1oracl.dbf
		/home/apple/app/apple/product/12.1.0/dbhome_1/dbs/dbx1oracl.dbf
		/home/apple/app/apple/product/12.1.0/dbhome_1/dbs/dbu1oracl.dbf

		SQL> select group#,status,member from v$logfile;

		    GROUP# STATUS  MEMBER
		---------- ------- ----------------------------------------------------------------------------------------------------
			 1	   /home/apple/app/apple/product/12.1.0/dbhome_1/dbs/log1oracl.dbf
			 2	   /home/apple/app/apple/product/12.1.0/dbhome_1/dbs/log2oracl.dbf

		SQL> select status,name from v$controlfile;

		STATUS	NAME
		------- ----------------------------------------------------------------------------------------------------
			/home/apple/app/apple/product/12.1.0/dbhome_1/dbs/cntrloracl.dbf

		SQL> show parameters pfile

		NAME				     TYPE	 VALUE
		------------------------------------ ----------- ------------------------------
		spfile				     string
		```


7. 创建数据库字典

   转到/home/apple/app/apple/product/12.1.0/dbhome_1/rdbms/admin目录下

		```
		SQL> @./catalog
		```
   
   关闭数据库，用upgrade选项启动数据
	
		```
		SQL> shutdown immediate
		SQL> startup upgrade
		```

   查询数据字典

		```
		SQL> select username from dba_users;

		USERNAME
		--------------------------------------------------------------------------------
		SYSKM
		SYSBACKUP
		AUDSYS
		SYSTEM
		OUTLN
		SYSDG
		SYS

		7 rows selected.

		```



删除Oracle数据库
==================================================================================


```
SQL> startup mount exclusive restrict
ORACLE instance started.

Total System Global Area  234881024 bytes
Fixed Size		    2922904 bytes
Variable Size		  176162408 bytes
Database Buffers	   50331648 bytes
Redo Buffers		    5464064 bytes
Database mounted.
SQL> drop database;

Database dropped.

Disconnected from Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options
```
