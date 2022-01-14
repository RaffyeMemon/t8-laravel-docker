FROM raffyememon/alpine-nginx-php74:latest

WORKDIR /app

RUN rm -rf /var/cache/apk/*


COPY ./config/nginx/conf.d/vhost.conf /opt/docker/etc/nginx/vhost.conf
COPY ./config/php/php.ini /opt/docker/etc/php/php.ini

COPY  --chown=nginx:nginx ./src/ /app
RUN chmod -R 777 /app/storage/


EXPOSE 80 443
RUN composer install -d /app
RUN php artisan optimize