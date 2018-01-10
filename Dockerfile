FROM tomcat:8-alpine

ADD opengrok-1.1-rc18.tar.gz /
ADD ctags /usr/bin/ctags
ADD entrypoint.sh /entrypoint.sh

VOLUME [ "/data", "/source" ]
EXPOSE 8080

ENV OPENGROK_TOMCAT_BASE /usr/local/tomcat
ENV SRC_ROOT /source
ENV DATA_ROOT /data

RUN apk add --no-cache git subversion unzip && \
    ln -s /opengrok-1.1-rc18 /opengrok && \
    chmod -R +x /opengrok/bin && \
    mkdir -p /var/opengrok && \
    ln -s /data /var/opengrok/etc && \
    ln -s /source /var/opengrok/src && \
    /opengrok/bin/OpenGrok deploy

CMD ["/entrypoint.sh"]
