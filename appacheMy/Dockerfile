FROM httpd:latest


COPY appacheMy/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY appacheMy/docs /usr/local/apache2/htdocs/

httpd-foreground
