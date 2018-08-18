# Don't edit this file, user DockerfileTemplate and buildImage.sh
###############################################
FROM registry.services.alin.be/nginx:1.13.12-alpine
COPY .htpasswd /etc/nginx/.htpasswd
COPY conf.d /etc/nginx/conf.d/
COPY localtime /etc/localtime
RUN apk add --update bash curl
ENV NGINX_HOST prometheus.servicess.alin.be
ENV NGINX_PORT 80
HEALTHCHECK --interval=60s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1
