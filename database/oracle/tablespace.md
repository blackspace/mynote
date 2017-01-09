查询空余空间
-------------------------------------------------------------

```
SQL> select tablespace_name,bytes from dba_free_space;
```


查询已使用空间
--------------------------------------------------------------

```
SQL> select * from  dba_tablespace_usage_metrics;
```
