FROM alpine:3.3

RUN apk --update add \
  nginx \
  php-fpm \
  php-pdo \
  php-json \
  php-openssl \
  php-mysql \
  php-pdo_mysql \
  php-mcrypt \
  php-sqlite3 \
  php-pdo_sqlite \
  php-ctype \
  php-zlib \
  php-curl \
  php-phar \
  php-xml \
  php-opcache \
  php-intl \
  php-bcmath \
  php-dom \
  php-xmlreader \
  curl \
  supervisor \
  && rm -rf /var/cache/apk/*

ADD docker/php/php.ini /etc/php/php.ini

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /etc/nginx
RUN mkdir -p /var/run/php-fpm
RUN mkdir -p /var/log/supervisor

RUN rm /etc/nginx/nginx.conf
ADD docker/nginx/nginx.conf /etc/nginx/nginx.conf

VOLUME ["/var/www", "/etc/nginx/sites-enabled"]

ADD docker/supervisor.d/nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

# install mariadb
RUN apk --update add \
  mariadb \
  mariadb-client

ADD docker/mysql/mariadb_init.sh /mariadb_init.sh
ADD docker/run.sh /run.sh
RUN chmod 775 *.sh

ADD docker/mysql/my.cnf /etc/mysql/my.cnf

# # Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 80 9000 3306

CMD ["sh", "run.sh"]
