FROM alpine:3.20
LABEL maintainer="Andre Sartori <andre@aph.dev.br>"
ARG VERSION
ENV TZ=America/Sao_Paulo
RUN apk add --no-cache openjdk8-jre tzdata && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz -P /tmp && \
    tar xf /tmp/apache-tomcat-${VERSION}.tar.gz -C /opt && rm /tmp/apache-tomcat-${VERSION}.tar.gz && \ 
    mv /opt/apache-tomcat-${VERSION} /opt/tomcat && chmod u+x /opt/tomcat/bin/*.sh
WORKDIR /opt/tomcat
EXPOSE 8080 8443
CMD ["/opt/tomcat/bin/catalina.sh","run"]
