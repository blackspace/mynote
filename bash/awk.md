#最简单的例子

```
apple@apple-System:~$ echo 1 2 3 4 | awk 'BEGIN {print "hello"} {print $0,"-->",$1,$2,$3,$4 }  END {print "bye"}' 
hello
1 2 3 4 --> 1 2 3 4
bye
```

NB:如果只有BEGIN，可以不需要输入

```
apple@apple-System:~$ awk 'BEGIN {print "hello"}' 
hello
```


