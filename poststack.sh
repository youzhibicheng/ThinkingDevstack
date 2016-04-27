#!/bin/bash
# need to do after devstack

# source admin
source /opt/devstack/openrc admin admin

# upload images, cirros, centos6, centos7
#wget -P images/ http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img
#wget -P images/ http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1603.qcow2
#wget -P images/ http://cloud.centos.org/centos/6/images/CentOS-6-x86_64-GenericCloud-1603.qcow2
openstack image create --disk-format qcow2 --file /home/james/images/cirros-0.3.4-x86_64-disk.img --public cirros
openstack image create --disk-format qcow2 --file /home/james/images/CentOS-6-x86_64-GenericCloud-1603.qcow2 --public centos6
openstack image create --disk-format qcow2 --file /home/james/images/CentOS-7-x86_64-GenericCloud-1603.qcow2 --public centos7

# create keypair and download it into devstack and change the permission
openstack keypair delete thinking-keypair
openstack keypair create thinking-keypair > /opt/devstack/thinking-keypair.pem
chmod 0600 /opt/devstack/thinking-keypair.pem

# add new rule for security group default, for icmp, ssh
openstack security group rule create --proto icmp --src-ip 0.0.0.0/0 default
openstack security group rule create --proto tcp --src-ip 0.0.0.0/0 --dst-port 22 default

# source demo to use
source /opt/devstack/openrc demo demo
