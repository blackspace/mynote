不使用密码上传
--------------------------------------------
产生证书

ssh-keygen -t rsa

配置github
Settings-->SSH and GPG keys加入~/.ssh/id_rsa.pub

当前origin地址
https://github.com/blackspace/mynote.git


修改git远端地址
git remote set-url origin git+ssh://git@github.com/blackspace/mynote.git 