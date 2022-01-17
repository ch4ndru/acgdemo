FROM ubuntu:18.04
# Install dependencies
RUN apt-get update -y
RUN apt-get install -y apache2
RUN mkdir /var/lib/apache2/runtime

# Install apache and write hello world message
RUN echo "Helloo Cloud Gurus!!!! This web page is running in a Docker container!" > /var/www/index.html


# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/lib/apache2/runtime

EXPOSE 8080

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
