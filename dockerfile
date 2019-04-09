FROM ubuntu:latest

USER root

RUN apt-get update
RUN apt-get install -y nginx nodejs

RUN rm -v /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/

ADD src/ServicePulse.Host/app /usr/share/nginx/html/
ADD src/ServicePulse.Host/app /var/www/html/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 90

CMD ["/usr/sbin/nginx"]