ruby不同类型的比较
--------------------------------------------
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

ruby的假值
----------------------------------------------
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