==和===的区别
---------------------------------------------------------------
* == 会做类型转换，只要值相等比较就是true
* === 类型不匹配值，比较就是false

```
> apple@apple-System:~$ nodejs
> 1=="1"
true
> 1==1.0
true
> "1"==true
true
> 1=="1"
true
> 0==false
true
> 
```

```
> apple@apple-System:~$ nodejs
> ""==false
true
> ""==0
true
```

null除了和null比较为真外都是false
----------------------------------------------------------------


```
apple@apple-System:~$ nodejs
> null==false
false
> null==null
true
> null==0
false
> null==""
false
> 
```