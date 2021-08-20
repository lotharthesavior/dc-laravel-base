FROM php:7.4-fpm

WORKDIR /var/www/html

# RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update

COPY memory_limit.ini $PHP_INI_DIR/conf.d/

# update
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Install dependencies
RUN apt-get install -y libpq-dev libpng-dev

# Install php extensions
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
  && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
  && docker-php-ext-install pdo pdo_mysql mysqli \
  && docker-php-ext-install json \
  && docker-php-ext-install gd \
  &&  docker-php-ext-install pdo pdo_pgsql

#install some base extensions
RUN apt-get install -y libzip-dev zip \
  && docker-php-ext-install zip

# Install debug dependencies
RUN apt-get install git -y \
    && apt-get install vim -y \
    && apt-get install curl -y \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install mysql client for acceptance tests
RUN apt install wget libncurses6 -y
RUN wget https://repo.mysql.com/apt/debian/pool/mysql-8.0/m/mysql-community/mysql-community-client-plugins_8.0.25-1debian10_amd64.deb
RUN dpkg -i ./mysql-community-client-plugins_8.0.25-1debian10_amd64.deb
RUN rm mysql-community-client-plugins_8.0.25-1debian10_amd64.deb

RUN wget https://repo.mysql.com/apt/debian/pool/mysql-8.0/m/mysql-community/mysql-community-client-core_8.0.25-1debian10_amd64.deb
RUN dpkg -i ./mysql-community-client-core_8.0.25-1debian10_amd64.deb
RUN rm mysql-community-client-core_8.0.25-1debian10_amd64.deb

RUN wget https://repo.mysql.com/apt/debian/pool/mysql-8.0/m/mysql-community/mysql-common_8.0.25-1debian10_amd64.deb
RUN dpkg -i ./mysql-common_8.0.25-1debian10_amd64.deb
RUN rm mysql-common_8.0.25-1debian10_amd64.deb

RUN wget https://repo.mysql.com/apt/debian/pool/mysql-8.0/m/mysql-community/mysql-community-client_8.0.25-1debian10_amd64.deb
RUN dpkg -i ./mysql-community-client_8.0.25-1debian10_amd64.deb
RUN rm mysql-community-client_8.0.25-1debian10_amd64.deb

RUN wget https://repo.mysql.com/apt/debian/pool/mysql-8.0/m/mysql-community/mysql-client_8.0.25-1debian10_amd64.deb
RUN dpkg -i ./mysql-client_8.0.25-1debian10_amd64.deb
RUN rm mysql-client_8.0.25-1debian10_amd64.deb

# Install supervisor
# RUN apt install supervisor -y
# COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]