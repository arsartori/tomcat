FROM alpine:3.17
LABEL maintainer="Andre Sartori <andre@aph.dev.br>"
ARG VERSION
RUN apk add --no-cache openjdk8-jre && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz -P /tmp && \
    tar xf /tmp/apache-tomcat-${VERSION}.tar.gz -C /opt && rm /tmp/apache-tomcat-${VERSION}.tar.gz && \ 
    mv /opt/apache-tomcat-${VERSION} tomcat && mv ./tomcat/webapps ./tomcat/webapps.dist && \
    mkdir -p /opt/tomcat/webapps && chmod u+x /opt/tomcat/bin/*.sh
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]