创建用户
------------------------------------------------------------

```
mysql> grant all on apple.*  to  'apple'@'localhost' identified by '123456';
Query OK, 0 rows affected, 1 warning (0.02 sec)
```




删除用户
------------------------------------------------------------

```
mysql> delete from user where user = 'apple';
Query OK, 1 row affected (0.03 sec)
mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)
```


