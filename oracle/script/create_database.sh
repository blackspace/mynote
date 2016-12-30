#!/bin/env bash

echo Create Oracle DATABASE
echo ======================

MY_ORACLE=~/myoracle

DATA=$MY_ORACLE/data
CTL_LOG1=$MY_ORACLE/ctl_log_1
CTL_LOG2=$MY_ORACLE/ctl_log_2
ARCHIVE_LOG=$MY_ORACLE/archive_log
ARCHIVE_LOG_DUPLEX=$MY_ORACLE/archive_log_duplex



for d in $DATA $CTL_LOG1 $CTL_LOG2 $ARCHIVE_LOG $ARCHIVE_LOG_DUPLEX;do
    mkdir -p $d
    echo create $d
done

echo --------------------------------


INIT=${ORACLE_HOME:-~}/dbs/init$ORACLE_SID.ora

if [ -f $INIT ];then
    rm $INIT
    echo rm $INIT
    echo -----------------------------
fi

tee $INIT <<EOF 
db_name=orcl
sga_target=200M
sga_max_size=1G
db_create_file_dest=$DATA
db_create_online_log_dest_1=$CTL_LOG1
db_create_online_log_dest_2=$CTL_LOG2
log_archive_dest=$ARCHIVE_LOG
log_archive_duplex_dest=$ARCHIVE_LOG_DUPLEX
EOF

echo 
echo Make a $INIT 
echo --------------------------

cat <<'EOF'
Now you can create database,open the sqlplus and execute the below command:
1. startup nomount
2. create database
3. create spfile from memory;
4. create temporary tablespace temp;
5. alter database default temporary tablespace temp;
6. alter system set sga_target='1g';
7. @?/rdbms/admin/catalog
8. @?/rdbms/admin/catproc.sql
9. alter system switch logfile; 
EOF

