FROM nginx:stable

WORKDIR /etc/nginx/conf.d
COPY nginx/nginx.conf .
RUN mv nginx.conf default.conf

WORKDIR /var/www/src_code

COPY src .

RUN mv .env.example .env




