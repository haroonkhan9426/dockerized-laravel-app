FROM composer:latest

WORKDIR /var/www/src_code

ENTRYPOINT ["composer"]

