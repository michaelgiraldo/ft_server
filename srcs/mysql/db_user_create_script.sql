# CREATE wordpress datbase and CREATE user wordpress
# https://wordpress.org/support/article/creating-database-for-wordpress/

CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost';
GRANT ALL PRIVILEGES
ON wordpress.*
TO 'wordpress'@'localhost'
IDENTIFIED BY PASSWORD '*EEC94D54E7FF47D5342385EB2DB45D73C57F6289';
FLUSH PRIVILEGES;

# Create dbamin user with sames privileges as root
CREATE USER 'dbadmin'@'localhost';
GRANT ALL PRIVILEGES
ON *.*
TO 'dbadmin'@'localhost'
IDENTIFIED BY PASSWORD '*452911C4562D3836367E289336A37A779B5BC2EE' WITH GRANT OPTION;
GRANT PROXY ON ''@'%' TO 'dbadmin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

#   NOTES
#   https://ubuntu.com/server/docs/lamp-applications
#   https://mariadb.com/kb/en/grant/
#   https://mariadb.com/kb/en/password/
#   https://www.browserling.com/tools/mariadb-password
#   https://www.cyberciti.biz/faq/how-to-show-list-users-in-a-mysql-mariadb-database/