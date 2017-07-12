FROM openjdk:8-alpine
MAINTAINER "Tema Bolshakov <abolshakov@spbtv.com>"

# Raise max file descriptors
COPY ansible/files/security-nofiles-limit.conf /etc/security/limits.d/20-nofiles.conf

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates

RUN wget "http://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.2.5/gatling-charts-highcharts-bundle-2.2.5-bundle.zip" -O gatling.zip && \
    unzip gatling.zip && \
    rm gatling.zip && \
    mv gatling-charts-highcharts-bundle-2.2.5 /gatling

RUN mkdir -p /gatling/logs && \
    mkdir -p /gatling/reports && \
    mkdir -p /gatling/results

WORKDIR '/gatling'
ENTRYPOINT ["/gatling/bin/gatling.sh"]

