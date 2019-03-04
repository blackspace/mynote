sudo去掉密码
-----------------------------------------------------------

```
apple@apple-System:/etc/sudoers.d$ sudo cat apple_nopasswd 
apple ALL=(ALL)NOPASSWD:ALL
```

查看分区uuid
---------------------------------

```
$ sudo blkid
```


find
------------------------------------------------------------------------

```
find [-H] [-L] [-P] [-D debugopts] [-Olevel] [starting-point...] [expression]
```

-H -L -P设置如何处理连接

开始点(starting-point)之后是expression,一个表达式由下面的组成：

* Tests
* Actions
* Global options
* Positional options
* Operators

例子：

```
find -mount -iname redis*
```
