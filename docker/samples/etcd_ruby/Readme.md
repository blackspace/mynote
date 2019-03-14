curl --cacert /etc/ssl/certs/ca.pem  https://etcd:2379/v2/keys/foo -XPUT -d value=bar -v


cfssl print-defaults config>ca-config.json

cfssl print-defaults csr>ca-csr.json
cfssl gencert -initca ca-csr.json | cfssljson -bare ca 

curl --cacert /etc/ssl/certs/ca.pem --cert client.pem  --key client-key.pem -L https://etcd:2379/v2/keys/foo -XPUT -d value=bar -v
