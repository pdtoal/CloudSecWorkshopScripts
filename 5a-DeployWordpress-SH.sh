#!/bin/bash -f

echo Updating core OS with latest patches
sudo yum -y update

echo Enabling Addon repository containing Docker packages
sudo yum-config-manager --enable ol7_addons

echo Installing Docker enginer
sudo yum install docker-engine -y

echo Setting Docker to run
sudo systemctl start docker
sudo systemctl enable docker

echo Adding user opc to docker group
sudo usermod -a -G docker opc

echo Configuring firewall for VNC
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp
sudo firewall-cmd --zone=public --permanent --add-masquerade
sudo firewall-cmd --reload