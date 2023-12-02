#!/bin/bash


if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
fi
chown -R mysql:mysql /run/mysqld

mysqld & sleep 5

# rootに全てのDBの権限を付与
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
# # wordpressDBを作成
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
# # ryharaにwordpressDBの権限を付与　#最初からuserが作られているのか、コメントアウトでテスト
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# adminer用user
# mysql -u root -p${MYSQL_ROOT_PASSWORD} -e CREATE USER 'adminer'@'adminer.inception-network' IDENTIFIED BY 'password';
# mysql -u root -p${MYSQL_ROOT_PASSWORD} -e GRANT ALL PRIVILEGES ON *.* TO 'adminer'@'adminer.inception-network' WITH GRANT OPTION;
# mysql -u root -p${MYSQL_ROOT_PASSWORD} -e FLUSH PRIVILEGES;


mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown && sleep 5

exec "$@"