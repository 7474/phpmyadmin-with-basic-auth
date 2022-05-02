FROM phpmyadmin/phpmyadmin:5.1.3

COPY basic-auth.conf /etc/apache2/conf-available
RUN a2enconf basic-auth

COPY docker-entrypoint-with-basic-auth.sh /docker-entrypoint-with-basic-auth.sh

ENTRYPOINT ["/docker-entrypoint-with-basic-auth.sh"]
CMD ["apache2-foreground"]
