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


bash定义的术语
----------------------------------------------------------------------
* blank 一个space或者tab

* word 一个字符序列，也就是常说的token

* name 也就是以字母开头，由字母、下划线、数字组成的word

* metacharacter 下面字符当没有被应用并且用来分割word，被认做metacharacter

```
|  & ; ( ) < > space tab
```
* control operator 下面word履行控制功能时，被认做control operator

```
|| & && ; ;; ( ) | |& <newline>
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

bash的3种引用机制
------------------------------------------
保留字和原字符都有特别意义，如果需要保留字面意义，需要下面3中bash提供的引用机制

* escape character
* single quotes
* double quotes


```
apple@apple-System:~$ [ 1 \> 2 ]
apple@apple-System:~$
```

$  '  \有特定的意义，在双引号中保留$和'的特定意义,以及当\后跟$ ' " \ newline时的特定意义。



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

条件表达式
------------------------------------------------------

文件测试
```
       -a file
              True if file exists.
       -b file
              True if file exists and is a block special file.
       -c file
              True if file exists and is a character special file.
       -d file
              True if file exists and is a directory.
       -e file
              True if file exists.
       -f file
              True if file exists and is a regular file.
       -g file
              True if file exists and is set-group-id.
       -h file
              True if file exists and is a symbolic link.
       -k file
              True if file exists and its ``sticky'' bit is set.
       -p file
              True if file exists and is a named pipe (FIFO).
       -r file
              True if file exists and is readable.
       -s file
              True if file exists and has a size greater than zero.
       -t fd  True if file descriptor fd is open and refers to a terminal.
       -u file
              True if file exists and its set-user-id bit is set.
       -w file
              True if file exists and is writable.
       -x file
              True if file exists and is executable.
       -G file
              True if file exists and is owned by the effective group id.
       -L file
              True if file exists and is a symbolic link.
       -N file
              True if file exists and has been  modified  since  it  was  last
              read.
       -O file
              True if file exists and is owned by the effective user id.
       -S file
              True if file exists and is a socket.
       file1 -ef file2
              True  if file1 and file2 refer to the same device and inode num‐
              bers.
       file1 -nt file2
              True if file1 is newer (according  to  modification  date)  than
              file2, or if file1 exists and file2 does not.
       file1 -ot file2
              True  if file1 is older than file2, or if file2 exists and file1
              does not.
      -o optname
              True if the shell option optname is enabled.  See  the  list  of
              options  under  the  description  of  the  -o  option to the set
              builtin below.
       -v varname
              True if the shell variable varname is set (has been  assigned  a
              value).
       -R varname
              True  if  the shell variable varname is set and is a name refer‐
              ence.
       -z string
              True if the length of string is zero.
```

字符串测试
```
       string
       -n string
              True if the length of string is non-zero.

       string1 == string2
       string1 = string2
              True if the strings are equal.  = should be used with  the  test
              command  for  POSIX conformance.  When used with the [[ command,
              this performs pattern matching as described above (Compound Com‐
              mands).

       string1 != string2
              True if the strings are not equal.

       string1 < string2
              True if string1 sorts before string2 lexicographically.

       string1 > string2
              True if string1 sorts after string2 lexicographically.
```

算术测试
```

       arg1 OP arg2
              OP  is one of -eq, -ne, -lt, -le, -gt, or -ge.  These arithmetic
              binary operators return true if arg1 is equal to, not equal  to,
              less  than, less than or equal to, greater than, or greater than
              or equal to arg2, respectively.  Arg1 and arg2 may  be  positive
              or negative integers.

```

NB: == = != < > 是测试字符串

```
apple@apple-System:~$ [ 1000 \<  12 ]
apple@apple-System:~$ echo $?
0
apple@apple-System:~$ [ 1000 -lt  12 ]
apple@apple-System:~$ echo $?
1
apple@apple-System:~$ [[ 1000 <  12 ]]
apple@apple-System:~$ echo $?
0
apple@apple-System:~$ [[ 1000 -lt  12 ]]
apple@apple-System:~$ echo $?
1
```
