#!/bin/bash -f

echo Initialising the Docker swarm
docker swarm init

echo Creating a directory for Wordpress files
mkdir /home/opc/wordpress
cd /home/opc/wordpress

echo Downloading the Wordpress stack file
wget https://raw.githubusercontent.com/pdtoal/CloudSecWorkshopScripts/main/wordpress-stack.yml

echo Deploying the Wordpress stack
docker stack deploy -c wordpress-stack.yml wordpress
