FROM prom/prometheus:v2.0.0-rc.2
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY localtime /etc/localtime
WORKDIR /
USER root
ADD curl-7.30.0.ermine.tar.bz2 .
RUN mv /curl-7.30.0.ermine/curl.ermine /bin/curl     && rm -Rf /curl-7.30.0.ermine
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD curl -f http://127.0.0.1:9090/ || exit 1
