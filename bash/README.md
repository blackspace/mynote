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


bash的3种引用机制
------------------------------------------
* escape character
* single quotes
* double quotes

$  '  \有特定的意义，在双引号中保留$和'的特定意义,以及当\后跟$ ' " \ newline时的特定意义。


函数的输出做为管道
------------------------------------------------

```
#!/usr/bin/env bash

function a
{
    cat <<EOF
dddd
ffff
aaaaa
aaaa
bss
EOF
}

#会输出bss
a|grep b
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

```
apple@apple-System:~$ ./b.sh|./c.sh
3988
3989
```


