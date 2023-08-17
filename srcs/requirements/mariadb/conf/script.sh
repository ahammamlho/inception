#!/bin/bash

service mysql start 
sleep 10

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db_inc.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> db_inc.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> db_inc.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY $MARIADB_ROOT_PASSWORD;" >> db_inc.sql

echo "FLUSH PRIVILEGES;" >> db_inc.sql

mysql  < db_inc.sql

sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i  "s/#port/port/g"  /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
sleep 10
# SELECT user,host FROM mysql.user;