FROM php:7.1-apache

RUN apt-get update \
    && apt-get install -y libz-dev wget imagemagick libmagickwand-dev \
    && docker-php-ext-install opcache \
    && docker-php-ext-install calendar \
    && docker-php-ext-install gd \
    && pecl install imagick \
    && docker-php-ext-enable  imagick \
    && a2enmod rewrite \
    && a2enmod expires \
    && a2enmod deflate \
    && a2enmod headers

COPY php.ini /usr/local/etc/php/php.ini