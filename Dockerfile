FROM debian:jessie

MAINTAINER Igor Shishkin <me@teran.ru>
LABEL application=php5-fpm
LABEL description="nginx and php5-fpm"

RUN apt-get update && \
    apt-get install -y \
      nginx \
      nginx-common \
      nginx-full \
      php5-apcu \
      php5-fpm \
      php5-gd \
      php5-memcache \
      php5-mysql \
      supervisor \
      wget && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/* && \
    mkdir -p /var/www

ADD supervisord.conf /etc/supervisord.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD php5-fpm.ini /etc/php5/fpm/pool.d/www.conf
ADD entrypoint.sh /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
