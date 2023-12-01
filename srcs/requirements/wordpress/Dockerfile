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

# 残りはconf系と、bashの起動は確認　conf追加前は設定できた
# /etc/php/8.2/fpm/php-fpm.conf こいついらないかも

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./tools/test.html /var/www/html/test.html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

COPY ./tools/wordpress-6.4.1.tar.gz /tmp/

# 今回時間節約のためはローカルにwordpressのtar.gzを置いているので、wgetはコメントアウト
# RUN wget -O /tmp/wordpress-6.4.1.tar.gz https://wordpress.org/wordpress-6.4.1.tar.gz

RUN groupadd -r www-data www-data && \
	useradd -r -g www-data www-data && \
	mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www/html

EXPOSE 9000

ENTRYPOINT ["/tmp/setup.sh"]
CMD ["php-fpm8.2", "-F"]