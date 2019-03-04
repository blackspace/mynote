shabang



启动文件加载顺序
===================================================

```
echo $0
```

如果输出 -bash,说明这个shell是登陆shell。



登陆shell

```
/etc/profile
~/.bash_profile
~/.bash_login
~/.profile
```

交互非登陆shell

```
/etc/bashrc
~/.bashrc
```


一个crontab脚本，没经过处理的话，既不是交互式Shell，也不是登录Shell，所以上面的都不会执行。怎么处理？比如可以把shabang改一下#!/bin/bash -l让脚本用登录Shell来解释执行，就可以加载/etc/profile或者，调用Bash解释器，加-l参数也可以。
