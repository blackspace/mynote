从源代码安装golang
================================

1. 安装某一个版本的golang

    ```
    sudo yum install golang 
    ```

2. 下载源代码

    ```
    git clone --depth 1 https://github.com/golang/go.git
    ````

3. 编译

    ```
    GOROOT_BOOTSTRAP=/usr/lib/golang ./all.bash
    ```
