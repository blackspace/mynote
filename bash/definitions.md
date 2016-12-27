bash定义的术语
=====================================================================================
* blank 一个space或者tab
* word 一个字符序列，也就是常说的token
* name 也就是以字母开头，由字母、下划线、数字组成的word
* metacharacter 下面字符当没有被引用并且用来分割word，被认做metacharacter

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
