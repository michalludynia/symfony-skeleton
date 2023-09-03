FROM php:8.1.23-apache

#install packages
RUN apt update
RUN apt install -y git  \
   zlib1g-dev \
   libzip-dev \
   unzip && \
   docker-php-ext-install zip;

#install composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ENV APACHE_DOCUMENT_ROOT /srv/api/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

#clone symfony skeleton code
COPY . /srv/api

RUN chown -R www-data:www-data /srv/api/public

#install vendor dependencies
WORKDIR /srv/api

RUN composer install