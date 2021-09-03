#!/bin/bash -f

echo Initialising the Docker swarm
docker swarm init

echo Check we are in the wordpress folder
cd /home/opc/wordpress

echo Deploying the Wordpress stack
docker stack deploy -c wordpress-stack.yml wordpress
