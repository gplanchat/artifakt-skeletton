#!/bin/sh
cp artifakt/Dockerfile /srv/www/php74fpm/
cd /srv/www/php74fpm/
docker-compose up -d --build
