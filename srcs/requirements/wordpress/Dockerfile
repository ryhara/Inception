FROM debian:bookworm

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y php8.2 \
	php8.2-fpm \
	php8.2-mysql \
	php8.2-curl \
	php8.2-dom \
	php8.2-exif \
	php8.2-fileinfo \
	php8.2-igbinary \
	php8.2-imagick \
	php8.2-intl \
	php8.2-mbstring \
	php8.2-xml \
	php8.2-zip \
	curl \
	tar \
	wget \
	ca-certificates \
	mariadb-client

COPY ./requirements/wordpress/conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./requirements/wordpress/tools/test.html /tmp

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

COPY ./requirements/wordpress/tools/wordpress-6.4.1.tar.gz /tmp/

# 今回時間節約のためはローカルにwordpressのtar.gzを置いているので、wgetはコメントアウト
# RUN wget -O /tmp/wordpress-6.4.1.tar.gz https://wordpress.org/wordpress-6.4.1.tar.gz
# または、以下のコマンドでwordpressをダウンロードすることもできる
# wp core download --path=/var/www/html --locale=ja --allow-root

RUN mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www/html

EXPOSE 9000

ENTRYPOINT ["/tmp/setup.sh"]

CMD ["php-fpm8.2", "-F"]