# Don't edit this file, user DockerfileTemplate and buildImage.sh
###############################################
FROM registry.services.alin.be/prom/alertmanager:v0.15.0-rc.1
COPY config.yml /etc/alertmanager/config.yml
COPY localtime /etc/localtime
WORKDIR /
USER root
ADD curl-7.30.0.ermine.tar.bz2 .
RUN mv /curl-7.30.0.ermine/curl.ermine /bin/curl && rm -Rf /curl-7.30.0.ermine
HEALTHCHECK --interval=60s --timeout=10s --retries=3 CMD curl -f http://127.0.0.1:9093/ || exit 1
