# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mg <mg@student.42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/18 10:43:00 by mg                #+#    #+#              #
#    Updated: 2020/08/03 16:58:42 by mg               ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# debian buster-packports is used for phpmyadmin
FROM      debian:buster-backports
LABEL     maintainer="Michael Giraldo <mgiraldo@student.42.org>"
ARG		DEBIAN_FRONTEND="noninteractive"
RUN		apt-get update && apt-get -y install apt-utils && apt-get -y upgrade	
RUN		apt-get -y install debconf debconf-utils vim dialog openssl curl

# Install PHP   
RUN		apt-get -y install php php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-gettext php-fpdf php-ssh2

# Import dhparam private key and generate SSL private and public keys
COPY	srcs/ssl/dhparam.pem /etc/ssl/private/
COPY	srcs/ssl/openssl.conf /ft_server/openssl/
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -config ft_server/openssl/openssl.conf

# Install nginx and start service
RUN		apt-get -y install nginx-full && service nginx stop

# Install mariadb (mysql) and start service
RUN		apt-get -y install default-mysql-server
COPY	srcs/mysql/db_user_create_script.sql /ft_server/mariadb/
RUN		service mysql start && mysql -u root < ft_server/mariadb/db_user_create_script.sql

# Preseed phpmyadmin settings
RUN  ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmim    phpmyadmin/mysql/app-pass            password\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/mysql/admin-pass          password\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/app-password-confirm      password\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/password-confirm          password\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/remote/port               string    3306\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/mysql/method              select    Unix socket\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/db/dbname                 string    phpmyadmin\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/db/app-user               string    phpmyadmin@localhost\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/mysql/admin-user          string    root\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/internal/skip-preseed     boolean   true\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/reconfigure-webserver     multiselect\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/dbconfig-install          boolean   false\""] &&\
     ["/bin/bash", "-c", "debconf-set-selections <<< \"phpmyadmin    phpmyadmin/database-type             select    mysql\""]

# Install phpmyadmin and wordpress
RUN		service mysql start && service nginx start && service php7.3-fpm start && \
		apt-get -y -t buster-backports install phpmyadmin && apt-get -y install wordpress

# Symbolic link phpymyadmin and wordpres folders to var/www/html
RUN		ln -s /usr/share/phpmyadmin /var/www/html && ln -s /usr/share/wordpress /var/www/html

# Copy wordpress and phpmyadmin nginx configuration files 
COPY	srcs/nginx/default.conf /etc/nginx/sites-available/default

# Copy wordpress configuration files 
COPY	srcs/wordpress/wp-config.php /etc/wordpress/config-localhost.php
WORKDIR	/var/www/html/
RUN 	echo "<?php phpinfo(); ?>" > phpinfo.php

#https://www.digitalocean.com/community/questions/i-installed-nginx-as-root-now-i-can-t-get-permissions-right-to-run-as-another-user
WORKDIR	/
RUN	chown -R www-data:www-data /var/log/nginx && chmod -R 755 /var/log/nginx
RUN	chown -R www-data:www-data /usr/share/wordpress && chmod -R 755 /usr/share/wordpress
RUN	chown -R www-data:www-data /usr/share/phpmyadmin && chmod -R 755 /usr/share/phpmyadmin

# Start FT_SERVER
COPY	srcs/start_ft_server.sh .
RUN		chmod -R 775 start_ft_server.sh
CMD		./start_ft_server.sh && tail -f /dev/null

#NOTES
#https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/#:~:text=CMD%20sets%20default%20command%20and,will%20run%20as%20an%20executable.

EXPOSE 80 443

#BUILD DOCKER IMAGE
#sudo docker build -t ft_server .

#RUN DOCKERFILE
#sudo docker run -it -p80:80 -p443:443 ft_server

#CONNECT TO DOCKER COINTAINER
#sudo docker ps
#sudo docker exec -it [container id] /bin/bash
# sudo docker run -it -p8080:80 -p443:443 ft_server && x-www-browser http://localhost:8080/wordpress/wp-admin/install.php

# http://forums.debian.net/viewtopic.php?f=16&t=127569
# sudo bash setup-mysql -e wordpress localhost
# site title
# username 42worpess
# passsword DIPVE!fEEy*(b16Kay
# 