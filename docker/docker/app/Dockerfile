FROM php:8.0-fpm

ENV TZ Asia/Tokyo

RUN apt-get update && \
	apt-get install -y git unzip libzip-dev libicu-dev libonig-dev && \
	docker-php-ext-install intl pdo_mysql zip bcmath
		
COPY ./docker/app/php.ini /usr/local/etc/php/php.ini
COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer
COPY ./src /app

# node.jsとnpmをインストール
RUN apt-get install -y nodejs npm && npm install n -g && n 14.15.3

WORKDIR /app

# laravel用のコマンド実行
RUN composer update && cp .env.example .env && php artisan key:generate && chmod -R 777 storage bootstrap/cache