#!/bin/bash -f

echo Please enter your student number
read studentnumber
fqdn = "student${studentnumber}.oraclecloudpursuitlabs.com"

echo Run CertBOT Docker container and register certificate
echo "${fqdn}" | sudo docker run -it --rm --name certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" -p 80:80 certbot/certbot certonly --standalone --register-unsafely-without-email --dry-run

# echo Installing OCI CLI
# bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"

# echo Relaunch shell
# exec -l $SHELL

# echo Move the certs and change ownership
# cd /home/opc/wordpress
# sudo sh -c “cp /etc/letsencrypt/archive/${fqdn}/*.pem /home/opc/wordpress”
# sudo chown opc:opc *.pem
