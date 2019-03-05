SED例子
-----------------------------------------------------------------------------

* h和H例子

		```
		apple@apple-System:~$ sed '2 {h;d};$ G' <<HEREDOC
		1111
		2222
		3333
		4444 
		HEREDOC

		1111
		3333
		4444
		2222
		apple@apple-System:~$ sed '2 {h;d};$ g' <<HEREDOC
		1111
		2222
		3333
		4444
		HEREDOC

		1111
		3333
		2222
		```


		```
		apple@apple-System:~$ sed '1 {h;d};4 {H;d};5 g' <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		2222
		3333
		1111
		4444
		6666
		apple@apple-System:~$ sed '1 {H;d};4 {H;d};5 g' <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		2222
		3333

		1111
		4444
		6666
		apple@apple-System:~$ 
		```


		```
		apple@apple-System:~$ sed '1 {h;d};4 x;6 x' <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		2222
		3333
		1111
		5555
		4444
		apple@apple-System:~$ 
		```


* 反向选择

		```
		apple@apple-System:~$ sed -n '/2/! p'<<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		1111
		3333
		4444
		5555
		6666
		apple@apple-System:~$ 
		```


* N和n的例子

		```
		apple@apple-System:~$ sed  '3 {N;N;s/\n//g}'<<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		1111
		2222
		333344445555
		6666
		apple@apple-System:~$ sed  '=;3 {N;N;s/\n//g}'<<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		1
		1111
		2
		2222
		3
		333344445555
		6
		6666
		apple@apple-System:~$ sed  -n -e '3 {N;N;p}' <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		3333
		4444
		5555
		apple@apple-System:~$ 
		````

		```
		apple@apple-System:~$ sed  '=;3 {n;n;s/\n//g}'<<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		1
		1111
		2
		2222
		3
		3333
		4444
		5555
		6
		6666
		apple@apple-System:~$ sed  -n '3 {n;n;p}'<<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		5555
		apple@apple-System:~$ sed  -n -e '3 {n;n;p}' <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		5555
		```

* T和t的例子

		```
		apple@apple-System:~$ sed -n '{s/3/_/;p;p;t bp;b;:bp p}'  <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		1111
		1111
		2222
		2222
		_333
		_333
		_333
		4444
		4444
		5555
		5555
		6666
		6666
		apple@apple-System:~$ sed -n '{s/3/_/;p;p;T bp;b;:bp p}'  <<HEREDOC
		1111
		2222
		3333
		4444
		5555
		6666
		HEREDOC
		1111
		1111
		1111
		2222
		2222
		2222
		_333
		_333
		4444
		4444
		4444
		5555
		5555
		5555
		6666
		6666
		6666
		````


多命令
------------------------------------------------------------------------

* 特定行多命令

  大括号里不能用i a命令

		```
		$ echo $'sssss\nddddd'|sed '$ { d;d;ad; }'
		sed: -e expression #1, char 0: unmatched `{'
		```
  需要写成多行形式

		```
		$ echo $'sssss\nddddd'|sed '$ { 
		i d
		}'
		sssss
		d
		ddddd
		```

