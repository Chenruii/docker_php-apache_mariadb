FROM php:7.2-apache
LABEL maintainer="rui"
RUN docker-php-ext-install pdo_mysql
ENV APACHE_DOCUMENT_ROOT /application
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN useradd 'Rui'  --disabled passeword  --gecos '' Rui
RUN new groupadd 'IPSSI'
RUN new useradd 'Rui' with groupdd 'IPSSI'
