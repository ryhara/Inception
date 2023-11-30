FROM debian:bullseye

RUN apt update -y && \
	apt upgrade -y \
	apt install -y php8 \
	php8-fpm \
	php8-mysql \
	php8-mysqli \
	php8-json \
	php8-curl \
	php8-dom \
	php8-exif \
	php8-fileinfo \
	phpb-hash \
	php8-igbinary \
	php-imagick \
	php8-intl \
	php8-mbstring \
	php8-openssl \
	php8-pcre \
	php8-xml \
	php8-zip \
	curl \
	tar \
	wget \
	ca-certificates \
	mariadb-client

# COPY ./conf/.conf /etc/php/8.0/fpm/pool.d/www.conf
# 残りはconf系と、実際に起動して確認

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /tmp/wordpress/setup.sh
RUN chmod +x /tmp/wordpress/setup.sh

COPY ./tools/wordpress-6.4.1.tar.gz /tmp/
EXPOSE 9000

ENTRYPOINT ["/tmp/wordpress/setup.sh"]

