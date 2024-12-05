FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx
CMD [ "nginx", "-g", "daemon off;" ]
COPY static-website/ /var/www/html/
