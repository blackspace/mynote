为什么变量名要双引号引用
--------------------------------------

```
#!/usr/bin/env bash

echo $(pwd)

a="b*"

#用双引号阻止路径名扩展
echo "$a"


#如果不用双引号,会列出当前目录下符合模式的文件名
echo $a
```



bash的保留字
-----------------------------
保留字是一个word，对shell有特定的意义。

这些word在下面的情况下被当作保留字。

* 没有被引用
* 简单命令的第一个word
* case和for命令的一部分时，被认为是保留字。

        ```
        !  case   coproc   do  done elif else esac fi for function if in select
        then until while { } time [[ ]]
        ```


函数的输入输出做为管道
------------------------------------------------

两个函数之间用管道连接：

```
#!/usr/bin/env bash

function B
{
    echo $$ 
}

function C
{
    read bid
    echo B pid is $bid
    echo C pid $$ 
}


B|C
```
执行结果

```
apple@apple-System:~$ ./b.sh
B pid is 4127
C pid 4127
```

用管道符连接多个命令，每个命令为单独的进程
---------------------------------------------

b.sh
```
#!/usr/bin/env bash

echo $$ >&2
```

c.sh
```
#!/usr/bin/env bash

echo $$ >&2
```
执行结果

```
apple@apple-System:~$ ./b.sh|./c.sh
3988
3989
```


bash的空命令
------------------------------------------------

```
: [arguments]

No effect; the command does nothing beyond expanding arguments and performing any specified redirections.  A zero exit code is returned.
```



