多行字符串
===============================================

bash的引号本身就能表示多行文本

* 双引号

		```
		$ echo "
		dddd
		dddd
		dddd
		"

		dddd
		dddd
		dddd

		$
		```

* 单引号

		```
		$ echo '
		ddddd
		ddddd
		ddddd
		'

		ddddd
		ddddd
		ddddd
		```
