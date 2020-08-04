# ft_server

# Read Here:
https://harm-smits.github.io/42docs/projects/ft_server

# Take Away: 
"Your Docker container must configure / download / install all the services when you run the docker build command, you ought not configure ANY services or change ANY files after using docker run as this mitigates the entire point of Docker."

# Read Here:
http://nginx.org/en/docs/
http://nginx.org/en/docs/http/ngx_http_core_module.html#listen
http://nginx.org/en/docs/http/ngx_http_core_module.html#location
http://nginx.org/en/docs/http/ngx_http_autoindex_module.html
http://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_pass
http://nginx.org/en/docs/http/ngx_http_ssl_module.html
http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl

# Take Away:
Read the NGINX Documentation to write nginx configuration file

# Read Here: 
https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords=phpmyadmin

** Package phpmyadmin
** buster-backports (web): MySQL web administration tool
** 4:4.9.5+dfsg1-2~bpo10+1: all

# Take Away:
You need to use Debian Buster BACKPORT repos. Read about it here https://backports.debian.org/

# Read Here:
https://hub.docker.com/_/debian

# Take Away:
There is docker tag for "buster-backports" us that. DO NOT USE buster tag for the docker image

EXAMPLE for DOCKERFILE
FROM      debian:buster-backports
 
# Read Here:
https://wiki.debian.org/DebianInstaller/Preseed

#Take Away:
Learn about preseeding answers for question asked during installation
 
#OpenSSL documentation:
https://www.openssl.org/docs/manmaster/man1/

#Mariadb SQL (MySQL) documentation:
https://mariadb.com/kb/en/create-user/

#Take away:
Create wordpess user and dbadmin user that mimic sql root user

#Docker documentation:
https://docs.docker.com/engine/reference/builder/ << Dockerfile reference
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/  << Best practices for writing Dockerfiles
