# Don't edit this file, user DockerfileTemplate and buildImage.sh
###############################################
FROM registry.services.alin.be/prom/node-exporter:v0.16.0
COPY localtime /etc/localtime
WORKDIR /
USER root
ADD curl-7.30.0.ermine.tar.bz2 .
RUN mv /curl-7.30.0.ermine/curl.ermine /bin/curl     && rm -Rf /curl-7.30.0.ermine
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD curl -f http://127.0.0.1:9100/ || exit 1
