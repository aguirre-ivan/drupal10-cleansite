FROM php:8.1-apache

RUN apt-get update && \
    apt-get install --yes --force-yes \
    cron g++ gettext libicu-dev openssl \
    libc-client-dev libkrb5-dev  \
    libxml2-dev libfreetype6-dev \
    libgd-dev libmcrypt-dev bzip2 \
    libpng-dev libjpeg-dev \
    libbz2-dev libtidy-dev libcurl4-openssl-dev \
    libz-dev libmemcached-dev libxslt-dev git-core libpq-dev \
    libzip4 libzip-dev libwebp-dev

# Extra
RUN apt-get install --yes wget vim vim-common

# PHP Configuration
RUN docker-php-ext-install bcmath calendar zip opcache intl &&\
    docker-php-ext-install mysqli pdo pdo_mysql &&\
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp &&\
    docker-php-ext-install gd &&\
    curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

# Apache Configuration
RUN a2enmod rewrite
RUN service apache2 restart

