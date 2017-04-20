#!/bin/bash

IFACE=eth0
read MAC </sys/class/net/$IFACE/address
IP_ADDR_ETH0=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{print $1}')

ovs-vsctl add-br br0 -- set bridge br0 other_config:hwaddr=$MAC

ifconfig br0 up
ovs-vsctl add-port br0 eth0
ifconfig eth0 0.0.0.0
ifconfig br0 $IP_ADDR_ETH0
