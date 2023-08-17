#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

wp core download  --path="/var/www/html" --allow-root

# mv wp-config-sample.php wp-config.php
# sed -i  "s/database_name_here/$DB_NAME/1"  wp-config.php
# sed -i  "s/username_here/$DB_USER/1"  wp-config.php
# sed -i  "s/password_here/$DB_PASS/1"  wp-config.php
# sed -i  "s/localhost/$DB_HOST/1"  wp-config.php

# define('WP_SITEURL','url');

# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html" --allow-root
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --path="/var/www/html" --allow-root


sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.3 --nodaemonize


git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ahammamlho/inception.git
git push -u origin main