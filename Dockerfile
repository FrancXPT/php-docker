FROM php:8.3-apache
# COPY src/ /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN a2enmod rewrite
EXPOSE 80
