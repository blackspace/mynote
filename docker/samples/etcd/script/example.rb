#! /usr/bin/ruby

require "etcd"

client=Etcd.client(host:"ha",port: 2379)

client.set('/nodes/n1',value:1)

puts client.get("/nodes/n1").value
