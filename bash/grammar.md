bash的语法
=================================================================

bash脚本是由一系列的命令组成，解释器一个命令一个命令的解释执行。
bash有下面四种命令形式：

*简单命令
*管道
*列表
*复合命令



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





