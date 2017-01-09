
TIMING
---------------------------------------

```
SQL> set timing on
SQL> select * from t;

	 X	    Y
---------- ----------
	 1	    1
	 2	    2
	 3	    3
	 4	    4
	 5	    0
	 6	    6

6 rows selected.

Elapsed: 00:00:00.02
SQL> 
```


AUTOTRACE
----------------------------------------------------------

```
SQL> set autotrace on statistics;
SQL> select * from t;

	 X	    Y
---------- ----------
	 1	    1
	 2	    2
	 3	    3
	 4	    4
	 5	    0
	 6	    6

6 rows selected.

Elapsed: 00:00:00.10

Statistics
----------------------------------------------------------
	102  recursive calls
	  0  db block gets
	143  consistent gets
	  8  physical reads
	  0  redo size
	709  bytes sent via SQL*Net to client
	551  bytes received via SQL*Net from client
	  2  SQL*Net roundtrips to/from client
	  9  sorts (memory)
	  0  sorts (disk)
	  6  rows processed

```


```
SQL> set autotrace traceonly explain
SQL> select * from t;

Execution Plan
----------------------------------------------------------
Plan hash value: 1601196873

--------------------------------------------------------------------------
| Id  | Operation	  | Name | Rows  | Bytes | Cost (%CPU)| Time	 |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |	 |     6 |    36 |     3   (0)| 00:00:01 |
|   1 |  TABLE ACCESS FULL| T	 |     6 |    36 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------
```


V$MYSTAT and V$STATNAME
-----------------------------------------------------

```
SQL>
SQL> desc V$mystat
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID						    NUMBER
 STATISTIC#					    NUMBER
 VALUE						    NUMBER
 CON_ID 					    NUMBER

SQL> desc v$statname
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 STATISTIC#					    NUMBER
 NAME						    VARCHAR2(64)
 CLASS						    NUMBER
 STAT_ID					    NUMBER
 DISPLAY_NAME					    VARCHAR2(64)
 CON_ID 					    NUMBER

SQL> select a.name, b.value from v$statname a,v$mystat b where a.statistic#=b.statistic# and a.name like '%redo size%';

NAME								      VALUE
---------------------------------------------------------------- ----------
redo size							       7796
redo size for lost write detection					  0
redo size for direct writes						  0

```


