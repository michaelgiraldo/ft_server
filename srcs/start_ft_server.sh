#   START SERVICES 
apt-get update && apt-get -y upgrade
service mysql start
service nginx start
nginx -t
service php7.3-fpm start
service php7.3-fpm status 

echo "Command to connect to Docker cointainer"
echo "*********************************************"
echo "sudo docker exec -it " $HOSTNAME "/bin/bash"
echo "*********************************************"


echo "Open localhost wordpress and create wpadmin user"
echo "*********************************************"
echo "http://localhost:8080/wordpress/wp-admin/install.php"
echo "*********************************************"
