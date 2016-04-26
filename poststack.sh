#!/bin/bash
# need to do after devstack

# source admin
source /opt/devstack/openrc admin admin

# upload images, cirros, centos6, centos7

# create keypair and download it into devstack and change the permission
openstack keypair delete thinking-keypair
openstack keypair create thinking-keypair > /opt/devstack/thinking-keypair.pem

# add new rule for security group default, for icmp, ssh
openstack security group rule create --proto icmp --src-ip 0.0.0.0/0 default
openstack security group rule create --proto tcp --src-ip 0.0.0.0/0 --dst-port 22 default

# source demo to use
source /opt/devstack/openrc demo demo
