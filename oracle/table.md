查看表使用的空间
---------------------------------------

```
select
   segment_name           table_name,
   sum(bytes)/(1024*1024) table_size_meg
from
   user_extents
where 
   segment_type='TABLE'
and
   segment_name = 'MYTAB'
```
