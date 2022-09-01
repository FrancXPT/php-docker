FROM php:7.4-fpm-buster
# COPY src/ /var/www/html
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN cd /tmp \
    && curl -sSL https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz > ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xzf ioncube_loaders_lin_x86-64.tar.gz \
    && mv ioncube /usr/local \
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && cat /usr/local/etc/php/php.ini > saved_php.ini \
    && echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.4.so" >> /usr/local/etc/php/php.ini \
    && cat saved_php.ini >> /usr/local/etc/php/php.ini
EXPOSE 80
