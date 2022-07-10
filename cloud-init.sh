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

echo Configuring firewall for inbound web access
sudo firewall-offline-cmd --zone=public --add-port=8080/tcp
sudo firewall-offline-cmd --zone=public --add-masquerade
sudo systemctl restart firewalld

echo Enabling ocarun user to execute sudo commands
echo "ocarun ALL=(ALL) NOPASSWD:ALL" > /home/opc/101-oracle-cloud-agent-run-command
sudo cp /home/opc/101-oracle-cloud-agent-run-command /etc/sudoers.d/

echo Deploying Wordpress on Docker
sudo /bin/su -c "docker swarm init; mkdir /home/opc/wordpress; cd /home/opc/wordpress; wget https://raw.githubusercontent.com/pdtoal/CloudSecWorkshopScripts/main/wordpress-stack.yml; docker stack deploy -c wordpress-stack.yml wordpress" - opc
