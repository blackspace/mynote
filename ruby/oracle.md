安装ruby-oci8
----------------------------------------------------



```
$ gem install ruby-oci8
sudo yum install ruby-devel
```


Quick Start
------------------------------------------------------

```
$ ruby -r oci8 -e "OCI8.new('apple', '111111').exec('select * from t') do |r| puts r.join(','); end"
Warning: NLS_LANG is not set. fallback to US7ASCII.
0.1E1,0.1E1
0.1E1,0.1E1
0.1E1,0.1E1
0.1E1,0.1E1
0.1E1,0.1E1
0.1E1,0.1E1
```



Other gem for oracle
-----------------------------------------------------------

```
$ gem list -r oracle

*** REMOTE GEMS ***

oracle (0.0.1)
oracle-enhanced-enhanced (0.1.7)
oracle-model-generator (0.4.1)
oracle-sql-parser (0.9.0)
oracle_client_installer (1.0.2)
oracle_client_provision (1.0.0)
oracle_ebs_authentication (0.1.3)
oracle_enhanced (1.2.5)
oracle_enhanced_plus_xmltype (0.0.5)
oracle_public_cloud_client (0.5.0)
oracle_query (0.1.6)
oracle_raw (0.2.4)
oracle_to_mysql (1.1.0)
oraclecloud (1.1.0)

```



