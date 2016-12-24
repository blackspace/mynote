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




