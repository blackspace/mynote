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
```
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


###XE的进程

```
apple@apple-System:~$ docker top amazing_sammet 
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                3741                3724                0                   01:24               pts/25              00:00:00            /bin/sh -c /usr/sbin/startup.sh && /usr/sbin/sshd -D
apple               3788                3741                0                   01:24               ?                   00:00:00            /u01/app/oracle/product/11.2.0/xe/bin/tnslsnr LISTENER -inherit
apple               3807                3741                0                   01:24               ?                   00:00:00            xe_pmon_XE
apple               3809                3741                0                   01:24               ?                   00:00:00            xe_psp0_XE
apple               3811                3741                0                   01:24               ?                   00:00:00            xe_vktm_XE
apple               3815                3741                0                   01:24               ?                   00:00:00            xe_gen0_XE
apple               3817                3741                0                   01:24               ?                   00:00:00            xe_diag_XE
apple               3819                3741                0                   01:24               ?                   00:00:00            xe_dbrm_XE
apple               3821                3741                0                   01:24               ?                   00:00:00            xe_dia0_XE
apple               3823                3741                0                   01:24               ?                   00:00:00            xe_mman_XE
apple               3825                3741                0                   01:24               ?                   00:00:00            xe_dbw0_XE
apple               3827                3741                0                   01:24               ?                   00:00:00            xe_lgwr_XE
apple               3829                3741                0                   01:24               ?                   00:00:00            xe_ckpt_XE
apple               3831                3741                0                   01:24               ?                   00:00:00            xe_smon_XE
apple               3833                3741                0                   01:24               ?                   00:00:00            xe_reco_XE
apple               3835                3741                0                   01:24               ?                   00:00:00            xe_mmon_XE
apple               3837                3741                0                   01:24               ?                   00:00:00            xe_mmnl_XE
apple               3839                3741                0                   01:24               ?                   00:00:00            xe_d000_XE
apple               3841                3741                0                   01:24               ?                   00:00:00            xe_s000_XE
apple               3843                3741                0                   01:24               ?                   00:00:00            xe_s001_XE
apple               3845                3741                0                   01:24               ?                   00:00:00            xe_s002_XE
apple               3847                3741                0                   01:24               ?                   00:00:00            xe_s003_XE
apple               3855                3741                0                   01:24               ?                   00:00:02            xe_vkrm_XE
apple               3857                3741                0                   01:24               ?                   00:00:00            xe_qmnc_XE
root                3859                3741                0                   01:24               pts/25              00:00:00            /usr/sbin/sshd -D
apple               3892                3741                0                   01:24               ?                   00:00:00            xe_cjq0_XE
apple               3918                3741                0                   01:24               ?                   00:00:00            xe_q000_XE
apple               3927                3741                0                   01:24               ?                   00:00:00            xe_q001_XE
root                4236                4217                0                   01:26               ?                   00:00:00            bash
apple               4413                3741                0                   01:29               ?                   00:00:00            xe_smco_XE
apple               4417                3741                0                   01:29               ?                   00:00:00            xe_w000_XE
apple@apple-System:~$ 
```