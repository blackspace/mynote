bash定义的术语
----------------------------------------------------------------------
* blank 一个space或者tab
* word 一个字符序列，也就是常说的token
* name 也就是以字母开头，由字母、下划线、数字组成的word
* metacharacter 下面字符当没有被引用并且用来分割word，被认做metacharacter
        
        |  & ; ( ) < > space tab

* control operator 下面word履行控制功能时，被认做control operator

        || & && ; ;; ( ) | |& <newline>


bash的保留字
-----------------------------
保留字是一个word，对shell有特定的意义。

这些word在下面的情况下被当作保留字。

* 没有被引用
* 简单命令的第一个word
* case和for命令的一部分时，被认为是保留字。

        !  case   coproc   do  done elif else esac fi for function if in select
        then until while { } time [[ ]]



bash的语法
----------------------------------------

bash脚本是由一系列的命令组成，解释器一个命令一个命令的解释执行。
bash有下面四种命令形式：

* 简单命令
* 管道
* 列表
* 复合命令



复合命令
---------------------------------------------------------------------
复合命令有下面形式：

* (list) 
* {list;} 
* ((expression)) 
* [[ expression ]] 
* for name [ [ in [ word ... ] ] ; ] do list ; done
* for (( expr1 ; expr2 ; expr3 )) ; do list ; done
* select name [ in word ] ; do list ; done
* select name [ in word ] ; do list ; done
* if list; then list; [ elif list; then list; ] ... [ else list; ] fi
* while list-1; do list-2; done
* until list-1; do list-2; done
 


() {} (( )) [[ ]] for do done select if then fi while until 在复合命令中是一个token,并不是一个命令。

例如，在命令行输入[[,bash会提示没有输入完整的命令，需要继续输入：

```
$ [[
>
```

而在命令行输入[,bash会报[命令错误：


```
$ [
bash: [: 缺少 `]'
```



Bash invoction
----------------------------------------------------------

bash有三种shell模式


* interactive shell
* login shell
* non-interactive shell



当以login执行bash，bash会安顺序调用

* /etc/profile
* ~/.bash_profile

其中.bash_profile-->.bashrc-->/etc/bashrc


当以interactive模式执行bash，bash只会调用

* .bashrc

其中.bashrc-->/etc/bashrc





		
bash的3种引用机制
-------------------------------------------------------------------

引用的目的是保留下面bash语言元素的字面意义，让bash不把他们做特别的处理

* 特定的字符

  包括:元字符(|  & ; ( ) < > space tab)，历史扩展字符(!)

* 保留字
* 变量扩展



3种引用方式
------------------------------------------------------------------------------
* escape character
   
   保留/后面字符的字面意义(除了<newline>),`/<newline>`对，用来表示行继续。

* single quotes

  保留单引号里面所有字符的字母意义

  $'string'可以在字符串里面加入backslash  escape  sequences

* double quotes

  在双引号中保留$  '  ！特定意义,以及当\后跟$ ' " \ newline时的特定意义。

  $"string"把string转换成当前locae


多行字符串
-------------------------------------------------------------

bash的引号本身就能表示多行文本

* 双引号


		$ echo "
		dddd
		dddd
		dddd
		"

		dddd
		dddd
		dddd

		$


* 单引号


		$ echo '
		ddddd
		ddddd
		ddddd
		'

		ddddd
		ddddd
		ddddd

		



条件表达式
------------------------------------------------------

* 文件测试

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

* 字符串测试


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


* 算术测试


		arg1 OP arg2
		      OP  is one of -eq, -ne, -lt, -le, -gt, or -ge.  These arithmetic
		      binary operators return true if arg1 is equal to, not equal  to,
		      less  than, less than or equal to, greater than, or greater than
		      or equal to arg2, respectively.  Arg1 and arg2 may  be  positive
		      or negative integers.




BTW: == = != < > 是测试字符串

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

Bash扩展
------------------------------------------------------------

1. 大括号扩展
2. 波浪号扩展
3. 参数和变量扩展
4. 命令替换
5. 算术扩展
6. 词分割
7. 路径名扩展



参数和变量扩展
---------------------------------------------------------------------

* ${parameter}
* ${parameter:-word}
* ${parameter:=word}
* ${parameter:?word}
* ${parameter:+word}
* ${parameter:offset}
  ${parameter:offset:length}
* ${!prefix*}
  ${!prefix@}
* ${!name[@]}
  ${!name[*]}
* ${#parameter}
* ${parameter#word}
  ${parameter##word}
* ${parameter%word}
  ${parameter%%word}
* ${parameter/pattern/string}
* ${parameter^pattern}
  ${parameter^^pattern}
  ${parameter,pattern}
  ${parameter,,pattern}




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


bash的空命令
------------------------------------------------

```
: [arguments]

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
