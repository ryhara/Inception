#!/bin/bash

tar -xvzf /tmp/wordpress6.4.1.tar.gz -C /var/www/html/
mv /var/www/html/wordpress/* /var/www/html/
rm -rf /var/www/html/wordpress

exec "$@"