#!/bin/sh
printenv | awk '{print "export " $1}' > /root/env.sh
service cron start
docker-php-entrypoint php-fpm