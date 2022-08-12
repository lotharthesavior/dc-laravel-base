#!/bin/bash

chmod -R 777 /var/www/html/storage
chmod -R 777 /var/www/html/bootstrap/cache

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
