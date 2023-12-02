FROM debian:bookworm

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install -y php8.2 php8.2-mysql wget

# RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

RUN mkdir -p /tmp/adminer
COPY  ./requirements/bonus/adminer/tools/adminer-4.8.1.php /tmp/adminer/adminer.php

RUN chown -R www-data:www-data /tmp/adminer/adminer.php && \
	chmod 755 /tmp/adminer/adminer.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/tmp/adminer/"]


