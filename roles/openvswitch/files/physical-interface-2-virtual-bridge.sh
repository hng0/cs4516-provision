# Add bridge using open vSwitch
ovs-vsctl add-br br0
ovs-vsctl add-port br0 eth0

ifconfig eth0 0
ifconfig br0 10.45.17.2 netmask 255.0.0.0

# Change your df route
route add default gw 192.168.1.1 br0 and 
route del default gw 192.168.1.1 eth0

