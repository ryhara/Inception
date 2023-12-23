FROM debian:bullseye

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y php7.4 \
	php7.4-fpm \
	php7.4-mysql \
	php7.4-curl \
	php7.4-dom \
	php7.4-exif \
	php7.4-fileinfo \
	php7.4-igbinary \
	php7.4-imagick \
	php7.4-intl \
	php7.4-mbstring \
	php7.4-xml \
	php7.4-zip \
	curl \
	tar \
	wget \
	ca-certificates \
	mariadb-client

COPY ./requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./requirements/wordpress/tools/test.html /tmp

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

# wgetで取得する場合
# RUN wget -O /tmp/wordpress-6.4.1.tar.gz https://wordpress.org/wordpress-6.4.1.tar.gz

# tar使用する場合
# COPY ./requirements/wordpress/tools/wordpress-6.4.1.tar.gz /tmp/
# RUN mkdir -p /var/www/html && \
	# chown -R www-data:www-data /var/www/html && \

RUN mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www/html && \
	wp core download --path=/var/www/html --locale=ja --allow-root

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/tmp/setup.sh"]

CMD ["php-fpm7.4", "-F"]