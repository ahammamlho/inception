#!/bin/bash

mkdir -p /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
sleep 20

chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

wp core download  --path="/var/www/html" --allow-root

cd /var/www/html
wp config create --dbname=$MARIADB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --path="/var/www/html" --allow-root

# mv wp-config-sample.php wp-config.php
# sed -i  "s/database_name_here/$MARIADB_NAME/1"  wp-config.php
# sed -i  "s/username_here/$MARIADB_USER/1"  wp-config.php
# sed -i  "s/password_here/$MARIADB_PASS/1"  wp-config.php
# sed -i  "s/localhost/$MARIADB_HOST/1"  wp-config.php


wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html" --allow-root
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --path="/var/www/html" --allow-root


sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.3 --nodaemonize

