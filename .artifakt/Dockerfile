FROM php:8.0.8-fpm-buster

ARG GROUP_ID=501
ARG USER_ID=48
ARG DEBIAN_FRONTEND=noninteractive

RUN curl -sS https://getcomposer.org/installer | \
  php -- --2 --install-dir=/usr/local/bin --filename=composer

RUN groupadd -g ${GROUP_ID} opsworks \
 && useradd -g ${GROUP_ID} -u ${USER_ID} -d /var/www -s /bin/bash apache

RUN export COMPOSER_ALLOW_SUPERUSER=1

RUN mkdir -p /var/log/php-fpm \
 && touch /var/log/php-fpm/access.log \
 && touch /var/log/php-fpm/error.log \
 && chown apache:opsworks -R /var/log/php-fpm \
 && mkdir /var/www/.composer \
 && chown apache:opsworks -R /var/www/.composer

COPY ./www.conf /usr/local/etc/php-fpm.d/
COPY ./php.ini /usr/local/etc/php/

USER apache:opsworks
