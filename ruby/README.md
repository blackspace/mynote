ruby不同类型的比较
--------------------------------------------
ruby整数和浮点数比较如果数值相等，则为真
```
apple@apple-System:~$ ruby --version
ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]
apple@apple-System:~$ irb
irb(main):001:0> 1==1.0
=> true
irb(main):002:0> 1.class
=> Fixnum
irb(main):003:0> 1.0.class
=> Float
irb(main):004:0> nil==false
=> false
irb(main):005:0> nil.class
=> NilClass
irb(main):006:0> false.class
=> FalseClass
irb(main):007:0> 
```

nil和nil是相等的
```
apple@apple-System:~/mynote$ irb
irb(main):001:0> nil==nil
=> true
irb(main):002:0> false==false
=> true
irb(main):003:0> 
```

ruby的假值
----------------------------------------------
ruby中只有nil和false是假值
```
apple@apple-System:~$ irb
irb(main):001:0> false || "hi"
=> "hi"
irb(main):002:0> nil || "hi"
=> "hi"
irb(main):003:0> 0 || "hi"
=> 0
irb(main):004:0> "" || "hi"
=> ""
irb(main):005:0> 
```

ruby的单子符
----------------------

ruby里面没有字符类型，所有单字符都是字符串

```
irb(main):001:0> ?a
=> "a"
irb(main):002:0> ?a=="a"
=> true
irb(main):003:0> ?a.class
=> String
irb(main):004:0> ?\n==10
=> false
irb(main):005:0> c = ?\n
=> "\n"
irb(main):006:0> ?\n=="\n"
=> true
irb(main):007:0> puts c

=> nil
irb(main):008:0> 
```
