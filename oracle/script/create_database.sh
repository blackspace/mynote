#!/usr/bin/env bash


MY_ORACLE=~/myoracle

OD_DATA=$MY_ORACLE/data
OD_CTL_LOG1=$MY_ORACLE/ctl_log_1
OD_CTL_LOG2=$MY_ORACLE/ctl_log_2
OD_ARCHIVE_LOG=$MY_ORACLE/archive_log
OD_ARCHIVE_LOG_DUPLEX=$MY_ORACLE/archive_log_duplex

for od in ${!OD*};do
   if [ -d ${!od}  ]; then
       echo $od is exist. 
   else
       mkdir  -vp ${!od}
   fi
done

OLD_DBS_FILES=$(find $ORACLE_HOME/dbs -iname "*$ORACLE_SID*")

if [ -n "$OLD_DBS_FILES" ]; then
    for o in $OLD_DBS_FILES; do
	rm -v $o
    done
fi

PFILE=$ORACLE_HOME/dbs/init$ORACLE_SID.ora

tee $PFILE <<EOF 
db_name=orcl
sga_target=200M
sga_max_size=1G
db_create_file_dest=$OD_DATA
db_create_online_log_dest_1=$OD_CTL_LOG1
db_create_online_log_dest_2=$OD_CTL_LOG2
log_archive_dest=$OD_ARCHIVE_LOG
log_archive_duplex_dest=$OD_ARCHIVE_LOG_DUPLEX
EOF


cat <<'EOF'
Now you can create database,open the sqlplus as sysdba and execute the below command:
1. startup nomount
2. create database;
3. create spfile from memory;
4. create temporary tablespace temp;
5. alter database default temporary tablespace temp;
6. alter system set sga_target='1g';
7. @?/rdbms/admin/catalog
8. @?/rdbms/admin/catproc.sql
9. alter user system identified by oracle
10.connect system/oracle
11.@?/sqlplus/admin/pupbld
12.connect / as sysdba
13.alter system switch logfile; 
EOF




