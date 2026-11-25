FROM php:8.3-apache

RUN apt-get update \
 && apt-get install -y --no-install-recommends libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j"$(nproc)" mysqli gd \
 && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite \
 && sed -ri 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf
 RUN echo "session.save_path=/tmp" > /usr/local/etc/php/conf.d/session.ini

WORKDIR /var/www/html

CMD ["sh", "-c", "mkdir -p assets/uploads application/cache application/logs && chown -R www-data:www-data assets application/cache application/logs 2>/dev/null; exec apache2-foreground"]