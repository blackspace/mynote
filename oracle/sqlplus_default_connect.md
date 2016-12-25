windows系统sqlplus默认连接
---------------------------------------------------------
使用下面命令连接oracle时，

```
sqlplus / as sysdba 
```

sqlplus会查找注册表


```
HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\
```

下的的项，根据sqlplus安装的位置，查找不同的项。


在某一个项下，如果有一个以ORACLE_SID为命名的字符串值就使用这个值作为默认的SID名。
