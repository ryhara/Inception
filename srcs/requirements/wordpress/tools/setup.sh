#!/bin/bash

# tarを使用する場合
# tar -xvzf /tmp/wordpress-6.4.1.tar.gz -C /var/www/html/
# mv /var/www/html/wordpress/* /var/www/html/.
# rm -rf /var/www/html/wordpress
mv /tmp/test.html /var/www/html/

wp cli update --allow-root

sleep 10

wp config create	--path=/var/www/html \
					--allow-root \
					--dbname=$WORDPRESS_DB_NAME \
					--dbuser=$WORDPRESS_DB_USER \
					--dbpass=$WORDPRESS_DB_PASSWORD \
					--dbhost=$WORDPRESS_DB_HOST

wp core install		--allow-root \
					--url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN_USER \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--skip-email \
					--path=/var/www/html/

wp user create		--allow-root \
					$WORDPRESS_USER1 \
					$WORDPRESS_USER1_EMAIL \
					--user_pass=$WORDPRESS_USER1_PASSWORD \
					--role=author \
					--path=/var/www/html/

# wp option update	--allow-root \
# 					--path=/var/www/html/ \
# 					home $WORDPRESS_URL

# wp option update	--allow-root \
# 					--path=/var/www/html/ \
# 					siteurl $WORDPRESS_URL

exec "$@"