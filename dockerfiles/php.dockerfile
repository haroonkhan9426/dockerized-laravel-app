FROM php:8.1-fpm-alpine

WORKDIR /var/www/src_code

COPY ./../src .

RUN docker-php-ext-install pdo_mysql

RUN chown -R www-data:www-data /var/www/src_code


