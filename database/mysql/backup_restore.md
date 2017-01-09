mysql二进制日志备份恢复过程
===========================================================================================

启用二进制日志
---------------------------------------------------------------------------------------------

1. 查看是否启用二进制

		```
		mysql> show variables like 'log_bin';
		+---------------+-------+
		| Variable_name | Value |
		+---------------+-------+
		| log_bin       | OFF   |
		+---------------+-------+
		1 row in set (0.01 sec)
		```

2. 启用二进制

		```
		# Remove leading # to turn on a very important data integrity option: logging
		# changes to the binary log between backups.
		log_bin
		```
		
		重起mysql

		```
		mysql> show variables like 'log_bin';
		+---------------+-------+
		| Variable_name | Value |
		+---------------+-------+
		| log_bin       | ON    |
		+---------------+-------+
		1 row in set (0.00 sec)
		```
3. 二进制日志存放位置

		```
		mysql> show variables like 'log_bin%';
		+---------------------------------+---------------------------------+
		| Variable_name                   | Value                           |
		+---------------------------------+---------------------------------+
		| log_bin                         | ON                              |
		| log_bin_basename                | /var/lib/mysql/mysqld-bin       |
		| log_bin_index                   | /var/lib/mysql/mysqld-bin.index |
		| log_bin_trust_function_creators | OFF                             |
		| log_bin_use_v1_row_events       | OFF                             |
		+---------------------------------+---------------------------------+
		5 rows in set (0.01 sec)
		```

创建Sample数据库
-------------------------------------------------------------------------


		```
		mysql> grant all on apple.* to 'apple'@'localhost';
		Query OK, 0 rows affected (0.00 sec)
		```

		```
		mysql> create database apple;
		Query OK, 1 row affected (0.01 sec)mysql> use apple
		Database changed
		mysql> create table tbl(col varchar(256));
		Query OK, 0 rows affected (0.29 sec)
		```





		```
		mysql> grant reload on *.* to 'apple'@'localhost';
		Query OK, 0 rows affected (0.00 sec)
		mysql> grant super on  *.* to 'apple'@'localhost';
		Query OK, 0 rows affected (0.00 sec)
		```


完整备份
-----------------------------------------------------------------------------------



```
$ mysqldump --flush-logs apple>backup.sql
$ ls /var/lib/mysql/mysqld-*
/var/lib/mysql/mysqld-bin.000001  /var/lib/mysql/mysqld-bin.000002  /var/lib/mysql/mysqld-bin.000003  /var/lib/mysql/mysqld-bin.index
````

记录日志号


恢复数据库
------------------------------------------------------------------


恢复之前首先要把二进制日志拷贝出来，如果不拷贝出来，二进制日志会记录恢复过程对数据库的修改。把二进制日志转换成文本sql，输入到mysql里面。

```
$ mysqlbinlog /var/lib/mysql/mysqld-bin.000002 > 2.sql
```


```
$ mysql --one-database apple < backup.sql 
$ mysql --one-database apple < 2.sql
```


