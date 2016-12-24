git笔记
======================================================



配置全局的git忽略文件
--------------------------------------------

查看是否已经配置全局忽略文件

```
[apple@mycentos ~]$ git config -l
user.email=weiwufeng@sohu.com
user.name=blackspace
push.default=simple
core.excludesfile=/home/apple/.gitignore_global
```

其中，core.excludesfile配置的文件就是全局忽略文件，如果没有这一项可以用下面的命令加入

```
git config --global --add core.excludesfile ~/.gitignore_global
```

给这个全局忽略文集添加下面的内容

```
apple@apple-System:~$ cat .gitignore_global 
*.iml
.idea
*~
```
