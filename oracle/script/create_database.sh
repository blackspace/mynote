mkdir -p ~/my_oracl_data
mkdir -p ~/my_oracl_ctl_log_1
mkdir -p ~/my_oracl_ctl_log_2
mkdir -p ~/my_oracl_archive_log
mkdir -p ~/my_oracl_archive_log_duplex



tee ${ORACLE_HOME:-~}/dbs/initoracl.ora <<EOF 
db_name=oracl
workarea_size_policy=auto
pga_aggregate_target=200M
sga_target=200M
sga_max_size=500M
db_create_file_dest=$HOME/my_oracl_data
db_create_online_log_dest_1=$HOME/my_oracl_ctl_log_1
db_create_online_log_dest_2=$HOME/my_oracl_ctl_log_2
log_archive_dest=$HOME/my_orcal_archive_log
log_archive_duplex_dest=$HOME/my_oracl_archive_duplex
EOF


cat <<EOF
Now you can create database,open the sqlplus and execute the below command:
1. startup nomount
2. create database
3. create spfile from memory;
4. alter system switch logfile;
5. @${ORACLE_HOME}/rdbms/admin/catalog
EOF

