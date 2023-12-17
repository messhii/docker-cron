FROM php:8.2-fpm

ENV TZ Asia/Tokyo

COPY ./docker/app/entrypoint.sh /tmp/
COPY ./docker/app/cron.sh /root/script/
COPY ./docker/app/php.ini /usr/local/etc/php/php.ini

RUN apt-get update && \
	apt-get install -y git unzip libzip-dev libicu-dev libonig-dev vim cron && \
	docker-php-ext-install intl pdo_mysql zip bcmath &&\
    echo '* * * * * sh /root/script/cron.sh' > /var/spool/cron/crontabs/root &&\
    crontab /var/spool/cron/crontabs/root
		
COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

ENTRYPOINT ["/tmp/entrypoint.sh"]

WORKDIR /app