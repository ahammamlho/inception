#!/bin/bash
ß
service mysql start 
sleep 10

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" > db_inc.sql
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" >> db_inc.sql
echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" >> db_inc.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" >> db_inc.sql

echo "FLUSH PRIVILEGES;" >> db_inc.sql

mysql  < db_inc.sql

sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i  "s/#port/port/g"  /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld


# Setting lower_case_table_names=2 because file system for /var/lib/mysql/ is case y