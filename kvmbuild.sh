#!/bin/bash
# This is a simple script to help configure a normal RHEL, ROCKY8, Alma Linux 
# server in to a Virtualization host with Cockpit management

echo " Starting install process now"

dnf -y update
dnf -y install epel-release
dnf -y groupinstall "Virtualization Host"
dnf -y install cockpit cockpit-machines

systemctl enable --now libvirtd
systemctl enable --now cockpit.socket

firewall-cmd --permanent --add-port=9090/tcp && firewall-cmd --reload

echo "Congratulations! You now have a system configured for KVM virtualization"
echo "to access the Cockpit Web interface, go to the ip address of your LAN"
echo "interface then in your browser go to... https://LAN_IP:9090"
echo "for example https://192.168.0.10:9090"