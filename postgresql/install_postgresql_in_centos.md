centos安装postgresql
=============================================================

1. 安装包

		```
		$ sudo yum install postgresql-server postgresql-contrib
		```


2. 创建数据库数据目录


		```
		$ sudo systemctl status postgresql
		● postgresql.service - PostgreSQL database server
		   Loaded: loaded (/usr/lib/systemd/system/postgresql.service; enabled; vendor preset: disabled)
		   Active: failed (Result: exit-code) since Tue 2016-12-27 16:31:35 CST; 16s ago
		   Process: 4581 ExecStartPre=/usr/bin/postgresql-check-db-dir ${PGDATA} (code=exited, status=1/FAILURE)

		Dec 27 16:31:35 mycentos systemd[1]: Starting PostgreSQL database server...
		Dec 27 16:31:35 mycentos systemd[1]: postgresql.service: control process ex...=1
		Dec 27 16:31:35 mycentos systemd[1]: Failed to start PostgreSQL database server.
		Dec 27 16:31:35 mycentos systemd[1]: Unit postgresql.service entered failed...e.
		Dec 27 16:31:35 mycentos systemd[1]: postgresql.service failed.
		Hint: Some lines were ellipsized, use -l to show in full.
		```

如果遇到上面的问题执行下面的命令，创建数据目录


		```
		$ sudo postgresql-setup initdb
		```
