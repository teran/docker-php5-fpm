FROM nginx

MAINTAINER Igor Shishkin <me@teran.ru>
LABEL application=php5-fpm
LABEL description="nginx and php5-fpm"

RUN apt-get update && \
    apt-get dist-upgrade -y

RUN apt-get install -y \
    php5-apcu \
    php5-fpm \
    php5-gd \
    php5-memcache \
    php5-mysql \
    wget && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/* && \
    mkdir -p /var/www

ADD nginx.conf /etc/nginx/nginx.conf
ADD php5-fpm.ini /etc/php5/fpm/pool.d/www.conf
ADD entrypoint.sh /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
