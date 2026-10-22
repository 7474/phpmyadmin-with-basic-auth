FROM phpmyadmin/phpmyadmin:5.2.1

COPY config.user.inc.php /etc/phpmyadmin/config.user.inc.php

COPY basic-auth.conf /etc/apache2/conf-available
RUN a2enconf basic-auth

COPY docker-entrypoint-with-basic-auth.sh /docker-entrypoint-with-basic-auth.sh

ENTRYPOINT ["/docker-entrypoint-with-basic-auth.sh"]
CMD ["apache2-foreground"]
