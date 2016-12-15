安装
---------------------------------------------
sudo apt install mysql-server

安装完成后，默认创建的数据库

```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.05 sec)
```

mysql数据库里面的表
```
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> show tables;
+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| columns_priv              |
| db                        |
| engine_cost               |
| event                     |
| func                      |
| general_log               |
| gtid_executed             |
| help_category             |
| help_keyword              |
| help_relation             |
| help_topic                |
| innodb_index_stats        |
| innodb_table_stats        |
| ndb_binlog_index          |
| plugin                    |
| proc                      |
| procs_priv                |
| proxies_priv              |
| server_cost               |
| servers                   |
| slave_master_info         |
| slave_relay_log_info      |
| slave_worker_info         |
| slow_log                  |
| tables_priv               |
| time_zone                 |
| time_zone_leap_second     |
| time_zone_name            |
| time_zone_transition      |
| time_zone_transition_type |
| user                      |
+---------------------------+
31 rows in set (0.00 sec)

mysql>
```

安装后的用户

```
mysql> select host,user from user;
+-----------+------------------+
| host      | user             |
+-----------+------------------+
| localhost | debian-sys-maint |
| localhost | mysql.sys        |
| localhost | root             |
+-----------+------------------+
3 rows in set (0.00 sec)

mysql> 
```

创建用户
------------------------------------------------------------
mysql> grant all on apple.*  to  'apple'@'localhost' identified by '123456';
Query OK, 0 rows affected, 1 warning (0.02 sec)




删除用户
------------------------------------------------------------
mysql> delete from user where user = 'apple';
Query OK, 1 row affected (0.03 sec)
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)




创建数据
-------------------------------------------------------------
mysql> create database apple;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| apple              |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql>


mysql-server的安装文件
-----------------------------------------------
```
apple@apple-System:~$ dpkg -L mysql-server
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/mysql-server
/usr/share/doc/mysql-server/copyright
/usr/share/doc/mysql-server/changelog.Debian.gz
/usr/share/doc/mysql-server/NEWS.Debian.gz
apple@apple-System:~$ dpkg -L mysql-server-5.7
/.
/lib
/lib/systemd
/lib/systemd/system
/lib/systemd/system/mysql.service
/etc
/etc/apparmor.d
/etc/apparmor.d/usr.sbin.mysqld
/etc/logrotate.d
/etc/logrotate.d/mysql-server
/etc/logcheck
/etc/logcheck/ignore.d.server
/etc/logcheck/ignore.d.server/mysql-server-5_7
/etc/logcheck/ignore.d.workstation
/etc/logcheck/ignore.d.workstation/mysql-server-5_7
/etc/logcheck/ignore.d.paranoid
/etc/logcheck/ignore.d.paranoid/mysql-server-5_7
/etc/mysql
/etc/mysql/mysql.cnf
/etc/mysql/debian-start
/etc/mysql/mysql.conf.d
/etc/mysql/mysql.conf.d/mysqld_safe_syslog.cnf
/etc/mysql/mysql.conf.d/mysqld.cnf
/etc/init
/etc/init/mysql.conf
/etc/init.d
/etc/init.d/mysql
/var
/var/lib
/var/lib/mysql-upgrade
/usr
/usr/lib
/usr/lib/mysql
/usr/lib/mysql/plugin
/usr/lib/mysql/plugin/mypluglib.so
/usr/lib/mysql/plugin/keyring_file.so
/usr/lib/mysql/plugin/libmemcached.so
/usr/lib/mysql/plugin/semisync_slave.so
/usr/lib/mysql/plugin/auth_socket.so
/usr/lib/mysql/plugin/validate_password.so
/usr/lib/mysql/plugin/adt_null.so
/usr/lib/mysql/plugin/innodb_engine.so
/usr/lib/mysql/plugin/semisync_master.so
/usr/lib/mysql/plugin/mysql_no_login.so
/usr/lib/mysql/plugin/version_token.so
/usr/lib/mysql/plugin/locking_service.so
/usr/lib/mysql/plugin/rewriter.so
/usr/lib/mysql/resolve_stack_dump
/usr/lib/mysql/zlib_decompress
/usr/lib/mysql/lz4_decompress
/usr/share
/usr/share/apport
/usr/share/apport/package-hooks
/usr/share/apport/package-hooks/source_mysql-5.7.py
/usr/share/man
/usr/share/man/man1
/usr/share/man/man1/perror.1.gz
/usr/share/man/man1/resolveip.1.gz
/usr/share/man/man1/mysql_plugin.1.gz
/usr/share/man/man1/myisampack.1.gz
/usr/share/man/man1/mysql_secure_installation.1.gz
/usr/share/man/man1/mysqlbinlog.1.gz
/usr/share/man/man1/mysqld_safe.1.gz
/usr/share/man/man1/mysql_ssl_rsa_setup.1.gz
/usr/share/man/man1/zlib_decompress.1.gz
/usr/share/man/man1/lz4_decompress.1.gz
/usr/share/man/man1/resolve_stack_dump.1.gz
/usr/share/man/man1/mysqld_multi.1.gz
/usr/share/man/man1/myisamchk.1.gz
/usr/share/man/man1/replace.1.gz
/usr/share/man/man1/myisamlog.1.gz
/usr/share/man/man1/mysql_tzinfo_to_sql.1.gz
/usr/share/doc
/usr/share/doc/mysql-server-5.7
/usr/share/doc/mysql-server-5.7/examples
/usr/share/doc/mysql-server-5.7/examples/my-default.cnf
/usr/share/doc/mysql-server-5.7/examples/magic
/usr/share/doc/mysql-server-5.7/examples/daemon_example.ini
/usr/share/doc/mysql-server-5.7/copyright
/usr/share/doc/mysql-server-5.7/README.Debian.gz
/usr/share/doc/mysql-server-5.7/NEWS.Debian.gz
/usr/share/doc/mysql-server-5.7/mysqld.sym.gz
/usr/share/mysql
/usr/share/mysql/mysql-systemd-start
/usr/share/mysql/errmsg-utf8.txt
/usr/share/mysql/uninstall_rewriter.sql
/usr/share/mysql/echo_stderr
/usr/share/mysql/docs
/usr/share/mysql/docs/INFO_SRC
/usr/share/mysql/docs/INFO_BIN
/usr/share/mysql/install_rewriter.sql
/usr/share/mysql/debian_create_root_user.sql
/usr/share/mysql/mysql_test_data_timezone.sql
/usr/share/mysql/mysqld_multi.server
/usr/share/mysql/mysql_sys_schema.sql
/usr/share/lintian
/usr/share/lintian/overrides
/usr/share/lintian/overrides/mysql-server-5.7
/usr/bin
/usr/bin/mysqld_multi
/usr/bin/myisamlog
/usr/bin/perror
/usr/bin/mysql_plugin
/usr/bin/mysql_secure_installation
/usr/bin/mysqlbinlog
/usr/bin/mysql_ssl_rsa_setup
/usr/bin/replace
/usr/bin/mysql_tzinfo_to_sql
/usr/bin/resolveip
/usr/bin/myisamchk
/usr/bin/mysqld_safe
/usr/bin/myisampack
/usr/share/doc/mysql-server-5.7/changelog.Debian.gz
apple@apple-System:~$ 
```

mysql-server的配置文件
--------------------------------------------------------------

```
apple@apple-System:/etc/mysql/mysql.conf.d$ cat mysqld.cnf 
#
# The MySQL database server configuration file.
#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

# This will be passed to all mysql clients
# It has been reported that passwords should be enclosed with ticks/quotes
# escpecially if they contain "#" chars...
# Remember to edit /etc/mysql/debian.cnf when changing the socket location.

# Here is entries for some specific programs
# The following values assume you have at least 32M ram

[mysqld_safe]
socket		= /var/run/mysqld/mysqld.sock
nice		= 0

[mysqld]
#
# * Basic Settings
#
user		= mysql
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
port		= 3306
basedir		= /usr
datadir		= /var/lib/mysql
tmpdir		= /tmp
lc-messages-dir	= /usr/share/mysql
skip-external-locking
#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address		= 127.0.0.1
#
# * Fine Tuning
#
key_buffer_size		= 16M
max_allowed_packet	= 16M
thread_stack		= 192K
thread_cache_size       = 8
# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
myisam-recover-options  = BACKUP
#max_connections        = 100
#table_cache            = 64
#thread_concurrency     = 10
#
# * Query Cache Configuration
#
query_cache_limit	= 1M
query_cache_size        = 16M
#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# As of 5.1 you can enable the log at runtime!
#general_log_file        = /var/log/mysql/mysql.log
#general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
#log_slow_queries	= /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes
#
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
#server-id		= 1
#log_bin			= /var/log/mysql/mysql-bin.log
expire_logs_days	= 10
max_binlog_size   = 100M
#binlog_do_db		= include_database_name
#binlog_ignore_db	= include_database_name
#
# * InnoDB
#
# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
# Read the manual for more InnoDB related options. There are many!
#
# * Security Features
#
# Read the manual, too, if you want chroot!
# chroot = /var/lib/mysql/
#
# For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
#
# ssl-ca=/etc/mysql/cacert.pem
# ssl-cert=/etc/mysql/server-cert.pem
# ssl-key=/etc/mysql/server-key.pem
apple@apple-System:/etc/mysql/mysql.conf.d$ 
```


从上面的配置文件可以看到

* 数据文件目录是/var/lib/mysql
* 错误日志 /var/log/mysql/error.log
* 二进制日志没有开启，二进制文件/var/log/mysql/mysql-bin.log


日志文件
---------------------------------------------------
刚刚安装后，日志目录的内容:

```
apple@apple-System:/etc/mysql/mysql.conf.d$ ls /var/log/mysql
error.log
```

去掉server-id和log-bin前的注释符合，重启mysql，日志文件目录的内容

```
apple@apple-System:/etc/mysql/mysql.conf.d$ ls /var/log/mysql/
error.log  mysql-bin.000001  mysql-bin.index
apple@apple-System:/etc/mysql/mysql.conf.d$ 
```

查看二进制文件内容
------------------------------------------------

创建一个表

```
mysql> create table tbl (c1 char(10));
Query OK, 0 rows affected (0.32 sec)
````

使用mysqlbinlog查看二进制文件内容

```
apple@apple-System:/var/log/mysql$ sudo mysqlbinlog mysql-bin.000001 
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 4
#161215 20:39:59 server id 1  end_log_pos 123 CRC32 0x7dc0384a 	Start: binlog v 4, server v 5.7.16-0ubuntu0.16.04.1-log created 161215 20:39:59 at startup
# Warning: this binlog is either in use or was not closed properly.
ROLLBACK/*!*/;
BINLOG '
H49SWA8BAAAAdwAAAHsAAAABAAQANS43LjE2LTB1YnVudHUwLjE2LjA0LjEtbG9nAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAfj1JYEzgNAAgAEgAEBAQEEgAAXwAEGggAAAAICAgCAAAACgoKKioAEjQA
AUo4wH0=
'/*!*/;
# at 123
#161215 20:39:59 server id 1  end_log_pos 154 CRC32 0x19977d8a 	Previous-GTIDs
# [empty]
# at 154
#161215 20:57:25 server id 1  end_log_pos 219 CRC32 0xae6503e2 	Anonymous_GTID	last_committed=0	sequence_number=1
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 219
#161215 20:57:25 server id 1  end_log_pos 325 CRC32 0x3f10298b 	Query	thread_id=5	exec_time=1	error_code=0
use `apple`/*!*/;
SET TIMESTAMP=1481806645/*!*/;
SET @@session.pseudo_thread_id=5/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1/*!*/;
SET @@session.sql_mode=1436549152/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C utf8 *//*!*/;
SET @@session.character_set_client=33,@@session.collation_connection=33,@@session.collation_server=8/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
create table tbl (c1 char(10))
/*!*/;
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
apple@apple-System:/var/log/mysql$ 
```

插入一行
```
mysql> insert into tbl(c1) values('ddddd');
Query OK, 1 row affected (0.08 sec)
```

二进制日志加入下面内容

```
#161215 21:11:13 server id 1  end_log_pos 845 CRC32 0x1fa89f7a 	Xid = 10
COMMIT/*!*/;
# at 845
#161215 21:12:07 server id 1  end_log_pos 910 CRC32 0x2bea95a0 	Anonymous_GTID	last_committed=3	sequence_number=4
SET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;
# at 910
#161215 21:12:07 server id 1  end_log_pos 983 CRC32 0xba58c65c 	Query	thread_id=5	exec_time=0	error_code=0
SET TIMESTAMP=1481807527/*!*/;
BEGIN
/*!*/;
# at 983
#161215 21:12:07 server id 1  end_log_pos 1032 CRC32 0x8f0596fb 	Table_map: `apple`.`tbl` mapped to number 108
# at 1032
#161215 21:12:07 server id 1  end_log_pos 1074 CRC32 0xbfbfd414 	Write_rows: table id 108 flags: STMT_END_F

BINLOG '
p5ZSWBMBAAAAMQAAAAgEAAAAAGwAAAAAAAEABWFwcGxlAAN0YmwAAf4C/goB+5YFjw==
p5ZSWB4BAAAAKgAAADIEAAAAAGwAAAAAAAEAAgAB//4FZGRkZGQU1L+/
'/*!*/;
# at 1074
```


备份数据库
--------------------------------------------------------

```
apple@apple-System:/var/log/mysql$ mysqldump -p apple
Enter password: 
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: apple
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl`
--

DROP TABLE IF EXISTS `tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl` (
  `c1` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl`
--

LOCK TABLES `tbl` WRITE;
/*!40000 ALTER TABLE `tbl` DISABLE KEYS */;
INSERT INTO `tbl` VALUES ('ddddd'),('ddddd'),('ddddd');
/*!40000 ALTER TABLE `tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-15 21:19:35
apple@apple-System:/var/log/mysql$ 
```

